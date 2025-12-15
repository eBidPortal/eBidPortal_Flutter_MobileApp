import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../storage/storage_service.dart';
import '../../features/auth/presentation/auth_provider.dart';

final tokenManagerProvider = Provider<TokenManager>((ref) {
  return TokenManager(ref);
});

class TokenManager {
  final Ref _ref;
  
  TokenManager(this._ref);
  
  /// Check if token needs refresh (expires within 10 minutes)
  Future<bool> needsRefresh() async {
    try {
      final storage = _ref.read(storageServiceProvider);
      final expiry = await storage.getTokenExpiry();
      
      if (expiry == null) {
        print('🔄 TOKEN_MANAGER: No expiry set, needs refresh');
        return true;
      }
      
      final now = DateTime.now();
      final needsRefresh = now.isAfter(expiry.subtract(const Duration(minutes: 10)));
      
      print('🔄 TOKEN_MANAGER: Token expires at ${expiry.toIso8601String()}, needs refresh: $needsRefresh');
      return needsRefresh;
      
    } catch (e) {
      print('🔄 TOKEN_MANAGER: Error checking token expiry: $e');
      return true;
    }
  }
  
  /// Get token health status
  Future<TokenHealth> getTokenHealth() async {
    try {
      final storage = _ref.read(storageServiceProvider);
      final token = await storage.getToken();
      
      if (token == null) {
        return TokenHealth(
          status: TokenStatus.missing,
          message: 'No access token found',
        );
      }
      
      final expiry = await storage.getTokenExpiry();
      if (expiry == null) {
        return TokenHealth(
          status: TokenStatus.unknown,
          message: 'Token expiry not set',
        );
      }
      
      final now = DateTime.now();
      if (now.isAfter(expiry)) {
        return TokenHealth(
          status: TokenStatus.expired,
          message: 'Token expired at ${expiry.toIso8601String()}',
          expiry: expiry,
        );
      }
      
      if (now.isAfter(expiry.subtract(const Duration(minutes: 10)))) {
        return TokenHealth(
          status: TokenStatus.expiringSoon,
          message: 'Token expires soon at ${expiry.toIso8601String()}',
          expiry: expiry,
        );
      }
      
      return TokenHealth(
        status: TokenStatus.valid,
        message: 'Token valid until ${expiry.toIso8601String()}',
        expiry: expiry,
      );
      
    } catch (e) {
      return TokenHealth(
        status: TokenStatus.error,
        message: 'Error checking token: $e',
      );
    }
  }
  
  /// Proactively refresh token if needed
  Future<bool> ensureTokenValid() async {
    try {
      print('🔄 TOKEN_MANAGER: Ensuring token validity...');
      
      final health = await getTokenHealth();
      print('🔄 TOKEN_MANAGER: Token health: ${health.status.name} - ${health.message}');
      
      if (health.status == TokenStatus.missing || 
          health.status == TokenStatus.expired) {
        print('🔄 TOKEN_MANAGER: Token missing or expired, user needs to login');
        return false;
      }
      
      if (health.status == TokenStatus.expiringSoon || 
          health.status == TokenStatus.unknown) {
        print('🔄 TOKEN_MANAGER: Token needs refresh, attempting...');
        final refreshSuccess = await _ref.read(authProvider.notifier).refreshToken();
        
        if (refreshSuccess) {
          print('🔄 TOKEN_MANAGER: Token refreshed successfully');
          return true;
        } else {
          print('🔄 TOKEN_MANAGER: Token refresh failed');
          return false;
        }
      }
      
      print('🔄 TOKEN_MANAGER: Token is valid');
      return true;
      
    } catch (e) {
      print('🔄 TOKEN_MANAGER: Error ensuring token validity: $e');
      return false;
    }
  }
  
  /// Get time until token expires
  Future<Duration?> getTimeUntilExpiry() async {
    try {
      final storage = _ref.read(storageServiceProvider);
      final expiry = await storage.getTokenExpiry();
      
      if (expiry == null) return null;
      
      final now = DateTime.now();
      if (now.isAfter(expiry)) return Duration.zero;
      
      return expiry.difference(now);
      
    } catch (e) {
      print('🔄 TOKEN_MANAGER: Error getting time until expiry: $e');
      return null;
    }
  }
  
  /// Format expiry time for display
  Future<String> getExpiryDisplay() async {
    try {
      final timeUntilExpiry = await getTimeUntilExpiry();
      
      if (timeUntilExpiry == null) {
        return 'Unknown expiry';
      }
      
      if (timeUntilExpiry.isNegative || timeUntilExpiry == Duration.zero) {
        return 'Expired';
      }
      
      if (timeUntilExpiry.inDays > 0) {
        return 'Expires in ${timeUntilExpiry.inDays} day(s)';
      } else if (timeUntilExpiry.inHours > 0) {
        return 'Expires in ${timeUntilExpiry.inHours} hour(s)';
      } else if (timeUntilExpiry.inMinutes > 0) {
        return 'Expires in ${timeUntilExpiry.inMinutes} minute(s)';
      } else {
        return 'Expires in ${timeUntilExpiry.inSeconds} second(s)';
      }
      
    } catch (e) {
      return 'Error: $e';
    }
  }
}

enum TokenStatus {
  valid,
  expiringSoon,
  expired,
  missing,
  unknown,
  error,
}

class TokenHealth {
  final TokenStatus status;
  final String message;
  final DateTime? expiry;
  
  const TokenHealth({
    required this.status,
    required this.message,
    this.expiry,
  });
  
  bool get isHealthy => status == TokenStatus.valid || status == TokenStatus.expiringSoon;
  bool get needsLogin => status == TokenStatus.missing || status == TokenStatus.expired;
  bool get needsRefresh => status == TokenStatus.expiringSoon || status == TokenStatus.unknown;
}