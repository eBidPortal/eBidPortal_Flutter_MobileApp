import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../storage/storage_service.dart';

class WebSocketService {
  io.Socket? _socket;
  final StorageService _storage;

  WebSocketService(this._storage);

  Future<void> connect() async {
    if (_socket != null && _socket!.connected) return;

    final token = await _storage.getToken();
    if (token == null) return;

    _socket = io.io('wss://api.ebidportal.com', {
      'transports': ['websocket'],
      'auth': {'token': token},
      'autoConnect': true,
    });

    _socket!.onConnect((_) {
      print('WebSocket connected');
    });

    _socket!.onDisconnect((_) {
      print('WebSocket disconnected');
    });

    _socket!.onError((error) {
      print('WebSocket error: $error');
    });

    _socket!.connect();
  }

  void disconnect() {
    _socket?.disconnect();
    _socket = null;
  }

  void joinAuction(String auctionId, String userId) {
    if (_socket?.connected ?? false) {
      _socket!.emit('join_auction', {
        'auction_id': auctionId,
        'user_id': userId,
      });
    }
  }

  void leaveAuction(String auctionId) {
    if (_socket?.connected ?? false) {
      _socket!.emit('leave_auction', {'auction_id': auctionId});
    }
  }

  void placeBid(String auctionId, double amount, {double? maxBid}) {
    if (_socket?.connected ?? false) {
      _socket!.emit('place_bid', {
        'auction_id': auctionId,
        'amount': amount,
        if (maxBid != null) 'max_bid': maxBid,
      });
    }
  }

  void onBidUpdate(Function(dynamic data) callback) {
    _socket?.on('bid_update', callback);
  }

  void onAuctionStatusChange(Function(dynamic data) callback) {
    _socket?.on('auction_status_change', callback);
  }

  void onOutbidNotification(Function(dynamic data) callback) {
    _socket?.on('outbid_notification', callback);
  }

  void onWinningNotification(Function(dynamic data) callback) {
    _socket?.on('winning_notification', callback);
  }

  void onAuctionEndingSoon(Function(dynamic data) callback) {
    _socket?.on('auction_ending_soon', callback);
  }

  void onAuctionExtended(Function(dynamic data) callback) {
    _socket?.on('auction_extended', callback);
  }

  void onAuctionEnded(Function(dynamic data) callback) {
    _socket?.on('auction_ended', callback);
  }

  void offBidUpdate() {
    _socket?.off('bid_update');
  }

  void offAuctionStatusChange() {
    _socket?.off('auction_status_change');
  }

  void offOutbidNotification() {
    _socket?.off('outbid_notification');
  }

  void offWinningNotification() {
    _socket?.off('winning_notification');
  }

  void offAuctionEndingSoon() {
    _socket?.off('auction_ending_soon');
  }

  void offAuctionExtended() {
    _socket?.off('auction_extended');
  }

  void offAuctionEnded() {
    _socket?.off('auction_ended');
  }

  bool get isConnected => _socket?.connected ?? false;
}

// Provider for WebSocket service
final webSocketServiceProvider = Provider<WebSocketService>((ref) {
  final storage = ref.watch(storageServiceProvider);
  return WebSocketService(storage);
});