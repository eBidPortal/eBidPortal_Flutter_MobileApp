import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/theme/app_theme.dart';
import '../create_auction_provider.dart';
import '../create_auction_state.dart';

class AdvancedSettingsTab extends ConsumerStatefulWidget {
  const AdvancedSettingsTab({super.key});

  @override
  ConsumerState<AdvancedSettingsTab> createState() =>
      _AdvancedSettingsTabState();
}

class _AdvancedSettingsTabState extends ConsumerState<AdvancedSettingsTab> {
  final _startPriceController = TextEditingController();
  final _reservePriceController = TextEditingController();
  final _tagsController = TextEditingController();
  final _returnPolicyController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize controllers with existing state values
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = ref.read(createAuctionProvider);
      _startPriceController.text = state.startPrice ?? '';
      _reservePriceController.text = state.reservePrice ?? '';
      _tagsController.text = state.tags.join(', ');
      _returnPolicyController.text = state.returnPolicy ?? '';
    });
  }

  @override
  void dispose() {
    _startPriceController.dispose();
    _reservePriceController.dispose();
    _tagsController.dispose();
    _returnPolicyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createAuctionProvider);
    final notifier = ref.read(createAuctionProvider.notifier);

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Material(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppTheme.spacingLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pricing Section
          _buildSection(
            title: 'Pricing',
            icon: Icons.monetization_on,
            children: [
              _buildTextField(
                controller: _startPriceController,
                label: 'Start Price',
                hint: 'Enter starting bid amount',
                keyboardType: TextInputType.number,
                prefixIcon: Icons.attach_money,
                errorText: state.startPriceError,
                onChanged: (value) => notifier.setStartPrice(value),
                required: true,
              ),
              const SizedBox(height: AppTheme.spacingMd),
              _buildTextField(
                controller: _reservePriceController,
                label: 'Reserve Price (Optional)',
                hint: 'Enter minimum acceptable price',
                keyboardType: TextInputType.number,
                prefixIcon: Icons.shield,
                errorText: state.reservePriceError,
                onChanged: (value) => notifier.setReservePrice(value),
              ),
            ],
          ),

          const SizedBox(height: AppTheme.spacingXl),

          // Timing Section
          _buildSection(
            title: 'Auction Timing',
            icon: Icons.schedule,
            children: [
              _buildDateTimeField(
                label: 'Start Time',
                value: state.startTime,
                onChanged: (dateTime) {
                  if (dateTime != null) {
                    notifier.setStartTime(dateTime);
                  }
                },
                errorText: state.startTimeError,
                required: true,
              ),
              const SizedBox(height: AppTheme.spacingMd),
              _buildDateTimeField(
                label: 'End Time',
                value: state.endTime,
                onChanged: (dateTime) {
                  if (dateTime != null) {
                    notifier.setEndTime(dateTime);
                  }
                },
                errorText: state.endTimeError,
                required: true,
              ),
            ],
          ),

          const SizedBox(height: AppTheme.spacingXl),

          // Auction Type Section
          _buildSection(
            title: 'Auction Type',
            icon: Icons.gavel,
            children: [_buildAuctionTypeSelector(state, notifier)],
          ),

          const SizedBox(height: AppTheme.spacingXl),

          // Tags Section
          _buildSection(
            title: 'Tags (Optional)',
            icon: Icons.tag,
            children: [
              _buildTextField(
                controller: _tagsController,
                label: 'Tags',
                hint:
                    'Enter tags separated by commas (e.g., laptop, apple, professional)',
                maxLines: 2,
                onChanged: (value) {
                  final tags = value
                      .split(',')
                      .map((e) => e.trim())
                      .where((e) => e.isNotEmpty)
                      .toList();
                  notifier.setTags(tags);
                },
              ),
              const SizedBox(height: AppTheme.spacingSm),
              Text(
                'Tags help buyers discover your auction. Use relevant keywords.',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),

          const SizedBox(height: AppTheme.spacingXl),

          // Return Policy Section
          _buildSection(
            title: 'Return Policy (Optional)',
            icon: Icons.assignment_return,
            children: [
              _buildTextField(
                controller: _returnPolicyController,
                label: 'Return Policy',
                hint:
                    'Describe your return policy (e.g., 14-day return policy. Original packaging required.)',
                maxLines: 3,
                onChanged: (value) => notifier.setReturnPolicy(value),
              ),
              const SizedBox(height: AppTheme.spacingSm),
              Text(
                'Clear return policies build buyer confidence and trust.',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    ),
    ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).primaryColor),
                const SizedBox(width: AppTheme.spacingSm),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingMd),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType? keyboardType,
    IconData? prefixIcon,
    String? errorText,
    Function(String)? onChanged,
    int? maxLines,
    bool required = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label + (required ? ' *' : ''),
        hintText: hint,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: const OutlineInputBorder(),
        errorText: errorText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingMd,
          vertical: AppTheme.spacingMd,
        ),
      ),
    );
  }

  Widget _buildDateTimeField({
    required String label,
    required DateTime? value,
    required Function(DateTime?) onChanged,
    String? errorText,
    bool required = false,
  }) {
    return InkWell(
      onTap: () => _selectDateTime(context, value, onChanged),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label + (required ? ' *' : ''),
          border: const OutlineInputBorder(),
          errorText: errorText,
          prefixIcon: const Icon(Icons.calendar_today),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingMd,
            vertical: AppTheme.spacingMd,
          ),
        ),
        child: Text(
          value != null
              ? '${value.day}/${value.month}/${value.year} ${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}'
              : 'Select date and time',
          style: TextStyle(color: value != null ? null : Colors.grey[600]),
        ),
      ),
    );
  }

  Widget _buildAuctionTypeSelector(
    CreateAuctionState state,
    CreateAuctionNotifier notifier,
  ) {
    return Wrap(
      spacing: AppTheme.spacingSm,
      runSpacing: AppTheme.spacingSm,
      children: AuctionType.values.map((type) {
        final isSelected = state.type == type;
        return ChoiceChip(
          label: Text(_getTypeLabel(type)),
          selected: isSelected,
          onSelected: (_) => notifier.setType(type),
          avatar: isSelected ? const Icon(Icons.check, size: 18) : null,
        );
      }).toList(),
    );
  }

  String _getTypeLabel(AuctionType type) {
    switch (type) {
      case AuctionType.english:
        return 'English Auction';
      case AuctionType.dutch:
        return 'Dutch Auction';
      case AuctionType.sealed:
        return 'Sealed Bid';
      case AuctionType.reverse:
        return 'Reverse Auction';
    }
  }

  Future<void> _selectDateTime(
    BuildContext context,
    DateTime? initialDate,
    Function(DateTime?) onChanged,
  ) async {
    final date = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null && context.mounted) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate ?? DateTime.now()),
      );

      if (time != null) {
        final dateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
        onChanged(dateTime);
      }
    }
  }
}
