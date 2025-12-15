import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../../../../core/providers/country_state_city_providers.dart';
import '../create_auction/create_auction_provider.dart';

class AdvancedSettingsTab extends ConsumerStatefulWidget {
  const AdvancedSettingsTab({super.key});

  @override
  ConsumerState<AdvancedSettingsTab> createState() => _AdvancedSettingsTabState();
}

class _AdvancedSettingsTabState extends ConsumerState<AdvancedSettingsTab> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers for form fields
  final _startPriceController = TextEditingController();
  final _reservePriceController = TextEditingController();
  final _tagsController = TextEditingController();
  final _returnPolicyController = TextEditingController();
  final _bidIncrementController = TextEditingController();
  final _commissionRateController = TextEditingController();
  final _buyerPremiumController = TextEditingController();
  final _timezoneController = TextEditingController();
  final _lotNumberController = TextEditingController();
  Map<String, dynamic>? _selectedCountry;
  Map<String, dynamic>? _selectedState;
  Map<String, dynamic>? _selectedCity;
  final _addressLine1Controller = TextEditingController();
  final _addressLine2Controller = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _paymentTermsController = TextEditingController();
  final _conditionReportController = TextEditingController();
  final _biddingRulesController = TextEditingController();
  final _financingOptionsController = TextEditingController();
  
  // Date/Time variables
  DateTime? _startTime;
  DateTime? _endTime;
  
  // Auction type
  String _auctionType = 'english';
  
  // Boolean toggles
  bool _authenticationRequired = false;
  bool _shippingIncluded = false;
  bool _reserveVisible = false;

  @override
  void initState() {
    super.initState();
    print('🔧 TAB: AdvancedSettingsTab - initState called');
    
    // Initialize default values
    _startTime = DateTime.now().add(const Duration(hours: 1));
    _endTime = DateTime.now().add(const Duration(days: 7));
    
    // Load existing auction data if any and then update with defaults
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadExistingData();
      // Save default values to provider if not already set
      _updateAuctionData();
    });
  }

  void _loadExistingData() {
    final auctionState = ref.read(createAuctionProvider);
    
    if (auctionState.startPrice != null && auctionState.startPrice!.isNotEmpty) {
      _startPriceController.text = auctionState.startPrice!;
    }
    
    if (auctionState.reservePrice != null && auctionState.reservePrice!.isNotEmpty) {
      _reservePriceController.text = auctionState.reservePrice!;
    }
    
    if (auctionState.tags.isNotEmpty) {
      _tagsController.text = auctionState.tags.join(', ');
    }
    
    if (auctionState.returnPolicy != null) {
      _returnPolicyController.text = auctionState.returnPolicy!;
    }
    
    if (auctionState.bidIncrement != null) {
      _bidIncrementController.text = auctionState.bidIncrement!;
    }
    
    if (auctionState.commissionRate != null) {
      _commissionRateController.text = auctionState.commissionRate!;
    }
    
    if (auctionState.buyerPremium != null) {
      _buyerPremiumController.text = auctionState.buyerPremium!;
    }
    
    if (auctionState.timezone != null) {
      _timezoneController.text = auctionState.timezone!;
    }
    
    if (auctionState.lotNumber != null) {
      _lotNumberController.text = auctionState.lotNumber!;
    }
    
    // Load location details from dynamic attributes
    final locationDetails = auctionState.dynamicFields['location_details'] as Map<String, dynamic>?;
    if (locationDetails != null) {
      // No need to set text controllers for country/state/city, handled by dropdowns
      _addressLine1Controller.text = locationDetails['address_line_1'] ?? '';
      _addressLine2Controller.text = locationDetails['address_line_2'] ?? '';
      _postalCodeController.text = locationDetails['postal_code'] ?? locationDetails['zip_code'] ?? '';
    }
    
    // Load professional details
    if (auctionState.paymentTerms.isNotEmpty) {
      _paymentTermsController.text = auctionState.paymentTerms.toString();
    }
    
    if (auctionState.conditionReport != null && auctionState.conditionReport!.isNotEmpty) {
      _conditionReportController.text = auctionState.conditionReport!;
    }
    
    if (auctionState.biddingRules != null && auctionState.biddingRules!.isNotEmpty) {
      _biddingRulesController.text = auctionState.biddingRules!;
    }
    
    if (auctionState.financingOptions.isNotEmpty) {
      _financingOptionsController.text = auctionState.financingOptions.toString();
    }
    
    // Load boolean values
    _authenticationRequired = auctionState.authenticationRequired;
    _shippingIncluded = auctionState.shippingIncluded;
    _reserveVisible = auctionState.reserveVisible;
    
    if (auctionState.startTime != null) {
      _startTime = auctionState.startTime;
    }
    
    if (auctionState.endTime != null) {
      _endTime = auctionState.endTime;
    }
    
    // Map AuctionType enum to string
    _auctionType = auctionState.type.name;
    
    setState(() {});
  }

  void _updateAuctionData() {
    // Parse start price
    double? startPrice;
    if (_startPriceController.text.isNotEmpty) {
      startPrice = double.tryParse(_startPriceController.text);
    }
    
    // Parse reserve price
    double? reservePrice;
    if (_reservePriceController.text.isNotEmpty) {
      reservePrice = double.tryParse(_reservePriceController.text);
    }
    
    // Parse tags
    List<String> tags = [];
    if (_tagsController.text.isNotEmpty) {
      tags = _tagsController.text
          .split(',')
          .map((tag) => tag.trim())
          .where((tag) => tag.isNotEmpty)
          .toList();
    }
    
    // Update provider with all settings
    ref.read(createAuctionProvider.notifier).updateAuctionSettings(
      startPrice: startPrice,
      reservePrice: reservePrice,
      startTime: _startTime,
      endTime: _endTime,
      auctionType: _auctionType,
      tags: tags,
      returnPolicy: _returnPolicyController.text.isNotEmpty 
          ? _returnPolicyController.text 
          : null,
      bidIncrement: _bidIncrementController.text.isNotEmpty 
          ? _bidIncrementController.text 
          : null,
      commissionRate: _commissionRateController.text.isNotEmpty 
          ? _commissionRateController.text 
          : null,
      buyerPremium: _buyerPremiumController.text.isNotEmpty 
          ? _buyerPremiumController.text 
          : null,
      timezone: _timezoneController.text.isNotEmpty 
          ? _timezoneController.text 
          : null,
      lotNumber: _lotNumberController.text.isNotEmpty 
          ? _lotNumberController.text 
          : null,
      authenticationRequired: _authenticationRequired,
      shippingIncluded: _shippingIncluded,
      reserveVisible: _reserveVisible,
      paymentTerms: _paymentTermsController.text.isNotEmpty ? {'description': _paymentTermsController.text} : null,
      conditionReport: _conditionReportController.text.isNotEmpty ? _conditionReportController.text : null,
      biddingRules: _biddingRulesController.text.isNotEmpty ? _biddingRulesController.text : null,
      financingOptions: _financingOptionsController.text.isNotEmpty ? [{'description': _financingOptionsController.text}] : null,
    );
    
    // Update location details in dynamic fields
    if (_selectedCountry != null || _selectedState != null || _selectedCity != null ||
        _addressLine1Controller.text.isNotEmpty ||
        _addressLine2Controller.text.isNotEmpty ||
        _postalCodeController.text.isNotEmpty) {
      final locationDetails = {
        if (_selectedCountry != null) 'country': _selectedCountry?['name'],
        if (_selectedState != null) 'state': _selectedState?['name'],
        if (_selectedCity != null) 'city': _selectedCity?['name'],
        if (_addressLine1Controller.text.isNotEmpty) 'address_line_1': _addressLine1Controller.text.trim(),
        if (_addressLine2Controller.text.isNotEmpty) 'address_line_2': _addressLine2Controller.text.trim(),
        if (_postalCodeController.text.isNotEmpty) 'postal_code': _postalCodeController.text.trim(),
      };
      ref.read(createAuctionProvider.notifier).updateDynamicField('location_details', locationDetails);
    }
  }

  Future<void> _selectDateTime(BuildContext context, bool isStartTime) async {
    final date = await showDatePicker(
      context: context,
      initialDate: isStartTime 
          ? (_startTime ?? DateTime.now().add(const Duration(hours: 1)))
          : (_endTime ?? DateTime.now().add(const Duration(days: 7))),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    
    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(
          isStartTime 
              ? (_startTime ?? DateTime.now().add(const Duration(hours: 1)))
              : (_endTime ?? DateTime.now().add(const Duration(days: 7))),
        ),
      );
      
      if (time != null) {
        final dateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
        
        setState(() {
          if (isStartTime) {
            _startTime = dateTime;
          } else {
            _endTime = dateTime;
          }
        });
        
        _updateAuctionData();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[50],
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(5.0),
            children: [
              // Pricing Section
              _buildSection(
                title: 'Pricing Settings',
                icon: Icons.monetization_on,
                children: [
                  _buildPriceField(
                    controller: _startPriceController,
                    label: 'Start Price (₹)',
                    hint: 'Enter starting bid amount',
                    onChanged: (value) => _updateAuctionData(),
                  ),
                  const SizedBox(height: 16),
                  _buildPriceField(
                    controller: _reservePriceController,
                    label: 'Reserve Price (₹)',
                    hint: 'Must be ≥ start price (optional)',
                    isRequired: false,
                    onChanged: (value) => _updateAuctionData(),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Timing Section
              _buildSection(
                title: 'Auction Timing',
                icon: Icons.schedule,
                children: [
                  _buildDateTimeField(
                    label: 'Start Time',
                    dateTime: _startTime,
                    onTap: () => _selectDateTime(context, true),
                  ),
                  const SizedBox(height: 16),
                  _buildDateTimeField(
                    label: 'End Time',
                    dateTime: _endTime,
                    onTap: () => _selectDateTime(context, false),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Auction Type Section
              _buildSection(
                title: 'Auction Type',
                icon: Icons.gavel,
                children: [
                  _buildAuctionTypeSelector(),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Additional Settings Section
              _buildSection(
                title: 'Additional Settings',
                icon: Icons.settings,
                children: [
                  _buildTagsField(),
                  const SizedBox(height: 16),
                  _buildReturnPolicyField(),
                ],
              ),

              const SizedBox(height: 24),

              // Location Section
              _buildSection(
                title: 'Location',
                icon: Icons.location_on,
                children: [
                  _buildLocationFields(),
                ],
              ),

              const SizedBox(height: 24),

              // Payment & Fees Section
              _buildSection(
                title: 'Payment & Fees',
                icon: Icons.account_balance_wallet,
                children: [
                  _buildPaymentAndFeesFields(),
                ],
              ),

              const SizedBox(height: 24),

              // Shipping Options Section
              _buildSection(
                title: 'Shipping Options',
                icon: Icons.local_shipping,
                children: [
                  _buildShippingOptionsFields(),
                ],
              ),

              const SizedBox(height: 24),

              // Auction Rules Section
              _buildSection(
                title: 'Auction Rules',
                icon: Icons.gavel,
                children: [
                  _buildAuctionRulesFields(),
                ],
              ),

              const SizedBox(height: 24),

              // Professional Details Section
              _buildSection(
                title: 'Professional Details',
                icon: Icons.business,
                children: [
                  _buildProfessionalDetailsFields(),
                ],
              ),

              const SizedBox(height: 32),
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
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 24, color: Theme.of(context).primaryColor),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildPriceField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool isRequired = true,
    required Function(String) onChanged,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixText: '₹ ',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: isRequired ? (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        final price = double.tryParse(value);
        if (price == null || price <= 0) {
          return 'Please enter a valid price';
        }
        return null;
      } : null,
      onChanged: onChanged,
    );
  }

  Widget _buildDateTimeField({
    required String label,
    required DateTime? dateTime,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        child: Text(
          dateTime != null
              ? DateFormat('MMM dd, yyyy - hh:mm a').format(dateTime)
              : 'Select $label',
          style: TextStyle(
            color: dateTime != null ? Colors.black87 : Colors.grey[600],
          ),
        ),
      ),
    );
  }

  Widget _buildAuctionTypeSelector() {
    return Column(
      children: [
        RadioListTile<String>(
          value: 'english',
          groupValue: _auctionType,
          onChanged: (value) {
            setState(() {
              _auctionType = value!;
            });
            _updateAuctionData();
          },
          title: const Text('English Auction'),
          subtitle: const Text('Traditional ascending bid auction'),
          activeColor: Theme.of(context).primaryColor,
        ),
        RadioListTile<String>(
          value: 'dutch',
          groupValue: _auctionType,
          onChanged: (value) {
            setState(() {
              _auctionType = value!;
            });
            _updateAuctionData();
          },
          title: const Text('Dutch Auction'),
          subtitle: const Text('Price starts high and decreases over time'),
          activeColor: Theme.of(context).primaryColor,
        ),
        RadioListTile<String>(
          value: 'sealed_bid',
          groupValue: _auctionType,
          onChanged: (value) {
            setState(() {
              _auctionType = value!;
            });
            _updateAuctionData();
          },
          title: const Text('Sealed Bid'),
          subtitle: const Text('One-time sealed bid auction'),
          activeColor: Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  Widget _buildTagsField() {
    return TextFormField(
      controller: _tagsController,
      decoration: InputDecoration(
        labelText: 'Tags',
        hintText: 'Enter tags separated by commas (e.g., laptop, apple, macbook)',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.white,
        helperText: 'Tags help buyers find your auction easily',
      ),
      maxLines: 2,
      onChanged: (value) => _updateAuctionData(),
    );
  }

  Widget _buildReturnPolicyField() {
    return TextFormField(
      controller: _returnPolicyController,
      decoration: InputDecoration(
        labelText: 'Return Policy',
        hintText: 'Describe your return policy (e.g., 14-day return, original packaging required)',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      maxLines: 3,
      onChanged: (value) => _updateAuctionData(),
    );
  }

  Widget _buildLocationFields() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on, size: 20, color: Theme.of(context).primaryColor),
              const SizedBox(width: 8),
              Text(
                'Auction Location',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          DropdownSearch<Map<String, dynamic>>(
            asyncItems: (String? filter) async {
              return await ref.read(countriesProvider(filter).future);
            },
            itemAsString: (item) => item['name'] ?? '',
            selectedItem: _selectedCountry,
            dropdownBuilder: (context, selectedItem) {
              return Text(selectedItem?['name'] ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500));
            },
            popupProps: PopupProps.menu(
              itemBuilder: (context, item, isSelected) => ListTile(
                title: Text(item['name'] ?? ''),
                selected: isSelected,
              ),
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  labelText: 'Search Country',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: 'Country',
                hintText: 'Select Country',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.flag, color: Colors.blue),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _selectedCountry = value;
                _selectedState = null;
                _selectedCity = null;
              });
              _updateAuctionData();
            },
            validator: (value) => value == null ? 'Country is required' : null,
          ),
          const SizedBox(height: 12),
          if (_selectedCountry != null)
            DropdownSearch<Map<String, dynamic>>(
              asyncItems: (String? filter) async {
                return await ref.read(statesProvider({
                  'countryId': _selectedCountry?['id']?.toString(),
                  'search': filter,
                }).future);
              },
              itemAsString: (item) => item['name'] ?? '',
              selectedItem: _selectedState,
              dropdownBuilder: (context, selectedItem) {
                return Text(selectedItem?['name'] ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500));
              },
              popupProps: PopupProps.menu(
                itemBuilder: (context, item, isSelected) => ListTile(
                  title: Text(item['name'] ?? ''),
                  selected: isSelected,
                ),
                showSearchBox: true,
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    labelText: 'Search State',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: 'State / Province / Region',
                  hintText: 'Select State',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.map, color: Colors.green),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _selectedState = value;
                  _selectedCity = null;
                });
                _updateAuctionData();
              },
              validator: (value) => value == null ? 'State is required' : null,
            ),
          const SizedBox(height: 12),
          if (_selectedState != null)
            DropdownSearch<Map<String, dynamic>>(
              asyncItems: (String? filter) async {
                return await ref.read(citiesProvider({
                  'stateId': _selectedState?['id']?.toString(),
                  'search': filter,
                }).future);
              },
              itemAsString: (item) => item['name'] ?? '',
              selectedItem: _selectedCity,
              dropdownBuilder: (context, selectedItem) {
                return Text(selectedItem?['name'] ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500));
              },
              popupProps: PopupProps.menu(
                itemBuilder: (context, item, isSelected) => ListTile(
                  title: Text(item['name'] ?? ''),
                  selected: isSelected,
                ),
                showSearchBox: true,
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    labelText: 'Search City',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: 'City',
                  hintText: 'Select City',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.location_city, color: Colors.orange),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _selectedCity = value;
                });
                _updateAuctionData();
              },
              validator: (value) => value == null ? 'City is required' : null,
            ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _addressLine1Controller,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              labelText: 'Address Line 1',
              hintText: 'Street address, building name, etc.',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.home, color: Colors.purple),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            onChanged: (value) => _updateAuctionData(),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _addressLine2Controller,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              labelText: 'Address Line 2 (Optional)',
              hintText: 'Apartment, suite, unit, building number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.home_work, color: Colors.purple),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            onChanged: (value) => _updateAuctionData(),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _postalCodeController,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              labelText: 'Postal Code / ZIP Code',
              hintText: 'e.g., 10001, SW1A 1AA, 400001',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.local_post_office, color: Colors.red),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            onChanged: (value) => _updateAuctionData(),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentAndFeesFields() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.trending_up, size: 20, color: Colors.blue[700]),
                  const SizedBox(width: 8),
                  Text(
                    'Bid Increment',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Minimum amount bids can increase by',
                style: TextStyle(fontSize: 12, color: Colors.blue[600]),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _bidIncrementController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: 'e.g., 100, 500, 1000',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixText: '₹ ',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                onChanged: (value) => _updateAuctionData(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.percent, size: 20, color: Colors.green[700]),
                  const SizedBox(width: 8),
                  Text(
                    'Buyer Premium',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Additional percentage added to final bid price',
                style: TextStyle(fontSize: 12, color: Colors.green[600]),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _buyerPremiumController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: 'e.g., 10, 15, 20',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  suffixText: '%',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                onChanged: (value) => _updateAuctionData(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.orange[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.orange[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.account_balance_wallet, size: 20, color: Colors.orange[700]),
                  const SizedBox(width: 8),
                  Text(
                    'Commission Rate',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Platform fee charged on final sale price',
                style: TextStyle(fontSize: 12, color: Colors.orange[600]),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _commissionRateController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: 'e.g., 5, 7.5, 10',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  suffixText: '%',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                onChanged: (value) => _updateAuctionData(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShippingOptionsFields() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.purple[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.local_shipping, size: 20, color: Colors.purple[700]),
              const SizedBox(width: 8),
              Text(
                'Shipping & Delivery',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[700],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Column(
              children: [
                SwitchListTile(
                  value: _shippingIncluded,
                  onChanged: (value) {
                    setState(() {
                      _shippingIncluded = value;
                    });
                    _updateAuctionData();
                  },
                  title: const Text(
                    'Seller Covers Shipping',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                    'Buyer pays nothing for shipping costs',
                    style: TextStyle(fontSize: 12),
                  ),
                  activeColor: Colors.purple[700],
                  contentPadding: EdgeInsets.zero,
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Icon(
                        _shippingIncluded ? Icons.check_circle : Icons.cancel,
                        color: _shippingIncluded ? Colors.green : Colors.red,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _shippingIncluded
                              ? '✓ Free shipping for buyers'
                              : '✗ Buyers pay their own shipping',
                          style: TextStyle(
                            color: _shippingIncluded ? Colors.green[700] : Colors.red[700],
                            fontWeight: FontWeight.w500,
                          ),
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

  Widget _buildAuctionRulesFields() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.red[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.red[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.verified_user, size: 20, color: Colors.red[700]),
                  const SizedBox(width: 8),
                  Text(
                    'Bidder Verification',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Require bidders to verify their identity',
                style: TextStyle(fontSize: 12, color: Colors.red[600]),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                value: _authenticationRequired,
                onChanged: (value) {
                  setState(() {
                    _authenticationRequired = value;
                  });
                  _updateAuctionData();
                },
                title: const Text(
                  'Require Authentication',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: const Text(
                  'Only verified bidders can participate',
                  style: TextStyle(fontSize: 12),
                ),
                activeColor: Colors.red[700],
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.teal[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.teal[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.visibility, size: 20, color: Colors.teal[700]),
                  const SizedBox(width: 8),
                  Text(
                    'Reserve Price',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Control visibility of minimum sale price',
                style: TextStyle(fontSize: 12, color: Colors.teal[600]),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                value: _reserveVisible,
                onChanged: (value) {
                  setState(() {
                    _reserveVisible = value;
                  });
                  _updateAuctionData();
                },
                title: const Text(
                  'Show Reserve Price',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: const Text(
                  'Display minimum price to bidders',
                  style: TextStyle(fontSize: 12),
                ),
                activeColor: Colors.teal[700],
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.indigo[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.indigo[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.schedule, size: 20, color: Colors.indigo[700]),
                  const SizedBox(width: 8),
                  Text(
                    'Timezone & Lot Details',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _timezoneController,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Timezone',
                  hintText: 'e.g., Asia/Kolkata, America/New_York, Europe/London',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.language),
                  helperText: 'Timezone for auction timing',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                onChanged: (value) => _updateAuctionData(),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _lotNumberController,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Lot Number (Optional)',
                  hintText: 'e.g., 001, 2025-001',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.tag),
                  helperText: 'Reference number for this auction lot',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                onChanged: (value) => _updateAuctionData(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfessionalDetailsFields() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.purple[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.purple[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.payment, size: 20, color: Colors.purple[700]),
                  const SizedBox(width: 8),
                  Text(
                    'Payment Terms',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Specify accepted payment methods and terms',
                style: TextStyle(fontSize: 12, color: Colors.purple[600]),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _paymentTermsController,
                maxLines: 3,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Payment Terms',
                  hintText: 'e.g., Cash, Bank Transfer, Credit Card accepted',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.payment),
                  helperText: 'Describe accepted payment methods',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                onChanged: (value) => _updateAuctionData(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.amber[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.amber[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.assignment, size: 20, color: Colors.amber[700]),
                  const SizedBox(width: 8),
                  Text(
                    'Condition Report',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Detailed description of item condition',
                style: TextStyle(fontSize: 12, color: Colors.amber[600]),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _conditionReportController,
                maxLines: 4,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Condition Report',
                  hintText: 'Describe item condition, wear, damage, etc.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.assignment),
                  helperText: 'Provide detailed condition assessment',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                onChanged: (value) => _updateAuctionData(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.cyan[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.cyan[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.rule, size: 20, color: Colors.cyan[700]),
                  const SizedBox(width: 8),
                  Text(
                    'Bidding Rules',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Special rules for bidding on this auction',
                style: TextStyle(fontSize: 12, color: Colors.cyan[600]),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _biddingRulesController,
                maxLines: 3,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Bidding Rules',
                  hintText: 'e.g., No bidding wars, reserve not disclosed',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.rule),
                  helperText: 'Specify any special bidding conditions',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                onChanged: (value) => _updateAuctionData(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.account_balance, size: 20, color: Colors.green[700]),
                  const SizedBox(width: 8),
                  Text(
                    'Financing Options',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Available financing and payment plans',
                style: TextStyle(fontSize: 12, color: Colors.green[600]),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _financingOptionsController,
                maxLines: 3,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Financing Options',
                  hintText: 'e.g., 12-month payment plan available',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.account_balance),
                  helperText: 'Describe financing options if available',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                onChanged: (value) => _updateAuctionData(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _startPriceController.dispose();
    _reservePriceController.dispose();
    _tagsController.dispose();
    _returnPolicyController.dispose();
    // No need to dispose country/state/city controllers
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    _postalCodeController.dispose();
    _bidIncrementController.dispose();
    _buyerPremiumController.dispose();
    _commissionRateController.dispose();
    _timezoneController.dispose();
    _lotNumberController.dispose();
    _paymentTermsController.dispose();
    _conditionReportController.dispose();
    _biddingRulesController.dispose();
    _financingOptionsController.dispose();
    super.dispose();
  }
}