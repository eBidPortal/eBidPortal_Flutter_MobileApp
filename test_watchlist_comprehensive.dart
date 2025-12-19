import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // Comprehensive test to identify the watchlist bug
  final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1OWQ0M2Y2Yy00NzM5LTRmMDktOGM4NS0wMzAxMmRiMTRkNzYiLCJpZCI6IjU5ZDQzZjZjLTQ3MzktNGYwOS04Yzg1LTAzMDEyZGIxNGQ3NiIsImVtYWlsIjoibWFuaXNoQGdtYWlsLmNvbSIsInJvbGUiOiJidXllciIsImRlcGFydG1lbnRfaWQiOm51bGwsInJvbGVfaWQiOm51bGwsIm5hbWUiOiJNYW5pc2ggQWhpcmUiLCJkZXBhcnRtZW50X2NvZGUiOm51bGwsImFjY2Vzc19zY29wZSI6e30sImlhdCI6MTc2NjEzNjExNiwiZXhwIjoxNzY2NzQwOTE2fQ.RRy4dP3GxrQy4pnfvciiIGlHNjRvvOtmn-Fqh5UeES0';

  // Extract user ID from JWT
  final tokenParts = token.split('.');
  final payload = jsonDecode(utf8.decode(base64Url.decode(base64Url.normalize(tokenParts[1]))));
  final userId = payload['userId'];

  try {
    print('🔍 COMPREHENSIVE WATCHLIST BUG INVESTIGATION...\n');
    print('👤 User ID: $userId\n');

    // Get all auctions
    print('📋 Getting all auctions...');
    final auctionsResponse = await http.get(
      Uri.parse('https://api.ebidportal.com/api/v1/auctions?page=1&limit=50'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (auctionsResponse.statusCode != 200) {
      print('❌ Failed to get auctions');
      return;
    }

    final auctionsData = jsonDecode(auctionsResponse.body);
    final auctions = auctionsData['data']['auctions'] as List;

    print('📊 TOTAL AUCTIONS FOUND: ${auctions.length}\n');

    // Categorize auctions
    final userOwnedAuctions = <Map<String, dynamic>>[];
    final otherActiveAuctions = <Map<String, dynamic>>[];
    final otherEndedAuctions = <Map<String, dynamic>>[];

    for (var auction in auctions) {
      final sellerId = auction['seller_id'];
      final status = auction['status'];
      final title = auction['title'] ?? 'No title';
      final id = auction['id'];

      if (sellerId == userId) {
        userOwnedAuctions.add(auction);
        print('🏠 USER OWNS: $id - $title (Status: $status)');
      } else if (status == 'active') {
        otherActiveAuctions.add(auction);
        print('✅ OTHER ACTIVE: $id - $title');
      } else if (status == 'ended') {
        otherEndedAuctions.add(auction);
        print('❌ OTHER ENDED: $id - $title');
      }
    }

    print('\n📈 SUMMARY:');
    print('🏠 User owns: ${userOwnedAuctions.length} auctions');
    print('✅ Other active: ${otherActiveAuctions.length} auctions');
    print('❌ Other ended: ${otherEndedAuctions.length} auctions');

    // Test adding different types of auctions to watchlist
    print('\n🧪 TESTING WATCHLIST ADDITION...\n');

    // Test 1: Try to add user's own auction (should fail)
    if (userOwnedAuctions.isNotEmpty) {
      final ownAuction = userOwnedAuctions[0];
      final auctionId = ownAuction['id'];
      final title = ownAuction['title'] ?? 'No title';

      print('🧪 TEST 1: Adding USER\'S OWN auction to watchlist...');
      print('Auction: $auctionId - $title');

      final addResponse = await http.post(
        Uri.parse('https://api.ebidportal.com/api/v1/watchlist'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'auction_id': auctionId,
        }),
      );

      print('Status: ${addResponse.statusCode}');
      print('Response: ${addResponse.body}');

      if (addResponse.statusCode == 400) {
        final errorData = jsonDecode(addResponse.body);
        if (errorData['message'].contains('your own auction')) {
          print('✅ CORRECT: Cannot add own auction to watchlist');
        }
      }
      print('---\n');
    }

    // Test 2: Try to add other person's ended auction (should fail)
    if (otherEndedAuctions.isNotEmpty) {
      final endedAuction = otherEndedAuctions[0];
      final auctionId = endedAuction['id'];
      final title = endedAuction['title'] ?? 'No title';

      print('🧪 TEST 2: Adding OTHER PERSON\'S ENDED auction to watchlist...');
      print('Auction: $auctionId - $title');

      final addResponse = await http.post(
        Uri.parse('https://api.ebidportal.com/api/v1/watchlist'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'auction_id': auctionId,
        }),
      );

      print('Status: ${addResponse.statusCode}');
      print('Response: ${addResponse.body}');

      if (addResponse.statusCode == 400) {
        final errorData = jsonDecode(addResponse.body);
        if (errorData['message'].contains('ended auction')) {
          print('✅ CORRECT: Cannot add ended auction to watchlist');
        }
      }
      print('---\n');
    }

    // Test 3: Try to add other person's active auction (should succeed)
    if (otherActiveAuctions.isNotEmpty) {
      final activeAuction = otherActiveAuctions[0];
      final auctionId = activeAuction['id'];
      final title = activeAuction['title'] ?? 'No title';

      print('🧪 TEST 3: Adding OTHER PERSON\'S ACTIVE auction to watchlist...');
      print('Auction: $auctionId - $title');

      final addResponse = await http.post(
        Uri.parse('https://api.ebidportal.com/api/v1/watchlist'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'auction_id': auctionId,
        }),
      );

      print('Status: ${addResponse.statusCode}');
      print('Response: ${addResponse.body}');

      if (addResponse.statusCode == 201) {
        print('✅ SUCCESS: Added active auction to watchlist!');

        // Verify it's in watchlist
        final watchlistResponse = await http.get(
          Uri.parse('https://api.ebidportal.com/api/v1/watchlist?page=1&limit=20'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );

        if (watchlistResponse.statusCode == 200) {
          final watchlistData = jsonDecode(watchlistResponse.body);
          final watchlistItems = watchlistData['data']['watchlist'] as List;
          print('📋 Watchlist now has ${watchlistItems.length} items');
        }

        // Clean up - remove from watchlist
        final removeResponse = await http.delete(
          Uri.parse('https://api.ebidportal.com/api/v1/watchlist/$auctionId'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );

        if (removeResponse.statusCode == 200) {
          print('🧹 Cleaned up: Removed from watchlist');
        }
      } else {
        print('❌ FAILED: Could not add active auction to watchlist');
        print('🚨 This indicates a backend bug!');
      }
      print('---\n');
    }

    // Final analysis
    print('🎯 FINAL ANALYSIS:');
    if (otherActiveAuctions.isEmpty) {
      print('⚠️ NO ACTIVE AUCTIONS FROM OTHER USERS - This explains empty watchlist');
      print('💡 The watchlist appears empty because there are no active auctions to add');
      print('📱 MOBILE APP BEHAVIOR IS CORRECT - watchlist should be empty');
    } else {
      print('✅ There are active auctions available to add to watchlist');
      print('📱 If mobile app shows "Cannot add your own auction" error, check which auction ID is being sent');
    }

  } catch (e) {
    print('❌ Error: $e');
  }
}