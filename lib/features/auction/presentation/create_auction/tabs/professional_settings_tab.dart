import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/theme/app_theme.dart';
import '../create_auction_provider.dart';
import '../create_auction_state.dart';

class ProfessionalSettingsTab extends ConsumerStatefulWidget {
  const ProfessionalSettingsTab({super.key});

  @override
  ConsumerState<ProfessionalSettingsTab> createState() =>
      _ProfessionalSettingsTabState();
}

class _ProfessionalSettingsTabState extends ConsumerState<ProfessionalSettingsTab> {
  final _bidIncrementController = TextEditingController();
  final _commissionRateController = TextEditingController();
  final _buyerPremiumController = TextEditingController();
  final _timezoneController = TextEditingController();
  final _lotNumberController = TextEditingController();
  final _businessLicenseController = TextEditingController();
  final _sellerRatingController = TextEditingController();
  final _catalogReferenceController = TextEditingController();
  final _auctioneerNotesController = TextEditingController();
  final _appraisalCertificateController = TextEditingController();
  final _conditionReportController = TextEditingController();
  final _biddingRulesController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize controllers with existing state values
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = ref.read(createAuctionProvider);
      _bidIncrementController.text = state.bidIncrement ?? '';
      _commissionRateController.text = state.commissionRate ?? '';
      _buyerPremiumController.text = state.buyerPremium ?? '';
      _timezoneController.text = state.timezone ?? '';
      _lotNumberController.text = state.lotNumber ?? '';
      _businessLicenseController.text = state.businessLicense ?? '';
      _sellerRatingController.text = state.sellerRating ?? '';
      _catalogReferenceController.text = state.catalogReference ?? '';
      _auctioneerNotesController.text = state.auctioneerNotes ?? '';
      _appraisalCertificateController.text = state.appraisalCertificate ?? '';
      _conditionReportController.text = state.conditionReport ?? '';
      _biddingRulesController.text = state.biddingRules ?? '';
    });
  }

  @override
  void dispose() {
    _bidIncrementController.dispose();
    _commissionRateController.dispose();
    _buyerPremiumController.dispose();
    _timezoneController.dispose();
    _lotNumberController.dispose();
    _businessLicenseController.dispose();
    _sellerRatingController.dispose();
    _catalogReferenceController.dispose();
    _auctioneerNotesController.dispose();
    _appraisalCertificateController.dispose();
    _conditionReportController.dispose();
    _biddingRulesController.dispose();
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
              // Authentication & Shipping Section
              _buildSection(
                title: 'Authentication & Shipping',
                icon: Icons.verified,
                children: [
                  _buildSwitchField(
                    title: 'Authentication Required',
                    subtitle: 'Require buyer authentication before bidding',
                    value: state.authenticationRequired,
                    onChanged: (value) => notifier.setAuthenticationRequired(value),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  _buildSwitchField(
                    title: 'Shipping Included',
                    subtitle: 'Shipping costs are included in the final price',
                    value: state.shippingIncluded,
                    onChanged: (value) => notifier.setShippingIncluded(value),
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.spacingXl),

              // Auction House Settings Section
              _buildSection(
                title: 'Auction House Settings',
                icon: Icons.account_balance,
                children: [
                  _buildTextField(
                    controller: _bidIncrementController,
                    label: 'Bid Increment (Optional)',
                    hint: 'Minimum amount bids must increase by',
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.trending_up,
                    errorText: state.bidIncrementError,
                    onChanged: (value) => notifier.setBidIncrement(value),
                    suffixText: 'USD',
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  _buildTextField(
                    controller: _commissionRateController,
                    label: 'Commission Rate (Optional)',
                    hint: 'Auction house commission (0.00 - 1.00)',
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.percent,
                    errorText: state.commissionRateError,
                    onChanged: (value) => notifier.setCommissionRate(value),
                    suffixText: '%',
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  _buildTextField(
                    controller: _buyerPremiumController,
                    label: 'Buyer Premium (Optional)',
                    hint: 'Additional fee paid by buyer (0.00 - 1.00)',
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.add_circle,
                    errorText: state.buyerPremiumError,
                    onChanged: (value) => notifier.setBuyerPremium(value),
                    suffixText: '%',
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.spacingXl),

              // Reserve Settings Section
              _buildSection(
                title: 'Reserve Settings',
                icon: Icons.shield,
                children: [
                  _buildSwitchField(
                    title: 'Reserve Price Visible',
                    subtitle: 'Show reserve price to bidders',
                    value: state.reserveVisible,
                    onChanged: (value) => notifier.setReserveVisible(value),
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.spacingXl),

              // Catalog & Organization Section
              _buildSection(
                title: 'Catalog & Organization',
                icon: Icons.library_books,
                children: [
                  _buildTextField(
                    controller: _lotNumberController,
                    label: 'Lot Number (Optional)',
                    hint: 'Catalog lot number for organization',
                    prefixIcon: Icons.tag,
                    errorText: state.lotNumberError,
                    onChanged: (value) => notifier.setLotNumber(value),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  _buildTextField(
                    controller: _timezoneController,
                    label: 'Timezone (Optional)',
                    hint: 'Auction timezone (e.g., America/New_York)',
                    prefixIcon: Icons.schedule,
                    errorText: state.timezoneError,
                    onChanged: (value) => notifier.setTimezone(value),
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.spacingXl),

              // Business Information Section
              _buildSection(
                title: 'Business Information (Optional)',
                icon: Icons.business,
                children: [
                  _buildTextField(
                    controller: _businessLicenseController,
                    label: 'Business License',
                    hint: 'Your business license number',
                    prefixIcon: Icons.business_center,
                    errorText: state.businessLicenseError,
                    onChanged: (value) => notifier.setBusinessLicense(value),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  _buildTextField(
                    controller: _sellerRatingController,
                    label: 'Seller Rating',
                    hint: 'Your seller rating (0.0 - 5.0)',
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.star,
                    errorText: state.sellerRatingError,
                    onChanged: (value) => notifier.setSellerRating(value),
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.spacingXl),

              // Catalog Information Section
              _buildSection(
                title: 'Catalog Information (Optional)',
                icon: Icons.library_books,
                children: [
                  _buildTextField(
                    controller: _catalogReferenceController,
                    label: 'Catalog Reference',
                    hint: 'Reference to catalog or sale number',
                    prefixIcon: Icons.library_books,
                    errorText: state.catalogReferenceError,
                    onChanged: (value) => notifier.setCatalogReference(value),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  _buildTextField(
                    controller: _auctioneerNotesController,
                    label: 'Auctioneer Notes',
                    hint: 'Special notes from the auctioneer',
                    maxLines: 3,
                    prefixIcon: Icons.note,
                    errorText: state.auctioneerNotesError,
                    onChanged: (value) => notifier.setAuctioneerNotes(value),
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.spacingXl),

              // Condition Report Section
              _buildSection(
                title: 'Condition Report (Optional)',
                icon: Icons.assignment,
                children: [
                  _buildTextField(
                    controller: _appraisalCertificateController,
                    label: 'Appraisal Certificate URL',
                    hint: 'URL to appraisal certificate document',
                    prefixIcon: Icons.link,
                    errorText: state.appraisalCertificateError,
                    onChanged: (value) => notifier.setAppraisalCertificate(value),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  _buildTextField(
                    controller: _conditionReportController,
                    label: 'Condition Report',
                    hint: 'Describe the item\'s condition',
                    maxLines: 3,
                    prefixIcon: Icons.assignment,
                    onChanged: (value) => notifier.setConditionReport(value),
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.spacingXl),

              // Additional Settings Section
              _buildSection(
                title: 'Additional Settings',
                icon: Icons.settings,
                children: [
                  _buildSwitchField(
                    title: 'Insurance Required',
                    subtitle: 'Require insurance for shipping',
                    value: state.insuranceRequired,
                    onChanged: (value) => notifier.setInsuranceRequired(value),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  _buildSwitchField(
                    title: 'Pickup Available',
                    subtitle: 'Allow buyers to pick up items in person',
                    value: state.pickupAvailable,
                    onChanged: (value) => notifier.setPickupAvailable(value),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  _buildTextField(
                    controller: _biddingRulesController,
                    label: 'Bidding Rules',
                    hint: 'Describe bidding rules and restrictions',
                    maxLines: 3,
                    prefixIcon: Icons.rule,
                    onChanged: (value) => notifier.setBiddingRules(value),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  _buildFinancingOptionsField(state, notifier),
                ],
              ),

              const SizedBox(height: AppTheme.spacingXl),

              // Payment Terms Section
              _buildSection(
                title: 'Payment Terms (Optional)',
                icon: Icons.payment,
                children: [
                  _buildPaymentTermsField(state, notifier),
                ],
              ),

              const SizedBox(height: AppTheme.spacingXl),

              // Info Section
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.spacingLg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
                          const SizedBox(width: AppTheme.spacingSm),
                          Text(
                            'Professional Auction Features',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppTheme.spacingMd),
                      Text(
                        'These settings are designed for professional auction houses and galleries. '
                        'Leave them blank for standard consumer auctions.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
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
    String? suffixText,
    int? maxLines,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixText: suffixText,
        border: const OutlineInputBorder(),
        errorText: errorText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingMd,
          vertical: AppTheme.spacingMd,
        ),
      ),
    );
  }

  Widget _buildSwitchField({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
      activeColor: Theme.of(context).primaryColor,
    );
  }

  Widget _buildPaymentTermsField(
    CreateAuctionState state,
    CreateAuctionNotifier notifier,
  ) {
    return InkWell(
      onTap: () => _showPaymentTermsDialog(context, state, notifier),
      child: InputDecorator(
        decoration: const InputDecoration(
          labelText: 'Payment Terms',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.description),
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppTheme.spacingMd,
            vertical: AppTheme.spacingMd,
          ),
        ),
        child: Text(
          state.paymentTerms.isNotEmpty
              ? '${state.paymentTerms.length} terms defined'
              : 'Define payment terms and accepted methods',
          style: TextStyle(color: state.paymentTerms.isNotEmpty ? null : Colors.grey[600]),
        ),
      ),
    );
  }

  void _showPaymentTermsDialog(
    BuildContext context,
    CreateAuctionState state,
    CreateAuctionNotifier notifier,
  ) {
    final acceptedMethodsController = TextEditingController(
      text: (state.paymentTerms['accepted_methods'] as List<dynamic>?)?.join(', ') ?? '',
    );
    final paymentWindowController = TextEditingController(
      text: state.paymentTerms['payment_window_days']?.toString() ?? '',
    );
    final depositRequiredController = TextEditingController(
      text: state.paymentTerms['deposit_required']?.toString() ?? '',
    );

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Payment Terms'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: acceptedMethodsController,
                decoration: const InputDecoration(
                  labelText: 'Accepted Payment Methods',
                  hintText: 'e.g., Credit Card, Bank Transfer, Wire',
                ),
              ),
              const SizedBox(height: AppTheme.spacingMd),
              TextField(
                controller: paymentWindowController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Payment Window (Days)',
                  hintText: 'e.g., 7',
                ),
              ),
              const SizedBox(height: AppTheme.spacingMd),
              TextField(
                controller: depositRequiredController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Deposit Required (%)',
                  hintText: 'e.g., 10',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final paymentTerms = <String, dynamic>{};

              if (acceptedMethodsController.text.isNotEmpty) {
                paymentTerms['accepted_methods'] = acceptedMethodsController.text
                    .split(',')
                    .map((e) => e.trim())
                    .where((e) => e.isNotEmpty)
                    .toList();
              }

              if (paymentWindowController.text.isNotEmpty) {
                paymentTerms['payment_window_days'] = int.tryParse(paymentWindowController.text);
              }

              if (depositRequiredController.text.isNotEmpty) {
                paymentTerms['deposit_required'] = double.tryParse(depositRequiredController.text);
              }

              notifier.setPaymentTerms(paymentTerms);
              Navigator.of(dialogContext).pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Widget _buildFinancingOptionsField(
    CreateAuctionState state,
    CreateAuctionNotifier notifier,
  ) {
    return InkWell(
      onTap: () => _showFinancingOptionsDialog(context, state, notifier),
      child: InputDecorator(
        decoration: const InputDecoration(
          labelText: 'Financing Options',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.account_balance_wallet),
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppTheme.spacingMd,
            vertical: AppTheme.spacingMd,
          ),
        ),
        child: Text(
          state.financingOptions.isNotEmpty
              ? '${state.financingOptions.length} financing option(s) configured'
              : 'Configure financing options',
          style: TextStyle(color: state.financingOptions.isNotEmpty ? null : Colors.grey[600]),
        ),
      ),
    );
  }

  void _showFinancingOptionsDialog(
    BuildContext context,
    CreateAuctionState state,
    CreateAuctionNotifier notifier,
  ) {
    // For simplicity, we'll just show a message that this feature is coming soon
    // In a real implementation, this would allow adding multiple financing options
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Financing Options'),
        content: const Text(
          'Financing options configuration will be available in a future update. '
          'For now, you can specify financing availability in the Payment Terms section.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}