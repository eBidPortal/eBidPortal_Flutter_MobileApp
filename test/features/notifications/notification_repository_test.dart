import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dio/dio.dart';
import '../../../lib/core/network/api_client.dart';
import '../../../lib/features/notifications/data/notification_repository.dart';

// Generate mocks
@GenerateMocks([ApiClient])
import 'notification_repository_test.mocks.dart';

void main() {
  late NotificationRepository repository;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    repository = NotificationRepository(mockApiClient);
  });

  group('NotificationRepository', () {
    const testFcmToken = 'test_fcm_token_123';
    const testPlatform = 'Android';
    const testDeviceName = 'Test Device';
    const testAppVersion = '1.0.0';

    test('registerFCMToken should call API with correct parameters', () async {
      // Arrange
      final expectedResponse = Response(
        requestOptions: RequestOptions(path: '/notifications/fcm-token'),
        statusCode: 200,
        data: {
          'success': true,
          'message': 'FCM token registered successfully',
          'data': {
            'device_id': 5,
            'status': 'created',
            'fcm_token': testFcmToken,
            'platform': testPlatform,
          }
        },
      );

      when(mockApiClient.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => expectedResponse);

      // Act
      final result = await repository.registerFCMToken(
        fcmToken: testFcmToken,
        platform: testPlatform,
        deviceName: testDeviceName,
        appVersion: testAppVersion,
      );

      // Assert
      verify(mockApiClient.post(
        '/notifications/register-device',
        data: {
          'device_token': testFcmToken,
          'device_type': testPlatform.toLowerCase(),
          'device_name': testDeviceName,
          'app_version': testAppVersion,
        },
      )).called(1);

      expect(result, expectedResponse);
    });

    test('registerFCMToken should handle optional parameters', () async {
      // Arrange
      final expectedResponse = Response(
        requestOptions: RequestOptions(path: '/notifications/fcm-token'),
        statusCode: 200,
        data: {
          'success': true,
          'message': 'FCM token registered successfully',
        },
      );

      when(mockApiClient.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => expectedResponse);

      // Act
      final result = await repository.registerFCMToken(
        fcmToken: testFcmToken,
      );

      // Assert
      verify(mockApiClient.post(
        '/notifications/fcm-token',
        data: {
          'fcm_token': testFcmToken,
        },
      )).called(1);

      expect(result, expectedResponse);
    });

    test('removeFCMToken should call API with correct parameters', () async {
      // Arrange
      final expectedResponse = Response(
        requestOptions: RequestOptions(path: '/notifications/fcm-token'),
        statusCode: 200,
        data: {
          'success': true,
          'message': 'FCM token removed successfully',
        },
      );

      when(mockApiClient.delete(any, data: anyNamed('data')))
          .thenAnswer((_) async => expectedResponse);

      // Act
      final result = await repository.removeFCMToken(testFcmToken);

      // Assert
      verify(mockApiClient.delete(
        '/notifications/fcm-token',
        data: {'fcm_token': testFcmToken},
      )).called(1);

      expect(result, expectedResponse);
    });

    test('registerFCMToken should throw exception on API error', () async {
      // Arrange
      when(mockApiClient.post(any, data: anyNamed('data')))
          .thenThrow(Exception('API Error'));

      // Act & Assert
      expect(
        () => repository.registerFCMToken(fcmToken: testFcmToken),
        throwsA(isA<Exception>()),
      );
    });

    test('removeFCMToken should throw exception on API error', () async {
      // Arrange
      when(mockApiClient.delete(any, data: anyNamed('data')))
          .thenThrow(Exception('API Error'));

      // Act & Assert
      expect(
        () => repository.removeFCMToken(testFcmToken),
        throwsA(isA<Exception>()),
      );
    });
  });
}