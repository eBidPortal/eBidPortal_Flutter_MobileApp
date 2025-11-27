import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/theme/app_theme.dart';
import '../create_auction_provider.dart';

class PricingStep extends ConsumerWidget {
  const PricingStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createAuctionProvider);
    final notifier = ref.read(createAuctionProvider.notifier);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.spacingLg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pricing & Duration',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppTheme.spacingSm),
          Text(
            'Set your pricing and auction schedule',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textMuted,
                ),
          ),
          const SizedBox(height: AppTheme.spacingXl),
          
          // Start Price
          TextField(
            decoration: InputDecoration(
              labelText: 'Starting Price *',
              hintText: '0.00',
              errorText: state.startPriceError,
              prefixIcon: const Icon(Icons.attach_money),
              prefixText: '\$',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            onChanged: notifier.setStartPrice,
          ),
          const SizedBox(height: AppTheme.spacingLg),
          
          // Reserve Price
          TextField(
            decoration: InputDecoration(
              labelText: 'Reserve Price (Optional)',
              hintText: '0.00',
              errorText: state.reservePriceError,
              prefixIcon: const Icon(Icons.shield),
              prefixText: '\$',
              helperText: 'Minimum price you\'ll accept',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            onChanged: notifier.setReservePrice,
          ),
          const SizedBox(height: AppTheme.spacingXl),
          
          // Start Time
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.calendar_today),
            title: const Text('Start Date & Time *'),
            subtitle: Text(
              state.startTime != null
                  ? _formatDateTime(state.startTime!)
                  : 'Tap to select',
              style: TextStyle(
                color: state.startTimeError != null
                    ? AppTheme.errorColor
                    : AppTheme.textSecondary,
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _selectDateTime(
              context,
              state.startTime ?? DateTime.now().add(const Duration(hours: 1)),
              notifier.setStartTime,
            ),
          ),
          if (state.startTimeError != null)
            Padding(
              padding: const EdgeInsets.only(left: 56, top: 4),
              child: Text(
                state.startTimeError!,
                style: const TextStyle(
                  color: AppTheme.errorColor,
                  fontSize: 12,
                ),
              ),
            ),
          const Divider(),
          
          // End Time
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.event),
            title: const Text('End Date & Time *'),
            subtitle: Text(
              state.endTime != null
                  ? _formatDateTime(state.endTime!)
                  : 'Tap to select',
              style: TextStyle(
                color: state.endTimeError != null
                    ? AppTheme.errorColor
                    : AppTheme.textSecondary,
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _selectDateTime(
              context,
              state.endTime ??
                  (state.startTime ?? DateTime.now()).add(const Duration(days: 7)),
              notifier.setEndTime,
            ),
          ),
          if (state.endTimeError != null)
            Padding(
              padding: const EdgeInsets.only(left: 56, top: 4),
              child: Text(
                state.endTimeError!,
                style: const TextStyle(
                  color: AppTheme.errorColor,
                  fontSize: 12,
                ),
              ),
            ),
          const SizedBox(height: AppTheme.spacingLg),
          
          // Duration Info
          if (state.startTime != null && state.endTime != null)
            Container(
              padding: const EdgeInsets.all(AppTheme.spacingMd),
              decoration: BoxDecoration(
                color: AppTheme.infoColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                border: Border.all(color: AppTheme.infoColor.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: AppTheme.infoColor,
                    size: 20,
                  ),
                  const SizedBox(width: AppTheme.spacingSm),
                  Expanded(
                    child: Text(
                      'Auction duration: ${_getDuration(state.startTime!, state.endTime!)}',
                      style: TextStyle(
                        color: AppTheme.infoColor,
                        fontSize: 14,
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

  Future<void> _selectDateTime(
    BuildContext context,
    DateTime initialDateTime,
    Function(DateTime) onSelected,
  ) async {
    final date = await showDatePicker(
      context: context,
      initialDate: initialDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null && context.mounted) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDateTime),
      );

      if (time != null) {
        final dateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
        onSelected(dateTime);
      }
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} at ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
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
