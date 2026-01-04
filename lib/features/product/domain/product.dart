import 'package:flutter/foundation.dart';

enum ProductStatus {
  pending,
  active,
  sold,
  cancelled;

  String get displayName => name[0].toUpperCase() + name.substring(1);
}

class Product {
  final String id;
  final String title;
  final double price;
  final String currency;
  final int quantity;
  final String? condition;
  final String? description;
  final String categoryId;
  /// Category object if included in API response
  final Map<String, dynamic>? category; 
  final String? sellerId;
  /// Seller object if included in API response
  final Map<String, dynamic>? seller;
  
  final List<String> images;
  final Map<String, dynamic> dynamicAttributes;
  final Map<String, dynamic> attributes;
  final Map<String, dynamic>? shipping;
  final Map<String, dynamic>? location;
  final List<String> tags;
  final ProductStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;

  // Additional fields from API docs
  final bool featured;
  final String? returnPolicy;
  final bool authenticationRequired;
  final bool shippingIncluded;
  final double? commissionRate;
  final double? buyerPremium;
  final Map<String, dynamic>? paymentTerms;
  final double? distanceKm; // For nearby search results

  Product({
    required this.id,
    required this.title,
    required this.price,
    this.currency = 'INR',
    this.quantity = 1,
    this.condition,
    this.description,
    required this.categoryId,
    this.category,
    this.sellerId,
    this.seller,
    this.images = const [],
    this.dynamicAttributes = const {},
    this.attributes = const {},
    this.shipping,
    this.location,
    this.tags = const [],
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.featured = false,
    this.returnPolicy,
    this.authenticationRequired = false,
    this.shippingIncluded = false,
    this.commissionRate,
    this.buyerPremium,
    this.paymentTerms,
    this.distanceKm,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    try {
      return Product(
        id: json['id'] ?? '',
        title: json['title'] ?? json['productName'] ?? 'No Title',
        price: _parseDouble(json['price']) ?? _parseDouble(json['product_price']) ?? 0.0,
        currency: json['currency'] ?? 'INR',
        quantity: json['quantity'] ?? 1,
        condition: json['condition'],
        description: json['description'],
        categoryId: json['category_id'] ?? (json['category'] != null ? json['category']['id'] : ''),
        category: json['category'] is Map<String, dynamic> ? json['category'] : null,
        sellerId: json['seller_id'],
        seller: json['seller'] is Map<String, dynamic> ? json['seller'] : null,
        images: json['images'] is List ? List<String>.from(json['images']) : [],
        dynamicAttributes: json['dynamic_attributes'] is Map<String, dynamic> ? json['dynamic_attributes'] : {},
        attributes: json['attributes'] is Map<String, dynamic> ? json['attributes'] : {},
        shipping: json['shipping'] is Map<String, dynamic> ? json['shipping'] : null,
        location: json['location'] is Map<String, dynamic> ? json['location'] : null,
        tags: json['tags'] is List ? List<String>.from(json['tags']) : [],
        status: ProductStatus.values.firstWhere(
          (e) => e.name == json['status'],
          orElse: () => ProductStatus.pending,
        ),
        createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
        updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
        featured: json['featured'] ?? false,
        returnPolicy: json['return_policy'],
        authenticationRequired: json['authentication_required'] ?? false,
        shippingIncluded: json['shipping_included'] ?? false,
        commissionRate: _parseDouble(json['commission_rate']),
        buyerPremium: _parseDouble(json['buyer_premium']),
        paymentTerms: json['payment_terms'] is Map<String, dynamic> ? json['payment_terms'] : null,
        distanceKm: _parseDouble(json['distance_km']),
      );
    } catch (e) {
      print('📦 PRODUCT: Error parsing product JSON: $e');
      print('📦 PRODUCT: JSON: $json');
      rethrow;
    }
  }

  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}
