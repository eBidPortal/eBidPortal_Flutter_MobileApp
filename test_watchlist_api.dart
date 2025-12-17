import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // Test watchlist API - first login to get token
  final loginUrl = 'https://api.ebidportal.com/auth/login';

  try {
    print('🔐 Testing login for watchlist...');
    final loginResponse = await http.post(
      Uri.parse(loginUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'emailOrMobile': 'admin@ebidportal.com',
        'password': 'admin123',
      }),
    );

    if (loginResponse.statusCode != 200) {
      print('❌ Login failed: ${loginResponse.statusCode}');
      return;
    }

    final loginData = jsonDecode(loginResponse.body);
    if (loginData['success'] != true) {
      print('❌ Login unsuccessful: ${loginData['message']}');
      return;
    }

    final token = loginData['data']['token'];
    print('✅ Login successful, got token');

    // Get auctions to find one to add to watchlist
    final auctionsUrl = 'https://api.ebidportal.com/api/v1/auctions?status=active&limit=5';
    print('\n🏛️ Getting active auctions...');

    final auctionsResponse = await http.get(
      Uri.parse(auctionsUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (auctionsResponse.statusCode != 200) {
      print('❌ Failed to get auctions: ${auctionsResponse.statusCode}');
      return;
    }

    final auctionsData = jsonDecode(auctionsResponse.body);
    if (auctionsData['success'] != true) {
      print('❌ Auctions request unsuccessful: ${auctionsData['message']}');
      return;
    }

    final auctions = auctionsData['data']['auctions'] as List?;
    if (auctions == null || auctions.isEmpty) {
      print('❌ No active auctions found');
      return;
    }

    final firstAuction = auctions[0] as Map<String, dynamic>;
    final auctionId = firstAuction['id'];
    print('✅ Found auction: $auctionId');

    // Add to watchlist
    print('❤️ Adding auction to watchlist...');
    final addWatchlistUrl = 'https://api.ebidportal.com/api/v1/watchlist';
    final addResponse = await http.post(
      Uri.parse(addWatchlistUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'auction_id': auctionId,
      }),
    );

    print('Add to watchlist response status: ${addResponse.statusCode}');
    print('Add to watchlist response: ${addResponse.body}');

    if (addResponse.statusCode == 201) {
      final addData = jsonDecode(addResponse.body);
      if (addData['success'] == true) {
        print('✅ Added to watchlist successfully!');
      } else {
        print('❌ Failed to add to watchlist: ${addData['message']}');
      }
    } else {
      print('❌ Add to watchlist API error: ${addResponse.statusCode}');
    }

    // Get watchlist
    print('\n📋 Getting watchlist...');
    final watchlistUrl = 'https://api.ebidportal.com/api/v1/watchlist';
    final watchlistResponse = await http.get(
      Uri.parse(watchlistUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('Watchlist response status: ${watchlistResponse.statusCode}');
    print('Watchlist response: ${watchlistResponse.body}');

    if (watchlistResponse.statusCode == 200) {
      final watchlistData = jsonDecode(watchlistResponse.body);
      if (watchlistData['success'] == true) {
        final watchlistItems = watchlistData['data']['watchlist'] as List?;
        print('✅ Watchlist retrieved successfully! Items: ${watchlistItems?.length ?? 0}');
        if (watchlistItems != null && watchlistItems.isNotEmpty) {
          print('📊 First watchlist item: ${watchlistItems[0]}');
        }
      } else {
        print('❌ Failed to get watchlist: ${watchlistData['message']}');
      }
    } else {
      print('❌ Watchlist API error: ${watchlistResponse.statusCode}');
    }

    // Remove from watchlist
    print('\n💔 Removing auction from watchlist...');
    final removeWatchlistUrl = 'https://api.ebidportal.com/api/v1/watchlist/$auctionId';
    final removeResponse = await http.delete(
      Uri.parse(removeWatchlistUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('Remove from watchlist response status: ${removeResponse.statusCode}');
    print('Remove from watchlist response: ${removeResponse.body}');

    if (removeResponse.statusCode == 200) {
      final removeData = jsonDecode(removeResponse.body);
      if (removeData['success'] == true) {
        print('✅ Removed from watchlist successfully!');
      } else {
        print('❌ Failed to remove from watchlist: ${removeData['message']}');
      }
    } else {
      print('❌ Remove from watchlist API error: ${removeResponse.statusCode}');
    }

  } catch (e) {
    print('❌ Error: $e');
  }
}