import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auction_providers.dart';

class AuctionFiltersSheet extends ConsumerStatefulWidget {
  const AuctionFiltersSheet({super.key});

  @override
  ConsumerState<AuctionFiltersSheet> createState() => _AuctionFiltersSheetState();
}

class _AuctionFiltersSheetState extends ConsumerState<AuctionFiltersSheet> {
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  void _initializeControllers() {
    final filters = ref.read(auctionFiltersProvider);
    if (filters.minPrice != null) {
      _minPriceController.text = filters.minPrice.toString();
    }
    if (filters.maxPrice != null) {
      _maxPriceController.text = filters.maxPrice.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filters = ref.watch(auctionFiltersProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Handle
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter Auctions',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    ref.read(auctionFiltersProvider.notifier).clearFilters();
                    _minPriceController.clear();
                    _maxPriceController.clear();
                  },
                  child: const Text('Clear All'),
                ),
              ],
            ),
          ),

          const Divider(),

          // Filters
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Auction Status
                  _buildSectionTitle('Auction Status'),
                  _buildStatusFilter(filters),

                  const SizedBox(height: 24),

                  // Price Range
                  _buildSectionTitle('Price Range'),
                  _buildPriceRangeFilter(filters),

                  const SizedBox(height: 24),

                  // Sort Options
                  _buildSectionTitle('Sort By'),
                  _buildSortFilter(filters),

                  const SizedBox(height: 24),

                  // Auction Type
                  _buildSectionTitle('Auction Type'),
                  _buildAuctionTypeFilter(filters),
                ],
              ),
            ),
          ),

          // Apply Button
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Apply Filters'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildStatusFilter(AuctionFilters filters) {
    const statuses = [
      {'value': null, 'label': 'All Statuses'},
      {'value': 'active', 'label': 'Active'},
      {'value': 'pending', 'label': 'Pending'},
      {'value': 'ended', 'label': 'Ended'},
    ];

    return Column(
      children: statuses.map((status) {
        return RadioListTile<String?>(
          title: Text(status['label'] as String),
          value: status['value'] as String?,
          groupValue: filters.status,
          onChanged: (value) {
            ref.read(auctionFiltersProvider.notifier).updateStatus(value);
          },
          contentPadding: EdgeInsets.zero,
        );
      }).toList(),
    );
  }

  Widget _buildPriceRangeFilter(AuctionFilters filters) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _minPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Min Price',
                  prefixText: '\$',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  final minPrice = double.tryParse(value);
                  final maxPrice = double.tryParse(_maxPriceController.text);
                  ref.read(auctionFiltersProvider.notifier)
                      .updatePriceRange(minPrice, maxPrice);
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: _maxPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Max Price',
                  prefixText: '\$',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  final minPrice = double.tryParse(_minPriceController.text);
                  final maxPrice = double.tryParse(value);
                  ref.read(auctionFiltersProvider.notifier)
                      .updatePriceRange(minPrice, maxPrice);
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Quick price filters
        Wrap(
          spacing: 8,
          children: [
            _buildQuickPriceChip('\$0 - \$100', 0, 100),
            _buildQuickPriceChip('\$100 - \$500', 100, 500),
            _buildQuickPriceChip('\$500 - \$1000', 500, 1000),
            _buildQuickPriceChip('\$1000+', 1000, null),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickPriceChip(String label, double min, double? max) {
    return FilterChip(
      label: Text(label),
      onSelected: (selected) {
        if (selected) {
          _minPriceController.text = min.toString();
          _maxPriceController.text = max?.toString() ?? '';
          ref.read(auctionFiltersProvider.notifier)
              .updatePriceRange(min, max);
        }
      },
      selected: false,
    );
  }

  Widget _buildSortFilter(AuctionFilters filters) {
    const sortOptions = [
      {'value': 'end_time', 'label': 'Ending Soon', 'desc': true},
      {'value': 'current_price', 'label': 'Price: Low to High', 'desc': false},
      {'value': 'current_price', 'label': 'Price: High to Low', 'desc': true},
      {'value': 'created_at', 'label': 'Newest First', 'desc': true},
      {'value': 'created_at', 'label': 'Oldest First', 'desc': false},
    ];

    return Column(
      children: sortOptions.map((sort) {
        final isSelected = filters.sortBy == sort['value'] && 
                          filters.sortDescending == sort['desc'];
        
        return RadioListTile<String>(
          title: Text(sort['label'] as String),
          value: '${sort['value']}_${sort['desc']}',
          groupValue: isSelected ? '${sort['value']}_${sort['desc']}' : null,
          onChanged: (value) {
            ref.read(auctionFiltersProvider.notifier).updateSorting(
              sort['value'] as String,
              sort['desc'] as bool,
            );
          },
          contentPadding: EdgeInsets.zero,
        );
      }).toList(),
    );
  }

  Widget _buildAuctionTypeFilter(AuctionFilters filters) {
    return Column(
      children: [
        CheckboxListTile(
          title: const Text('English Auctions'),
          subtitle: const Text('Bids increase over time'),
          value: true, // Default selection for now
          onChanged: (value) {
            // Implement auction type filtering
          },
          contentPadding: EdgeInsets.zero,
        ),
        CheckboxListTile(
          title: const Text('Dutch Auctions'),
          subtitle: const Text('Price decreases over time'),
          value: false,
          onChanged: (value) {
            // Implement auction type filtering
          },
          contentPadding: EdgeInsets.zero,
        ),
        CheckboxListTile(
          title: const Text('Fixed Price'),
          subtitle: const Text('Buy it now options'),
          value: false,
          onChanged: (value) {
            // Implement auction type filtering
          },
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }
}