import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/theme/app_theme.dart';
import 'create_auction_provider.dart';
import 'steps/basic_info_step.dart';
import 'steps/pricing_step.dart';
import 'steps/images_step.dart';
import 'steps/review_step.dart';

class CreateAuctionScreen extends ConsumerWidget {
  const CreateAuctionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createAuctionProvider);
    final notifier = ref.read(createAuctionProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Auction'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Step Indicator
          _StepIndicator(currentStep: state.currentStep),
          
          // Step Content
          Expanded(
            child: IndexedStack(
              index: state.currentStep,
              children: const [
                BasicInfoStep(),
                PricingStep(),
                ImagesStep(),
                ReviewStep(),
              ],
            ),
          ),
          
          // Navigation Buttons
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingLg),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              boxShadow: AppTheme.shadowMd,
            ),
            child: Row(
              children: [
                if (state.currentStep > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: state.isSubmitting
                          ? null
                          : () => notifier.previousStep(),
                      child: const Text('Back'),
                    ),
                  ),
                if (state.currentStep > 0) const SizedBox(width: AppTheme.spacingMd),
                Expanded(
                  flex: 2,
                  child: state.currentStep < 3
                      ? ElevatedButton(
                          onPressed: state.isSubmitting
                              ? null
                              : () => notifier.nextStep(),
                          child: const Text('Next'),
                        )
                      : ElevatedButton(
                          onPressed: state.isSubmitting
                              ? null
                              : () => _handleSubmit(context, ref),
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleSubmit(BuildContext context, WidgetRef ref) async {
    final notifier = ref.read(createAuctionProvider.notifier);
    
    final success = await notifier.submitAuction();
    
    if (success && context.mounted) {
      toastification.show(
        context: context,
        type: ToastificationType.success,
        title: const Text('Auction created successfully!'),
        autoCloseDuration: const Duration(seconds: 3),
      );
      context.go('/home');
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

class _StepIndicator extends StatelessWidget {
  final int currentStep;

  const _StepIndicator({required this.currentStep});

  @override
  Widget build(BuildContext context) {
    final steps = ['Basic', 'Pricing', 'Images', 'Review'];
    
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingLg,
        vertical: AppTheme.spacingMd,
      ),
      color: AppTheme.surfaceColor,
      child: Row(
        children: List.generate(steps.length * 2 - 1, (index) {
          if (index.isOdd) {
            // Connector line
            final stepIndex = index ~/ 2;
            return Expanded(
              child: Container(
                height: 2,
                color: stepIndex < currentStep
                    ? AppTheme.primaryColor
                    : AppTheme.borderColor,
              ),
            );
          }
          
          // Step circle
          final stepIndex = index ~/ 2;
          final isActive = stepIndex == currentStep;
          final isCompleted = stepIndex < currentStep;
          
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted || isActive
                      ? AppTheme.primaryColor
                      : AppTheme.borderColor,
                  border: Border.all(
                    color: isActive
                        ? AppTheme.primaryColor
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: isCompleted
                      ? const Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        )
                      : Text(
                          '${stepIndex + 1}',
                          style: TextStyle(
                            color: isActive || isCompleted
                                ? Colors.white
                                : AppTheme.textMuted,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                steps[stepIndex],
                style: TextStyle(
                  fontSize: 11,
                  color: isActive
                      ? AppTheme.primaryColor
                      : AppTheme.textMuted,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
