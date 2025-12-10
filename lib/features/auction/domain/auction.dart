class Auction {
  final String id;
  final String? sellerId;
  final String categoryId;
  final Map<String, dynamic> dynamicAttributes;
  final double startPrice;
  final double currentPrice;
  final double? reservePrice;
  final DateTime startTime;
  final DateTime endTime;
  final AuctionStatus status;
  final AuctionType type;
  final List<String> tags;
  final String? returnPolicy;
  final DateTime createdAt;
  final DateTime updatedAt;

  // Professional auction fields
  final bool? authenticationRequired;
  final bool? shippingIncluded;
  final double? bidIncrement;
  final double? commissionRate;
  final double? buyerPremium;
  final String? timezone;
  final Map<String, dynamic>? paymentTerms;
  final String? lotNumber;
  final String? conditionReport;
  final String? biddingRules;

  Auction({
    required this.id,
    this.sellerId,
    required this.categoryId,
    required this.dynamicAttributes,
    required this.startPrice,
    required this.currentPrice,
    this.reservePrice,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.type,
    required this.tags,
    this.returnPolicy,
    required this.createdAt,
    required this.updatedAt,
    // Professional auction fields
    this.authenticationRequired,
    this.shippingIncluded,
    this.bidIncrement,
    this.commissionRate,
    this.buyerPremium,
    this.timezone,
    this.paymentTerms,
    this.lotNumber,
    this.conditionReport,
    this.biddingRules,
  });

  factory Auction.fromJson(Map<String, dynamic> json) {
    try {
      print('🏛️ AUCTION: Parsing auction JSON: ${json['id']}');
      print('🏛️ AUCTION: Full JSON: $json');
      
      return Auction(
        id: json['id'] ?? '',
        sellerId: json['seller_id'],
        categoryId: json['category_id'] ?? '',
        dynamicAttributes: json['dynamic_attributes'] is Map<String, dynamic> 
            ? json['dynamic_attributes'] 
            : {},
        startPrice: _parseDouble(json['start_price']) ?? 0.0,
        currentPrice: _parseDouble(json['current_price']) ?? 0.0,
        reservePrice: _parseDouble(json['reserve_price']),
        startTime: json['start_time'] != null 
            ? DateTime.parse(json['start_time']) 
            : json['startTime'] != null 
                ? DateTime.parse(json['startTime']) 
                : DateTime.now(),
        endTime: json['end_time'] != null 
            ? DateTime.parse(json['end_time']) 
            : json['endTime'] != null 
                ? DateTime.parse(json['endTime']) 
                : DateTime.now().add(const Duration(days: 7)),
        status: AuctionStatus.values.firstWhere(
          (e) => e.name == json['status'],
          orElse: () => AuctionStatus.pending,
        ),
        type: AuctionType.values.firstWhere(
          (e) => e.name == json['type'],
          orElse: () => AuctionType.english,
        ),
        tags: json['tags'] is List 
            ? List<String>.from(json['tags']) 
            : json['tags'] is String 
                ? [json['tags']] 
                : [],
        returnPolicy: json['return_policy'],
        createdAt: json['created_at'] != null 
            ? DateTime.parse(json['created_at']) 
            : json['createdAt'] != null 
                ? DateTime.parse(json['createdAt']) 
                : DateTime.now(),
        updatedAt: json['updated_at'] != null 
            ? DateTime.parse(json['updated_at']) 
            : json['updatedAt'] != null 
                ? DateTime.parse(json['updatedAt']) 
                : DateTime.now(),
        // Professional auction fields
        authenticationRequired: json['authentication_required'],
        shippingIncluded: json['shipping_included'],
        bidIncrement: _parseDouble(json['bid_increment']),
        commissionRate: _parseDouble(json['commission_rate']),
        buyerPremium: _parseDouble(json['buyer_premium']),
        timezone: json['timezone'],
        paymentTerms: json['payment_terms'] is Map<String, dynamic> 
            ? json['payment_terms'] 
            : null,
        lotNumber: json['lot_number'],
        conditionReport: _parseConditionReport(json['condition_report']),
        biddingRules: _parseBiddingRules(json['bidding_rules']),
      );
    } catch (e) {
      print('🏛️ AUCTION: Error parsing auction JSON: $e');
      print('🏛️ AUCTION: JSON data: $json');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'seller_id': sellerId,
      'category_id': categoryId,
      'dynamic_attributes': dynamicAttributes,
      'start_price': startPrice,
      'current_price': currentPrice,
      'reserve_price': reservePrice,
      'start_time': startTime.toIso8601String(),
      'end_time': endTime.toIso8601String(),
      'status': status.name,
      'type': type.name,
      'tags': tags,
      'return_policy': returnPolicy,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      // Professional auction fields
      'authentication_required': authenticationRequired,
      'shipping_included': shippingIncluded,
      'bid_increment': bidIncrement,
      'commission_rate': commissionRate,
      'buyer_premium': buyerPremium,
      'timezone': timezone,
      'payment_terms': paymentTerms,
      'lot_number': lotNumber,
      'condition_report': conditionReport,
      'bidding_rules': biddingRules,
    };
  }

  // Helper method to parse double values that might be strings or numbers
  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (e) {
        print('🏛️ AUCTION: Failed to parse string as double: $value');
        return null;
      }
    }
    print('🏛️ AUCTION: Unexpected type for double parsing: ${value.runtimeType}');
    return null;
  }

  // Helper method to parse condition report (handles both Map and String formats)
  static String? _parseConditionReport(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    if (value is Map<String, dynamic>) {
      // Handle old format where condition_report was a Map with description
      return value['description'] ?? value.toString();
    }
    return value.toString();
  }

  // Helper method to parse bidding rules (handles both Map and String formats)
  static String? _parseBiddingRules(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    if (value is Map<String, dynamic>) {
      // Handle old format where bidding_rules was a Map with description
      return value['description'] ?? value.toString();
    }
    return value.toString();
  }

  // Helper getters
  String get productName => dynamicAttributes['productName'] ?? 'Unknown Product';
  String? get brand => dynamicAttributes['brand'];
  String? get condition => dynamicAttributes['condition'];
  String? get description => dynamicAttributes['description'];
  List<String> get images {
    final imagesData = dynamicAttributes['images'];
    if (imagesData is List) {
      return List<String>.from(imagesData);
    } else if (imagesData is String && imagesData.isNotEmpty) {
      // Handle case where images is a single string
      return [imagesData];
    }
    return [];
  }

  // Legacy compatibility
  String get title => productName;
  double? get currentBid => currentPrice;
  int get bidCount => dynamicAttributes['bidCount'] ?? 0;
  int get watchersCount => dynamicAttributes['watchersCount'] ?? 0;

  // Status check methods
  bool get isActive => status == AuctionStatus.active;
  bool get isPending => status == AuctionStatus.pending;
  bool get isEnded => status == AuctionStatus.ended;
  bool get isCancelled => status == AuctionStatus.cancelled;

  // Time check methods
  bool get hasStarted => DateTime.now().isAfter(startTime);
  bool get hasEnded => DateTime.now().isAfter(endTime);
  bool get isLive => hasStarted && !hasEnded && isActive;

  // Duration methods
  Duration get timeRemaining {
    if (hasEnded) return Duration.zero;
    return endTime.difference(DateTime.now());
  }

  Duration get timeToStart {
    if (hasStarted) return Duration.zero;
    return startTime.difference(DateTime.now());
  }

  // Price methods
  bool get hasReservePrice => reservePrice != null;
  bool get reservePriceMet => hasReservePrice && currentPrice >= reservePrice!;

  Auction copyWith({
    String? id,
    String? sellerId,
    String? categoryId,
    Map<String, dynamic>? dynamicAttributes,
    double? startPrice,
    double? currentPrice,
    double? reservePrice,
    DateTime? startTime,
    DateTime? endTime,
    AuctionStatus? status,
    AuctionType? type,
    List<String>? tags,
    String? returnPolicy,
    DateTime? createdAt,
    DateTime? updatedAt,
    // Professional auction fields
    bool? authenticationRequired,
    bool? shippingIncluded,
    double? bidIncrement,
    double? commissionRate,
    double? buyerPremium,
    String? timezone,
    Map<String, dynamic>? paymentTerms,
    String? lotNumber,
    String? conditionReport,
    String? biddingRules,
  }) {
    return Auction(
      id: id ?? this.id,
      sellerId: sellerId ?? this.sellerId,
      categoryId: categoryId ?? this.categoryId,
      dynamicAttributes: dynamicAttributes ?? this.dynamicAttributes,
      startPrice: startPrice ?? this.startPrice,
      currentPrice: currentPrice ?? this.currentPrice,
      reservePrice: reservePrice ?? this.reservePrice,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      type: type ?? this.type,
      tags: tags ?? this.tags,
      returnPolicy: returnPolicy ?? this.returnPolicy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      // Professional auction fields
      authenticationRequired: authenticationRequired ?? this.authenticationRequired,
      shippingIncluded: shippingIncluded ?? this.shippingIncluded,
      bidIncrement: bidIncrement ?? this.bidIncrement,
      commissionRate: commissionRate ?? this.commissionRate,
      buyerPremium: buyerPremium ?? this.buyerPremium,
      timezone: timezone ?? this.timezone,
      paymentTerms: paymentTerms ?? this.paymentTerms,
      lotNumber: lotNumber ?? this.lotNumber,
      conditionReport: conditionReport ?? this.conditionReport,
      biddingRules: biddingRules ?? this.biddingRules,
    );
  }
}

