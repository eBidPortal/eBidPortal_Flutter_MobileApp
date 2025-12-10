import 'package:flutter/material.dart';
import '../domain/auction.dart';

class AuctionInfoTabs extends StatefulWidget {
  final Auction auction;

  const AuctionInfoTabs({
    super.key,
    required this.auction,
  });

  @override
  State<AuctionInfoTabs> createState() => _AuctionInfoTabsState();
}

class _AuctionInfoTabsState extends State<AuctionInfoTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Details'),
            Tab(text: 'Specifications'),
            Tab(text: 'Shipping'),
            Tab(text: 'Return Policy'),
            Tab(text: 'Professional Details'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildDetailsTab(),
              _buildSpecificationsTab(),
              _buildShippingTab(),
              _buildReturnPolicyTab(),
              _buildProfessionalDetailsTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Description
          if (widget.auction.description != null) ...[
            _buildSectionTitle('Description'),
            const SizedBox(height: 8),
            Text(
              widget.auction.description!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
          ],

          // Auction Details
          _buildSectionTitle('Auction Information'),
          const SizedBox(height: 12),
          _buildInfoCard([
            _buildInfoRow('Auction Type', widget.auction.type.displayName),
            _buildInfoRow('Status', widget.auction.status.displayName),
            _buildInfoRow('Starting Price', '\$${widget.auction.startPrice.toStringAsFixed(2)}'),
            _buildInfoRow('Current Price', '\$${widget.auction.currentPrice.toStringAsFixed(2)}'),
            if (widget.auction.hasReservePrice)
              _buildInfoRow('Reserve Price', '\$${widget.auction.reservePrice!.toStringAsFixed(2)}'),
            _buildInfoRow('Total Bids', '${widget.auction.bidCount}'),
            _buildInfoRow('Watchers', '${widget.auction.watchersCount}'),
          ]),

          const SizedBox(height: 24),

          // Timing Information
          _buildSectionTitle('Timing'),
          const SizedBox(height: 12),
          _buildInfoCard([
            _buildInfoRow('Start Time', _formatDateTime(widget.auction.startTime)),
            _buildInfoRow('End Time', _formatDateTime(widget.auction.endTime)),
            _buildInfoRow('Duration', _calculateDuration()),
            if (widget.auction.isActive)
              _buildInfoRow('Time Remaining', _formatDuration(widget.auction.timeRemaining)),
          ]),

          const SizedBox(height: 24),

          // Tags
          if (widget.auction.tags.isNotEmpty) ...[
            _buildSectionTitle('Tags'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.auction.tags.map((tag) {
                return Chip(
                  label: Text(tag),
                  backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSpecificationsTab() {
    final specs = widget.auction.dynamicAttributes;
    final specEntries = specs.entries
        .where((entry) => !['productName', 'description', 'images'].contains(entry.key))
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (specEntries.isNotEmpty) ...[
            _buildSectionTitle('Product Specifications'),
            const SizedBox(height: 12),
            _buildInfoCard(
              specEntries.map((entry) {
                return _buildInfoRow(
                  _formatSpecKey(entry.key),
                  _formatSpecValue(entry.value),
                );
              }).toList(),
            ),
          ] else ...[
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 64),
                  Icon(
                    Icons.info_outline,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No specifications available',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildShippingTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Shipping Information'),
          const SizedBox(height: 12),
          _buildInfoCard([
            _buildInfoRow('Shipping Cost', 'Calculated at checkout'),
            _buildInfoRow('Processing Time', '1-2 business days'),
            _buildInfoRow('Estimated Delivery', '3-7 business days'),
            _buildInfoRow('Shipping Methods', 'Standard, Express, Overnight'),
            _buildInfoRow('International Shipping', 'Available to most countries'),
          ]),

          const SizedBox(height: 24),

          _buildSectionTitle('Packaging'),
          const SizedBox(height: 12),
          Text(
            'Items are carefully packaged to ensure safe delivery. Original packaging will be used when available.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          const SizedBox(height: 24),

          _buildSectionTitle('Tracking'),
          const SizedBox(height: 12),
          Text(
            'Tracking information will be provided once the item ships. You will receive email notifications with tracking updates.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildReturnPolicyTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Return Policy'),
          const SizedBox(height: 12),
          
          if (widget.auction.returnPolicy != null) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                ),
              ),
              child: Text(
                widget.auction.returnPolicy!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 24),
          ],

          _buildInfoCard([
            _buildInfoRow('Return Window', '14 days from delivery'),
            _buildInfoRow('Condition Required', 'Original condition with tags'),
            _buildInfoRow('Return Shipping', 'Buyer responsibility'),
            _buildInfoRow('Refund Processing', '3-5 business days'),
            _buildInfoRow('Restocking Fee', 'May apply to some items'),
          ]),

          const SizedBox(height: 24),

          _buildSectionTitle('Return Process'),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStep(1, 'Contact seller to initiate return'),
              _buildStep(2, 'Receive return authorization and shipping label'),
              _buildStep(3, 'Package item securely in original packaging'),
              _buildStep(4, 'Ship item using provided label'),
              _buildStep(5, 'Receive refund after item inspection'),
            ],
          ),

          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.orange.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.info, color: Colors.orange[700]),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'All sales are final for auction items unless otherwise specified by the seller.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.orange[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfessionalDetailsTab() {
    final hasProfessionalFields = widget.auction.authenticationRequired != null ||
        widget.auction.shippingIncluded != null ||
        widget.auction.bidIncrement != null ||
        widget.auction.commissionRate != null ||
        widget.auction.buyerPremium != null ||
        widget.auction.timezone != null ||
        widget.auction.paymentTerms != null ||
        widget.auction.lotNumber != null ||
        (widget.auction.conditionReport != null && widget.auction.conditionReport!.isNotEmpty) ||
        (widget.auction.biddingRules != null && widget.auction.biddingRules!.isNotEmpty);

    if (!hasProfessionalFields) {
      return Center(
        child: Column(
          children: [
            const SizedBox(height: 64),
            Icon(
              Icons.business_center,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No professional details available',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'This auction does not have professional auction features configured.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Professional Auction Settings'),
          const SizedBox(height: 12),

          // Authentication & Shipping
          if (widget.auction.authenticationRequired != null || widget.auction.shippingIncluded != null)
            _buildInfoCard([
              if (widget.auction.authenticationRequired != null)
                _buildInfoRow(
                  'Authentication Required',
                  widget.auction.authenticationRequired! ? 'Yes' : 'No',
                ),
              if (widget.auction.shippingIncluded != null)
                _buildInfoRow(
                  'Shipping Included',
                  widget.auction.shippingIncluded! ? 'Yes' : 'No',
                ),
            ]),

          if (widget.auction.authenticationRequired != null || widget.auction.shippingIncluded != null)
            const SizedBox(height: 24),

          // Bidding & Commission
          if (widget.auction.bidIncrement != null || widget.auction.commissionRate != null || widget.auction.buyerPremium != null)
            _buildSectionTitle('Bidding & Commission'),
          if (widget.auction.bidIncrement != null || widget.auction.commissionRate != null || widget.auction.buyerPremium != null)
            const SizedBox(height: 12),
          if (widget.auction.bidIncrement != null || widget.auction.commissionRate != null || widget.auction.buyerPremium != null)
            _buildInfoCard([
              if (widget.auction.bidIncrement != null)
                _buildInfoRow(
                  'Bid Increment',
                  '\$${widget.auction.bidIncrement!.toStringAsFixed(2)}',
                ),
              if (widget.auction.commissionRate != null)
                _buildInfoRow(
                  'Commission Rate',
                  '${(widget.auction.commissionRate! * 100).toStringAsFixed(2)}%',
                ),
              if (widget.auction.buyerPremium != null)
                _buildInfoRow(
                  'Buyer\'s Premium',
                  '${(widget.auction.buyerPremium! * 100).toStringAsFixed(2)}%',
                ),
            ]),

          if (widget.auction.bidIncrement != null || widget.auction.commissionRate != null || widget.auction.buyerPremium != null)
            const SizedBox(height: 24),

          // Location & Timing
          if (widget.auction.timezone != null || widget.auction.lotNumber != null)
            _buildSectionTitle('Location & Catalog'),
          if (widget.auction.timezone != null || widget.auction.lotNumber != null)
            const SizedBox(height: 12),
          if (widget.auction.timezone != null || widget.auction.lotNumber != null)
            _buildInfoCard([
              if (widget.auction.timezone != null)
                _buildInfoRow('Timezone', widget.auction.timezone!),
              if (widget.auction.lotNumber != null)
                _buildInfoRow('Lot Number', widget.auction.lotNumber!),
            ]),

          if (widget.auction.timezone != null || widget.auction.lotNumber != null)
            const SizedBox(height: 24),

          if (widget.auction.paymentTerms != null && widget.auction.paymentTerms!.isNotEmpty) ...[
            _buildSectionTitle('Payment Terms'),
            const SizedBox(height: 12),
            _buildInfoCard(
              widget.auction.paymentTerms!.entries.map((entry) {
                return _buildInfoRow(
                  _formatSpecKey(entry.key),
                  _formatPaymentTermValue(entry.value),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
          ],

          // Condition Report
          if (widget.auction.conditionReport != null && widget.auction.conditionReport!.isNotEmpty) ...[
            _buildSectionTitle('Condition Report'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                ),
              ),
              child: Text(
                widget.auction.conditionReport!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 24),
          ],

          // Bidding Rules
          if (widget.auction.biddingRules != null && widget.auction.biddingRules!.isNotEmpty) ...[
            _buildSectionTitle('Bidding Rules'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                ),
              ),
              child: Text(
                widget.auction.biddingRules!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 24),
          ],

          // Professional Badge
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).primaryColor.withOpacity(0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.verified,
                  color: Theme.of(context).primaryColor,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Professional Auction',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'This auction includes professional auction house features and standards.',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: children.asMap().entries.map((entry) {
          final isLast = entry.key == children.length - 1;
          return Column(
            children: [
              entry.value,
              if (!isLast) Divider(height: 1, color: Colors.grey[300]),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep(int number, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} at ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  String _calculateDuration() {
    final duration = widget.auction.endTime.difference(widget.auction.startTime);
    if (duration.inDays > 0) {
      return '${duration.inDays} day${duration.inDays == 1 ? '' : 's'}';
    } else if (duration.inHours > 0) {
      return '${duration.inHours} hour${duration.inHours == 1 ? '' : 's'}';
    } else {
      return '${duration.inMinutes} minute${duration.inMinutes == 1 ? '' : 's'}';
    }
  }

  String _formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays}d ${duration.inHours % 24}h ${duration.inMinutes % 60}m';
    } else if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes % 60}m';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes}m ${duration.inSeconds % 60}s';
    } else {
      return '${duration.inSeconds}s';
    }
  }

  String _formatSpecKey(String key) {
    return key
        .replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(1)}')
        .split('_')
        .map((word) => word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1))
        .join(' ')
        .trim();
  }

  String _formatSpecValue(dynamic value) {
    if (value == null) return 'N/A';
    if (value is List) return value.join(', ');
    if (value is Map) return value.toString();
    return value.toString();
  }

  String _formatPaymentTermValue(dynamic value) {
    if (value == null) return 'N/A';
    if (value is List) return value.join(', ');
    if (value is bool) return value ? 'Yes' : 'No';
    if (value is Map) {
      return value.entries.map((e) => '${_formatSpecKey(e.key)}: ${e.value}').join('; ');
    }
    return value.toString();
  }
}