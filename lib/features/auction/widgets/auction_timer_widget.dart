import 'package:flutter/material.dart';
import 'dart:async';
import '../domain/auction.dart';

class AuctionTimerWidget extends StatefulWidget {
  final Auction auction;
  final bool compact;

  const AuctionTimerWidget({
    super.key,
    required this.auction,
    this.compact = false,
  });

  @override
  State<AuctionTimerWidget> createState() => _AuctionTimerWidgetState();
}

class _AuctionTimerWidgetState extends State<AuctionTimerWidget> {
  Timer? _timer;
  Duration _remainingTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _calculateRemainingTime();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _calculateRemainingTime() {
    final now = DateTime.now();
    
    if (widget.auction.isPending) {
      _remainingTime = widget.auction.startTime.difference(now);
    } else if (widget.auction.isActive) {
      _remainingTime = widget.auction.endTime.difference(now);
    } else {
      _remainingTime = Duration.zero;
    }
    
    if (_remainingTime.isNegative) {
      _remainingTime = Duration.zero;
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _calculateRemainingTime();
      });
      
      if (_remainingTime == Duration.zero) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.auction.isEnded || widget.auction.isCancelled) {
      return _buildEndedStatus();
    }

    if (widget.compact) {
      return _buildCompactTimer();
    }

    return _buildFullTimer();
  }

  Widget _buildFullTimer() {
    final isEndingSoon = _remainingTime.inHours < 1 && widget.auction.isActive;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isEndingSoon 
              ? [Colors.red[100]!, Colors.red[50]!]
              : widget.auction.isPending
                  ? [Colors.orange[100]!, Colors.orange[50]!]
                  : [Colors.green[100]!, Colors.green[50]!],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isEndingSoon 
              ? Colors.red[300]!
              : widget.auction.isPending
                  ? Colors.orange[300]!
                  : Colors.green[300]!,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _getTimerIcon(),
                color: _getTimerColor(),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                _getTimerLabel(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: _getTimerColor(),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (_remainingTime > Duration.zero) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTimeUnit('Days', _remainingTime.inDays),
                _buildTimeUnit('Hours', _remainingTime.inHours % 24),
                _buildTimeUnit('Minutes', _remainingTime.inMinutes % 60),
                _buildTimeUnit('Seconds', _remainingTime.inSeconds % 60),
              ],
            ),
          ] else ...[
            Text(
              widget.auction.isPending ? 'Starting now...' : 'Auction ended',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: _getTimerColor(),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCompactTimer() {
    if (_remainingTime == Duration.zero) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          widget.auction.isPending ? 'Starting' : 'Ended',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getTimerColor(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.timer,
            color: Colors.white,
            size: 12,
          ),
          const SizedBox(width: 4),
          Text(
            _formatCompactTime(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeUnit(String label, int value) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Text(
            value.toString().padLeft(2, '0'),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: _getTimerColor(),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: _getTimerColor(),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildEndedStatus() {
    IconData icon;
    String message;
    Color color;

    switch (widget.auction.status) {
      case AuctionStatus.ended:
        icon = Icons.done;
        message = 'Auction Ended';
        color = Colors.grey;
        break;
      case AuctionStatus.cancelled:
        icon = Icons.cancel;
        message = 'Auction Cancelled';
        color = Colors.red;
        break;
      default:
        icon = Icons.info;
        message = 'Auction Inactive';
        color = Colors.grey;
        break;
    }

    return Container(
      padding: EdgeInsets.all(widget.compact ? 8 : 16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(widget.compact ? 8 : 12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: widget.compact ? 16 : 20),
          const SizedBox(width: 8),
          Text(
            message,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: widget.compact ? 12 : null,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getTimerIcon() {
    if (widget.auction.isPending) {
      return Icons.schedule;
    } else if (_remainingTime.inHours < 1) {
      return Icons.warning;
    } else {
      return Icons.timer;
    }
  }

  Color _getTimerColor() {
    if (widget.auction.isPending) {
      return Colors.orange[700]!;
    } else if (_remainingTime.inHours < 1) {
      return Colors.red[700]!;
    } else {
      return Colors.green[700]!;
    }
  }

  String _getTimerLabel() {
    if (widget.auction.isPending) {
      return 'Auction Starts In';
    } else if (_remainingTime.inHours < 1 && widget.auction.isActive) {
      return 'Ending Soon!';
    } else {
      return 'Time Remaining';
    }
  }

  String _formatCompactTime() {
    if (_remainingTime.inDays > 0) {
      return '${_remainingTime.inDays}d ${_remainingTime.inHours % 24}h';
    } else if (_remainingTime.inHours > 0) {
      return '${_remainingTime.inHours}h ${_remainingTime.inMinutes % 60}m';
    } else if (_remainingTime.inMinutes > 0) {
      return '${_remainingTime.inMinutes}m';
    } else {
      return '${_remainingTime.inSeconds}s';
    }
  }
}