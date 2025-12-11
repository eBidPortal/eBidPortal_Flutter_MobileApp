import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';
import '../domain/auction.dart';
import '../domain/watchlist_item.dart';

final auctionRepositoryProvider = Provider<AuctionRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuctionRepository(apiClient);
});

class AuctionRepository {
  final ApiClient _apiClient;

  AuctionRepository(this._apiClient);

  Future<List<Auction>> getAuctions({
    int page = 1,
    int limit = 20,
    String? categoryId,
    String? search,
    String? status,
  }) async {
    try {
      print('🏛️ AUCTION_REPO: getAuctions called with categoryId: $categoryId, search: $search, status: $status');
      
      final queryParams = {
        'page': page,
        'limit': limit,
        if (categoryId != null) 'category_id': categoryId,
        if (search != null) 'q': search,
        if (status != null) 'status': status,
      };

      print('🏛️ AUCTION_REPO: Query params: $queryParams');
      print('🏛️ AUCTION_REPO: Calling endpoint: ${ApiConstants.auctions}');

      final response = await _apiClient.get(
        ApiConstants.auctions, // Use basic auctions endpoint instead of search
        queryParameters: queryParams,
      );

      print('🏛️ AUCTION_REPO: Response status: ${response.statusCode}');
      print('🏛️ AUCTION_REPO: Response data type: ${response.data.runtimeType}');
      print('🏛️ AUCTION_REPO: Response data: ${response.data}');
      print('🏛️ AUCTION_REPO: Response data is null: ${response.data == null}');
      print('🏛️ AUCTION_REPO: Response data is Map: ${response.data is Map}');

      // Check if response.data exists and is a Map
      if (response.data == null) {
        print('🏛️ AUCTION_REPO: Response data is null, returning empty list');
        return [];
      }

      if (response.data is! Map<String, dynamic>) {
        print('🏛️ AUCTION_REPO: Response data is not a Map, type: ${response.data.runtimeType}');
        throw Exception('Invalid response format: expected Map, got ${response.data.runtimeType}');
      }

      if (response.data['success'] == true) {
        print('🏛️ AUCTION_REPO: API call successful');
        
        // Check if data exists and has auctions
        if (response.data['data'] != null && response.data['data']['auctions'] != null) {
          final List<dynamic> data = response.data['data']['auctions'];
          print('🏛️ AUCTION_REPO: Found ${data.length} auctions');
          return data.map((json) => Auction.fromJson(json)).toList();
        } else {
          print('🏛️ AUCTION_REPO: No auctions data found in response');
          return []; // Return empty list instead of throwing error
        }
      } else {
        print('🏛️ AUCTION_REPO: API returned success=false: ${response.data['message']}');
        throw Exception(response.data['message'] ?? 'Failed to fetch auctions');
      }
    } on DioException catch (e) {
      print('🏛️ AUCTION_REPO: DioException: ${e.message}');
      print('🏛️ AUCTION_REPO: Response data: ${e.response?.data}');
      throw Exception(e.response?.data['message'] ?? 'Network error');
    } catch (e) {
      print('🏛️ AUCTION_REPO: Unexpected error: $e');
      throw Exception('Unexpected error: $e');
    }
  }

