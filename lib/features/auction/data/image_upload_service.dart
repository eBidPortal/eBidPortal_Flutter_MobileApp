import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class ImageUploadService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Upload a single auction image
  Future<String> uploadAuctionImage(File image, String auctionId) async {
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = '${timestamp}_${path.basename(image.path)}';
      final ref = _storage.ref().child('auctions/$auctionId/$fileName');

      final uploadTask = ref.putFile(image);
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }

  /// Upload multiple auction images
  Future<List<String>> uploadMultipleImages(
    List<File> images,
    String auctionId,
  ) async {
    try {
      final uploadFutures = images.map(
        (image) => uploadAuctionImage(image, auctionId),
      );
      return await Future.wait(uploadFutures);
    } catch (e) {
      throw Exception('Failed to upload images: $e');
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

  /// Upload with progress tracking
  Stream<double> uploadWithProgress(File image, String auctionId) async* {
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
