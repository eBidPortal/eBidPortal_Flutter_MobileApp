import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../domain/auction.dart';

class BiddingWidget extends StatefulWidget {
  final Auction auction;
  final bool isFullScreen;

  const BiddingWidget({
    super.key,
    required this.auction,
    this.isFullScreen = false,
  });

  @override
  State<BiddingWidget> createState() => _BiddingWidgetState();
}

class _BiddingWidgetState extends State<BiddingWidget> {
  final TextEditingController _bidController = TextEditingController();
  final FocusNode _bidFocusNode = FocusNode();
  double? _bidAmount;
  bool _isPlacingBid = false;

  @override
  void initState() {
    super.initState();
    _calculateMinimumBid();
  }

  @override
  void dispose() {
    _bidController.dispose();
    _bidFocusNode.dispose();
    super.dispose();
  }

  void _calculateMinimumBid() {
    // Minimum bid is current price + minimum increment (e.g., $1 or 5%)
    final minIncrement = widget.auction.currentPrice * 0.05; // 5% increment
    final minimumBid = widget.auction.currentPrice + (minIncrement < 1 ? 1 : minIncrement);
    _bidController.text = minimumBid.toStringAsFixed(2);
    _bidAmount = minimumBid;
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.auction.isActive) {
      return _buildInactiveAuctionMessage();
    }

    return Container(
      padding: EdgeInsets.all(widget.isFullScreen ? 24 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.isFullScreen) _buildHeader(),
          
          // Current Price Display
          _buildCurrentPriceCard(),
          
          const SizedBox(height: 20),
          
          // Bid Input
          _buildBidInput(),
          
          const SizedBox(height: 16),
          
          // Quick Bid Buttons
          _buildQuickBidButtons(),
          
          const SizedBox(height: 20),
          
          // Place Bid Button
          _buildPlaceBidButton(),
          
          if (widget.isFullScreen) ...[
            const SizedBox(height: 20),
            _buildBidHistory(),
          ],
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Place Your Bid',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          widget.auction.productName,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.grey[600],
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const Divider(height: 32),
      ],
    );
  }

  Widget _buildCurrentPriceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Highest Bid',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '\$${widget.auction.currentPrice.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Total Bids',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${widget.auction.bidCount}',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBidInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Bid Amount',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _bidController,
          focusNode: _bidFocusNode,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
          ],
          onChanged: (value) {
            setState(() {
              _bidAmount = double.tryParse(value);
            });
          },
          decoration: InputDecoration(
            prefixText: '\$',
            prefixStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            hintText: 'Enter bid amount',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: Theme.of(context).cardColor,
            errorText: _getValidationError(),
          ),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickBidButtons() {
    final currentPrice = widget.auction.currentPrice;
    final quickBids = [
      currentPrice + 1,
      currentPrice + 5,
      currentPrice + 10,
      currentPrice + 25,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Bid',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: quickBids.map((amount) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: OutlinedButton(
                  onPressed: () {
                    _bidController.text = amount.toStringAsFixed(2);
                    setState(() {
                      _bidAmount = amount;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    '+\$${(amount - currentPrice).toStringAsFixed(0)}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPlaceBidButton() {
    final isValidBid = _isValidBid();
    
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isValidBid && !_isPlacingBid ? _placeBid : null,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: _isPlacingBid
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                'Place Bid - \$${_bidAmount?.toStringAsFixed(2) ?? '0.00'}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  Widget _buildBidHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Bids',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.builder(
            itemCount: 5, // Mock data
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text(
                    'B${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text('Bidder ${index + 1}'),
                trailing: Text(
                  '\$${(widget.auction.currentPrice - (index * 5)).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('${index + 1} minute${index == 0 ? '' : 's'} ago'),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildInactiveAuctionMessage() {
    String message;
    IconData icon;
    Color color;

    switch (widget.auction.status) {
      case AuctionStatus.pending:
        message = 'Auction hasn\'t started yet';
        icon = Icons.schedule;
        color = Colors.orange;
        break;
      case AuctionStatus.ended:
        message = 'Auction has ended';
        icon = Icons.done;
        color = Colors.grey;
        break;
      case AuctionStatus.cancelled:
        message = 'Auction was cancelled';
        icon = Icons.cancel;
        color = Colors.red;
        break;
      default:
        message = 'Bidding not available';
        icon = Icons.info;
        color = Colors.grey;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: color),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          if (widget.auction.status == AuctionStatus.pending) ...[
            const SizedBox(height: 8),
            Text(
              'Starts ${_formatDateTime(widget.auction.startTime)}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  String? _getValidationError() {
    if (_bidAmount == null) return null;
    
    final minBid = widget.auction.currentPrice + 1;
    if (_bidAmount! <= widget.auction.currentPrice) {
      return 'Bid must be higher than current price';
    }
    if (_bidAmount! < minBid) {
      return 'Minimum bid is \$${minBid.toStringAsFixed(2)}';
    }
    
    return null;
  }

  bool _isValidBid() {
    if (_bidAmount == null) return false;
    return _bidAmount! > widget.auction.currentPrice && _getValidationError() == null;
  }

  Future<void> _placeBid() async {
    if (!_isValidBid()) return;

    setState(() {
      _isPlacingBid = true;
    });

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Bid placed successfully for \$${_bidAmount!.toStringAsFixed(2)}',
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to place bid: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isPlacingBid = false;
        });
      }
    }
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = dateTime.difference(now);
    
    if (difference.inDays > 0) {
      return 'in ${difference.inDays} day${difference.inDays == 1 ? '' : 's'}';
    } else if (difference.inHours > 0) {
      return 'in ${difference.inHours} hour${difference.inHours == 1 ? '' : 's'}';
    } else if (difference.inMinutes > 0) {
      return 'in ${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'}';
    } else {
      return 'very soon';
    }
  }
}