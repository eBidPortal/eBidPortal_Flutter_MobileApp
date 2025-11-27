class ApiConstants {
  // Base URL from documentation
  static const String baseUrl = 'https://api.ebidportal.com/api/v1';
  static const String authUrl = 'https://api.ebidportal.com/auth';

  // Auth Endpoints
  static const String login = '$authUrl/login';
  static const String register = '$authUrl/register';
  static const String me = '$authUrl/me';

  // Core Endpoints
  static const String addresses = '$baseUrl/addresses';
  static const String auctions = '$baseUrl/auctions';
  static const String categories = '$baseUrl/catalog/categories';
  
  // Timeouts
  static const int connectTimeout = 15000; // 15s
  static const int receiveTimeout = 15000; // 15s
}
