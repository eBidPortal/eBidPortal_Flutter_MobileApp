import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/theme/app_theme.dart';
import '../create_auction_provider.dart';
import '../create_auction_state.dart';

class ReviewStep extends ConsumerStatefulWidget {
  const ReviewStep({super.key});

  @override
  ConsumerState<ReviewStep> createState() => _ReviewStepState();
}

class _ReviewStepState extends ConsumerState<ReviewStep> {
  final _tagController = TextEditingController();

  @override
  void dispose() {
    _tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createAuctionProvider);
    final notifier = ref.read(createAuctionProvider.notifier);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.spacingLg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Review & Finalize',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppTheme.spacingSm),
          Text(
            'Review your auction details and add tags',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textMuted,
                ),
          ),
          const SizedBox(height: AppTheme.spacingXl),
          
          // Summary Card
          _buildSummaryCard(context, state),
          
          const SizedBox(height: AppTheme.spacingXl),
          
          // Tags Section
          Text(
            'Tags (Optional)',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppTheme.spacingSm),
          Text(
            'Add tags to help buyers find your auction',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.textMuted,
                ),
          ),
          const SizedBox(height: AppTheme.spacingMd),
          
          // Tag Input
          if (state.tags.length < 20)
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _tagController,
                    decoration: const InputDecoration(
                      hintText: 'Enter a tag',
                      prefixIcon: Icon(Icons.label),
                    ),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        notifier.addTag(value.trim());
                        _tagController.clear();
                      }
                    },
                    maxLength: 50,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingSm),
                IconButton(
                  onPressed: () {
                    if (_tagController.text.isNotEmpty) {
                      notifier.addTag(_tagController.text.trim());
                      _tagController.clear();
                    }
                  },
                  icon: const Icon(Icons.add),
                  style: IconButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          
          const SizedBox(height: AppTheme.spacingMd),
          
          // Tags Display
          if (state.tags.isNotEmpty)
            Wrap(
              spacing: AppTheme.spacingSm,
              runSpacing: AppTheme.spacingSm,
              children: state.tags.map((tag) {
                return Chip(
                  label: Text(tag),
                  onDeleted: () => notifier.removeTag(tag),
                  deleteIcon: const Icon(Icons.close, size: 16),
                );
              }).toList(),
            )
          else
            Text(
              'No tags added yet',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.textMuted,
                  ),
            ),
          
          const SizedBox(height: AppTheme.spacingXl),
          
          // Terms and Conditions
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingMd),
            decoration: BoxDecoration(
              color: AppTheme.warningColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppTheme.radiusSm),
              border: Border.all(color: AppTheme.warningColor.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.gavel,
                      color: AppTheme.warningColor,
                      size: 20,
                    ),
                    const SizedBox(width: AppTheme.spacingSm),
                    Text(
                      'Important',
                      style: TextStyle(
                        color: AppTheme.warningColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppTheme.spacingSm),
                Text(
                  'By creating this auction, you agree to:\n'
                  '• Provide accurate item descriptions\n'
                  '• Honor all winning bids\n'
                  '• Complete transactions within 7 days\n'
                  '• Follow platform guidelines',
                  style: TextStyle(
                    color: AppTheme.warningColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context, CreateAuctionState state) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSummaryRow(
              context,
              'Title',
              state.title,
              Icons.title,
            ),
            const Divider(),
            _buildSummaryRow(
              context,
              'Description',
              state.description.length > 100
                  ? '${state.description.substring(0, 100)}...'
                  : state.description,
              Icons.description,
            ),
            const Divider(),
            _buildSummaryRow(
              context,
              'Type',
              _getTypeLabel(state.type),
              Icons.gavel,
            ),
            const Divider(),
            _buildSummaryRow(
              context,
              'Starting Price',
              '\$${state.startPrice ?? '0.00'}',
              Icons.attach_money,
            ),
            if (state.reservePrice != null && state.reservePrice!.isNotEmpty) ...[
              const Divider(),
              _buildSummaryRow(
                context,
                'Reserve Price',
                '\$${state.reservePrice}',
                Icons.shield,
              ),
            ],
            const Divider(),
            _buildSummaryRow(
              context,
              'Duration',
              state.startTime != null && state.endTime != null
                  ? _getDuration(state.startTime!, state.endTime!)
                  : 'Not set',
              Icons.schedule,
            ),
            const Divider(),
            _buildSummaryRow(
              context,
              'Images',
              '${state.localImages.length} image${state.localImages.length != 1 ? 's' : ''}',
              Icons.image,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingSm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: AppTheme.primaryColor),
          const SizedBox(width: AppTheme.spacingMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.textMuted,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getTypeLabel(AuctionType type) {
    switch (type) {
      case AuctionType.english:
        return 'English (Standard)';
      case AuctionType.dutch:
        return 'Dutch (Descending)';
      case AuctionType.sealed:
        return 'Sealed Bid';
      case AuctionType.reverse:
        return 'Reverse';
    }
  }

  String _getDuration(DateTime start, DateTime end) {
    final duration = end.difference(start);
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    
    if (days > 0) {
      return '$days day${days > 1 ? 's' : ''} ${hours > 0 ? 'and $hours hour${hours > 1 ? 's' : ''}' : ''}';
    }
    return '$hours hour${hours > 1 ? 's' : ''}';
  }
}
