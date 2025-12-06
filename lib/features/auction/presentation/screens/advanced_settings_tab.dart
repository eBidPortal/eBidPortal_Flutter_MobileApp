import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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
  
  // Date/Time variables
  DateTime? _startTime;
  DateTime? _endTime;
  
  // Auction type
  String _auctionType = 'english';

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
    
    // Update provider
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
    );
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

  @override
  void dispose() {
    _startPriceController.dispose();
    _reservePriceController.dispose();
    _tagsController.dispose();
    _returnPolicyController.dispose();
    super.dispose();
  }
}