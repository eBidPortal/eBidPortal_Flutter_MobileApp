import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import '../../../core/network/api_client.dart';
import '../../../core/network/api_constants.dart';

class ImageUploadResult {
  final String url;
  final String? thumbnailUrl;
  final String filename;
  final int size;
  final int? width;
  final int? height;
  final String contentType;
  final int uploadTimeMs;

  ImageUploadResult({
    required this.url,
    this.thumbnailUrl,
    required this.filename,
    required this.size,
    this.width,
    this.height,
    required this.contentType,
    required this.uploadTimeMs,
  });

  factory ImageUploadResult.fromJson(Map<String, dynamic> json) {
    return ImageUploadResult(
      url: json['url'],
      thumbnailUrl: json['thumbnail_url'],
      filename: json['filename'],
      size: json['size'],
      width: json['width'],
      height: json['height'],
      contentType: json['content_type'],
      uploadTimeMs: json['upload_time_ms'],
    );
  }
}

class ImageUploadService {
  final ApiClient _apiClient;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  ImageUploadService(this._apiClient);

  /// Upload a single auction image using backend API
  Future<ImageUploadResult> uploadAuctionImage(File image, String auctionId) async {
    try {
      final formData = FormData.fromMap({
        'images': await MultipartFile.fromFile(
          image.path,
          filename: path.basename(image.path),
        ),
      });

      final response = await _apiClient.dio.post(
        ApiConstants.uploadProductImages,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.data['success'] == true) {
        final imageData = response.data['data']['images'][0];
        return ImageUploadResult.fromJson(imageData);
      } else {
        throw Exception('Upload failed: ${response.data['message']}');
      }
    } catch (e) {
      // Fallback to Firebase Storage if backend upload fails
      print('Backend upload failed, falling back to Firebase: $e');
      return await _uploadToFirebase(image, auctionId);
    }
  }

  /// Upload multiple auction images using backend API
  Future<List<ImageUploadResult>> uploadMultipleImages(
    List<File> images,
    String auctionId,
  ) async {
    try {
      final formData = FormData();
      for (final image in images) {
        formData.files.add(MapEntry(
          'images',
          await MultipartFile.fromFile(
            image.path,
            filename: path.basename(image.path),
          ),
        ));
      }

      final response = await _apiClient.dio.post(
        ApiConstants.uploadProductImages,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.data['success'] == true) {
        final imagesData = response.data['data']['images'] as List;
        return imagesData.map((json) => ImageUploadResult.fromJson(json)).toList();
      } else {
        throw Exception('Upload failed: ${response.data['message']}');
      }
    } catch (e) {
      // Fallback to Firebase Storage if backend upload fails
      print('Backend upload failed, falling back to Firebase: $e');
      return await _uploadMultipleToFirebase(images, auctionId);
    }
  }

  /// Upload with progress tracking using backend API
  Stream<double> uploadWithProgress(File image, String auctionId) async* {
    try {
      final formData = FormData.fromMap({
        'images': await MultipartFile.fromFile(
          image.path,
          filename: path.basename(image.path),
        ),
      });

      final response = await _apiClient.dio.post(
        ApiConstants.uploadProductImages,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
        onSendProgress: (sent, total) {
          if (total != -1) {
            // Note: This callback might not work as expected with Dio
            // Progress tracking is handled differently
          }
        },
      );

      // Since we can't track progress easily with Dio for multipart,
      // we'll simulate progress
      yield 0.5; // 50% - starting upload
      yield 1.0; // 100% - completed

      if (response.data['success'] != true) {
        throw Exception('Upload failed: ${response.data['message']}');
      }
    } catch (e) {
      // Fallback to Firebase Storage with real progress tracking
      print('Backend upload failed, falling back to Firebase: $e');
      yield* _uploadToFirebaseWithProgress(image, auctionId);
    }
  }

  /// Delete an image from storage
  Future<void> deleteImage(String imageUrl) async {
    try {
      final ref = _storage.refFromURL(imageUrl);
      await ref.delete();
    } catch (e) {
      throw Exception('Failed to delete image: $e');
    }
  }

  /// Fallback: Upload single image to Firebase Storage
  Future<ImageUploadResult> _uploadToFirebase(File image, String auctionId) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = '${timestamp}_${path.basename(image.path)}';
    final ref = _storage.ref().child('auctions/$auctionId/$fileName');

    final uploadTask = ref.putFile(image);
    final snapshot = await uploadTask;
    final downloadUrl = await snapshot.ref.getDownloadURL();

    return ImageUploadResult(
      url: downloadUrl,
      filename: fileName,
      size: await image.length(),
      contentType: 'image/jpeg', // Default assumption
      uploadTimeMs: 0, // Not tracked for Firebase fallback
    );
  }

  /// Fallback: Upload multiple images to Firebase Storage
  Future<List<ImageUploadResult>> _uploadMultipleToFirebase(
    List<File> images,
    String auctionId,
  ) async {
    final uploadFutures = images.map(
      (image) => _uploadToFirebase(image, auctionId),
    );
    return await Future.wait(uploadFutures);
  }

  /// Fallback: Upload with progress tracking to Firebase Storage
  Stream<double> _uploadToFirebaseWithProgress(File image, String auctionId) async* {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = '${timestamp}_${path.basename(image.path)}';
    final ref = _storage.ref().child('auctions/$auctionId/$fileName');

    final uploadTask = ref.putFile(image);

    await for (final snapshot in uploadTask.snapshotEvents) {
      final progress = snapshot.bytesTransferred / snapshot.totalBytes;
      yield progress;
    }
  }
}
