import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../catalog/domain/category.dart';
import 'create_auction_provider.dart';
import 'widgets/category_schema_screen.dart';
import '../screens/advanced_settings_tab.dart';
import 'tabs/professional_settings_tab.dart';

class CreateAuctionScreen extends ConsumerStatefulWidget {
  final Category? initialCategory;

  const CreateAuctionScreen({super.key, this.initialCategory});

  @override
  ConsumerState<CreateAuctionScreen> createState() =>
      _CreateAuctionScreenState();
}

class _CreateAuctionScreenState extends ConsumerState<CreateAuctionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    print('🔄 SCREEN: CreateAuctionScreen - initState called');
    // Initialize with the selected category if provided
    if (widget.initialCategory != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(createAuctionProvider.notifier)
            .setCategory(widget.initialCategory!);
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createAuctionProvider);

    // If no category selected and no initial category provided, redirect to category selection
    if (widget.initialCategory == null &&
        (state.categoryId == null || state.categoryId!.isEmpty)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/create-auction/category-selection');
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // Use initialCategory if no categoryId in state yet
    final currentCategory = widget.initialCategory;
    if (currentCategory == null) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.category, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text('No category selected'),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Create Auction'),
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.description), text: 'Category Details'),
            Tab(icon: Icon(Icons.settings), text: 'Basic Settings'),
            Tab(icon: Icon(Icons.business), text: 'Professional'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: Category Schema Screen (Dynamic Fields)
          CategorySchemaScreen(category: currentCategory),

          // Tab 2: Basic Settings Tab (Pricing, Timing, Tags, Return Policy)
          const AdvancedSettingsTab(),

          // Tab 3: Professional Settings Tab (Authentication, Commission, etc.)
          const ProfessionalSettingsTab(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(AppTheme.spacingLg),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          boxShadow: AppTheme.shadowMd,
        ),
        child: ElevatedButton(
          onPressed: state.isSubmitting
              ? null
              : () => _handleSubmit(context, ref, currentCategory),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
          ),
          child: state.isSubmitting
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : const Text('Create Auction'),
        ),
      ),
    );
  }

  Future<void> _handleSubmit(
    BuildContext context,
    WidgetRef ref,
    Category category,
  ) async {
    final notifier = ref.read(createAuctionProvider.notifier);
    final state = ref.read(createAuctionProvider);

    // Ensure category is set
    if (state.categoryId != category.id) {
      notifier.setCategory(category);
    }

    // Validate required fields
    if (state.startPrice == null || state.startPrice!.isEmpty) {
      toastification.show(
        context: context,
        type: ToastificationType.error,
        title: const Text('Validation Error'),
        description: const Text(
          'Please fill in the start price in Advanced Settings tab',
        ),
        autoCloseDuration: const Duration(seconds: 3),
      );
      _tabController.animateTo(1); // Switch to Advanced Settings tab
      return;
    }

    if (state.startTime == null || state.endTime == null) {
      toastification.show(
        context: context,
        type: ToastificationType.error,
        title: const Text('Validation Error'),
        description: const Text(
          'Please set auction start and end times in Advanced Settings tab',
        ),
        autoCloseDuration: const Duration(seconds: 3),
      );
      _tabController.animateTo(1); // Switch to Advanced Settings tab
      return;
    }

    final success = await notifier.submitAuction();

    if (success && context.mounted) {
      toastification.show(
        context: context,
        type: ToastificationType.success,
        title: const Text('Auction created successfully!'),
        autoCloseDuration: const Duration(seconds: 3),
      );
      context.go('/');
    } else if (context.mounted) {
      final error = ref.read(createAuctionProvider).error;
      toastification.show(
        context: context,
        type: ToastificationType.error,
        title: const Text('Failed to create auction'),
        description: Text(error ?? 'Unknown error'),
        autoCloseDuration: const Duration(seconds: 5),
      );
    }
  }
}
