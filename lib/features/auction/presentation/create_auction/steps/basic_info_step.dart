import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../catalog/presentation/widgets/category_selector.dart';
import '../widgets/dynamic_fields_form.dart';
import '../create_auction_provider.dart';
import '../create_auction_state.dart';

class BasicInfoStep extends ConsumerWidget {
  const BasicInfoStep({super.key});

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
            'Basic Information',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppTheme.spacingSm),
          Text(
            'Tell us about your auction',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textMuted,
                ),
          ),
          const SizedBox(height: AppTheme.spacingXl),
          
          // Title
          TextField(
            decoration: InputDecoration(
              labelText: 'Title *',
              hintText: 'e.g., 2020 Tesla Model 3 Performance',
              errorText: state.titleError,
              prefixIcon: const Icon(Icons.title),
            ),
            onChanged: notifier.setTitle,
            maxLength: 200,
            textCapitalization: TextCapitalization.words,
          ),
          const SizedBox(height: AppTheme.spacingLg),
          
          // Description
          TextField(
            decoration: InputDecoration(
              labelText: 'Description *',
              hintText: 'Describe your item in detail...',
              errorText: state.descriptionError,
              prefixIcon: const Icon(Icons.description),
              alignLabelWithHint: true,
            ),
            onChanged: notifier.setDescription,
            maxLines: 5,
            maxLength: 5000,
            textCapitalization: TextCapitalization.sentences,
          ),
          const SizedBox(height: AppTheme.spacingLg),
          
          // Category
          CategorySelector(
            selectedCategoryId: state.categoryId,
            onCategorySelected: notifier.setCategory,
            errorText: state.categoryError,
          ),
          const SizedBox(height: AppTheme.spacingLg),
          
          // Dynamic Fields (shown when schema is loaded)
          if (state.isLoadingSchema)
            const Center(child: CircularProgressIndicator())
          else if (state.schemaError != null)
            Text(
              state.schemaError!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            )
          else if (state.categorySchema != null)
            DynamicFieldsForm(
              schema: state.categorySchema!,
              values: state.dynamicFields,
              errors: state.dynamicFieldErrors,
              onFieldChanged: notifier.setDynamicField,
              onFieldError: notifier.setDynamicFieldError,
              context: context,
            ),
          if (state.categorySchema != null) const SizedBox(height: AppTheme.spacingLg),
          
          // Auction Type
          Text(
            'Auction Type',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppTheme.spacingSm),
          Wrap(
            spacing: AppTheme.spacingSm,
            children: AuctionType.values.map((type) {
              final isSelected = state.type == type;
              return ChoiceChip(
                label: Text(_getTypeLabel(type)),
                selected: isSelected,
                onSelected: (_) => notifier.setType(type),
                avatar: isSelected ? const Icon(Icons.check, size: 18) : null,
              );
            }).toList(),
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
}
