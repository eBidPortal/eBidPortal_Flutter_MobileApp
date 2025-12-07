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
  });

  factory Auction.fromJson(Map<String, dynamic> json) {
    return Auction(
      id: json['id'],
      sellerId: json['seller_id'],
      categoryId: json['category_id'],
      dynamicAttributes: json['dynamic_attributes'] ?? {},
      startPrice: (json['start_price'] as num).toDouble(),
      currentPrice: (json['current_price'] as num).toDouble(),
      reservePrice: json['reserve_price'] != null 
          ? (json['reserve_price'] as num).toDouble() 
          : null,
      startTime: DateTime.parse(json['start_time']),
      endTime: DateTime.parse(json['end_time']),
      status: AuctionStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => AuctionStatus.pending,
      ),
      type: AuctionType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => AuctionType.english,
      ),
      tags: List<String>.from(json['tags'] ?? []),
      returnPolicy: json['return_policy'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
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
    };
  }

  // Helper getters
  String get productName => dynamicAttributes['productName'] ?? 'Unknown Product';
  String? get brand => dynamicAttributes['brand'];
  String? get condition => dynamicAttributes['condition'];
  String? get description => dynamicAttributes['description'];
  List<String> get images => List<String>.from(dynamicAttributes['images'] ?? []);

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
