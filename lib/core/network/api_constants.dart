class ApiConstants {
  // Base URLs
  static const String baseUrl = 'https://api.ebidportal.com';
  static const String apiVersion = 'v1';
  static const String apiBaseUrl = '$baseUrl/api/$apiVersion';

  // Authentication endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String refreshToken = '/auth/refresh';
  static const String logout = '/auth/logout';

  // Auction endpoints
  static const String auctions = '/auctions';
  static const String myAuctions = '/auctions/my';
  static const String auctionSearch = '/auctions/search';
  static const String auctionStats = '/auctions/statistics';
  static const String auctionBids = '/auctions/{id}/bids';
  static const String placeBid = '/auctions/{id}/bid';

  // Category endpoints
  static const String categories = '/categories';
  static const String categoryTemplates = '/categories/{id}/templates';

  // File upload endpoints
  static const String uploadImage = '/upload/image';
  static const String uploadMultiple = '/upload/multiple';
  static const String uploadProductImages = '/products/upload-images';

  // User endpoints (under /api/v1)
  static const String profile = '/users/profile';
  static const String updateProfile = '/users/profile';
  static const String userAuctions = '/users/{id}/auctions';
  
  // Auth user endpoint (at root level)
  static const String me = '/auth/me';

  // Watchlist endpoints
  static const String watchlist = '/watchlist';
  static const String addToWatchlist = '/watchlist/{id}';
  static const String removeFromWatchlist = '/watchlist/{id}';

  // HTTP Headers
  static const String contentTypeHeader = 'Content-Type';
  static const String authorizationHeader = 'Authorization';
  static const String acceptHeader = 'Accept';

  // Content Types
  static const String jsonContentType = 'application/json';
  static const String formDataContentType = 'multipart/form-data';

  // Request timeouts (in milliseconds)
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  static const int sendTimeout = 30000;
}