enum AuctionStatus {
  pending,
  active,
  ended,
  cancelled,
}

enum AuctionType {
  english,
  dutch,
  fixed,
}

extension AuctionStatusExtension on AuctionStatus {
  String get displayName {
    switch (this) {
      case AuctionStatus.pending:
        return 'Pending';
      case AuctionStatus.active:
        return 'Active';
      case AuctionStatus.ended:
        return 'Ended';
      case AuctionStatus.cancelled:
        return 'Cancelled';
    }
  }

  String get description {
    switch (this) {
      case AuctionStatus.pending:
        return 'Waiting to start';
      case AuctionStatus.active:
        return 'Currently accepting bids';
      case AuctionStatus.ended:
        return 'Auction has ended';
      case AuctionStatus.cancelled:
        return 'Auction was cancelled';
    }
  }

  String toUpperCase() {
    return name.toUpperCase();
  }

  String toLowerCase() {
    return name.toLowerCase();
  }
}

extension AuctionTypeExtension on AuctionType {
  String get displayName {
    switch (this) {
      case AuctionType.english:
        return 'English Auction';
      case AuctionType.dutch:
        return 'Dutch Auction';
      case AuctionType.fixed:
        return 'Fixed Price';
    }
  }

  String get description {
    switch (this) {
      case AuctionType.english:
        return 'Bids increase over time';
      case AuctionType.dutch:
        return 'Price decreases over time';
      case AuctionType.fixed:
        return 'Fixed price sale';
    }
  }
}