  Future<Auction> getAuctionById(String auctionId) async {
    try {
      final response = await _apiClient.get(
        '${ApiConstants.auctions}/$auctionId',
      );

      if (response.data['success'] == true) {
        return Auction.fromJson(response.data['data']);
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch auction');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  Future<Map<String, dynamic>> createAuction({
    required String title,
    required String description,
    required double startPrice,
    double? currentPrice,
    double? reservePrice,
    required String categoryId,
    required DateTime startTime,
    required DateTime endTime,
    required String type,
    required List<String> images,
    List<String> tags = const [],
    Map<String, dynamic> dynamicFields = const {},
    String? returnPolicy,
    // Professional auction fields
    bool authenticationRequired = false,
    bool shippingIncluded = false,
    double? bidIncrement,
    double? commissionRate,
    double? buyerPremium,
    String? timezone,
    Map<String, dynamic> paymentTerms = const {},
    String? lotNumber,
    bool reserveVisible = false,
    String? businessLicense,
    String? sellerRating,
    String? catalogReference,
    String? auctioneerNotes,
    String? conditionReport,
    String? appraisalCertificate,
    List<Map<String, dynamic>> financingOptions = const [],
    bool insuranceRequired = false,
    bool pickupAvailable = false,
    String? status,
  }) async {
    try {
      // Use only dynamic fields from category template for dynamic_attributes
      // Titlde are now handled as part of the dynamic template fields
      final dynamicAttributes = Map<String, dynamic>.from(dynamicFields);

      // Ensure productName exists in dynamic attributes (fallback to title if not provided by template)
      if (!dynamicAttributes.containsKey('productName') && title.isNotEmpty) {
        dynamicAttributes['productName'] = title;
      }

      // Ensure description exists in dynamic attributes (fallback if not provided by template)
      if (!dynamicAttributes.containsKey('description') &&
          description.isNotEmpty) {
        dynamicAttributes['description'] = description;
      }

      final requestBody = {
        'category_id': categoryId,
        'dynamic_attributes': dynamicAttributes,
        'start_price': startPrice,
        'current_price': currentPrice ?? startPrice, // Use provided current_price or default to start_price
        if (reservePrice != null) 'reserve_price': reservePrice,
        'start_time': startTime.toIso8601String(),
        'end_time': endTime.toIso8601String(),
        'type': type,
        if (tags.isNotEmpty) 'tags': tags,
        if (returnPolicy != null) 'return_policy': returnPolicy,
        // Professional auction fields
        'authentication_required': authenticationRequired,
        'shipping_included': shippingIncluded,
        if (bidIncrement != null) 'bid_increment': bidIncrement,
        if (commissionRate != null) 'commission_rate': commissionRate,
        if (buyerPremium != null) 'buyer_premium': buyerPremium,
        if (timezone != null) 'timezone': timezone,
        if (paymentTerms.isNotEmpty) 'payment_terms': paymentTerms,
        if (lotNumber != null) 'lot_number': lotNumber,
        'reserve_visible': reserveVisible,
        if (businessLicense != null) 'business_license': businessLicense,
        if (sellerRating != null) 'seller_rating': double.tryParse(sellerRating),
        if (catalogReference != null) 'catalog_reference': catalogReference,
        if (auctioneerNotes != null) 'auctioneer_notes': auctioneerNotes,
        if (conditionReport != null && conditionReport.isNotEmpty) 'condition_report': conditionReport,
        if (appraisalCertificate != null) 'appraisal_certificate': appraisalCertificate,
        if (financingOptions.isNotEmpty) 'financing_options': financingOptions,
        'insurance_required': insuranceRequired,
        'pickup_available': pickupAvailable,
        if (status != null) 'status': status,
      };

      print('🔄 AuctionRepository: Creating auction with payload:');
      print(requestBody);

      final response = await _apiClient.post(
        ApiConstants.auctions,
        data: requestBody,
      );

      if (response.data['success'] == true) {
        return response.data['data'];
      } else {
        throw Exception(response.data['message'] ?? 'Failed to create auction');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  Future<List<WatchlistItem>> getWatchlist({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final queryParams = {'page': page, 'limit': limit};

      final response = await _apiClient.get(
        ApiConstants.watchlist,
        queryParameters: queryParams,
      );

      if (response.data['success'] == true) {
        final List<dynamic> data = response.data['data']['watchlist'];
        return data.map((json) => WatchlistItem.fromJson(json)).toList();
      } else {
        throw Exception(
          response.data['message'] ?? 'Failed to fetch watchlist',
        );
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  Future<void> addToWatchlist(String auctionId) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.watchlist,
        data: {'auction_id': auctionId},
      );

      if (response.data['success'] != true) {
        throw Exception(
          response.data['message'] ?? 'Failed to add to watchlist',
        );
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  Future<void> removeFromWatchlist(String auctionId) async {
    try {
      final response = await _apiClient.delete(
        '${ApiConstants.watchlist}/$auctionId',
      );

      if (response.data['success'] != true) {
        throw Exception(
          response.data['message'] ?? 'Failed to remove from watchlist',
        );
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }
}
