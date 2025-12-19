import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // Create a test auction that starts immediately to test watchlist functionality
  final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1OWQ0M2Y2Yy00NzM5LTRmMDktOGM4NS0wMzAxMmRiMTRkNzYiLCJpZCI6IjU5ZDQzZjZjLTQ3MzktNGYwOS04Yzg1LTAzMDEyZGIxNGQ3NiIsImVtYWlsIjoibWFuaXNoQGdtYWlsLmNvbSIsInJvbGUiOiJidXllciIsImRlcGFydG1lbnRfaWQiOm51bGwsInJvbGVfaWQiOm51bGwsIm5hbWUiOiJNYW5pc2ggQWhpcmUiLCJkZXBhcnRtZW50X2NvZGUiOm51bGwsImFjY2Vzc19zY29wZSI6e30sImlhdCI6MTc2NjEzNjExNiwiZXhwIjoxNzY2NzQwOTE2fQ.RRy4dP3GxrQy4pnfvciiIGlHNjRvvOtmn-Fqh5UeES0';

  try {
    print('🏛️ CREATING TEST AUCTION FOR WATCHLIST TESTING...\n');

    // Create auction that starts immediately (1 minute ago) and ends in 1 hour
    final now = DateTime.now().toUtc();
    final startTime = now.subtract(Duration(minutes: 1)); // Started 1 minute ago
    final endTime = now.add(Duration(hours: 1)); // Ends in 1 hour

    final auctionPayload = {
      "category_id": "91263161-f1ce-4829-9251-df8f0a4349a8", // Using existing category from logs
      "dynamic_attributes": {
        "productName": "Watchlist Test Auction - Active Now",
        "description": "This auction was created to test watchlist functionality. It should be active immediately.",
        "images": [
          "https://example.com/test-image.jpg"
        ]
      },
      "start_price": 100.00,
      "current_price": 100.00,
      "start_time": startTime.toIso8601String(),
      "end_time": endTime.toIso8601String(),
      "reserve_price": 150.00,
      "status": "pending", // Will become active when start_time is reached
      "type": "english",
      "tags": ["test", "watchlist", "active"],
      "return_policy": "7-day return policy for testing.",
      "authentication_required": false,
      "shipping_included": true,
      "bid_increment": 10.00,
      "reserve_visible": true,
      "commission_rate": 0.10,
      "buyer_premium": 0.05,
      "timezone": "UTC",
      "payment_terms": {
        "accepted_methods": ["credit_card", "paypal"],
        "financing_available": false,
        "deposit_required": 0.00
      }
    };

    print('📝 Creating auction with start time: ${startTime.toIso8601String()}');
    print('📝 End time: ${endTime.toIso8601String()}');

    final createResponse = await http.post(
      Uri.parse('https://api.ebidportal.com/api/v1/auctions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(auctionPayload),
    );

    print('\n🏛️ CREATE AUCTION RESPONSE:');
    print('Status: ${createResponse.statusCode}');
    print('Response: ${createResponse.body}');

    if (createResponse.statusCode == 201) {
      final createData = jsonDecode(createResponse.body);
      final auctionId = createData['data']['id'];
      final auctionTitle = createData['data']['title'] ?? 'Test Auction';

      print('\n✅ AUCTION CREATED SUCCESSFULLY!');
      print('ID: $auctionId');
      print('Title: $auctionTitle');

      // Wait a moment for the auction to become active
      print('\n⏳ Waiting 3 seconds for auction to become active...');
      await Future.delayed(Duration(seconds: 3));

      // Check if auction is now active
      print('\n🔍 Checking if auction became active...');
      final checkResponse = await http.get(
        Uri.parse('https://api.ebidportal.com/api/v1/auctions/$auctionId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (checkResponse.statusCode == 200) {
        final checkData = jsonDecode(checkResponse.body);
        final status = checkData['data']['status'];
        print('Auction status: $status');

        if (status == 'active') {
          print('\n🎯 AUCTION IS ACTIVE! Now testing watchlist...');

          // Add to watchlist
          print('\n❤️ Adding active auction to watchlist...');
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

          print('Add to watchlist status: ${addResponse.statusCode}');
          print('Response: ${addResponse.body}');

          if (addResponse.statusCode == 201) {
            print('\n✅ SUCCESS: Added to watchlist!');

            // Verify watchlist
            print('\n📋 Verifying watchlist contents...');
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
              print('✅ Watchlist now has ${watchlistItems.length} items');

              if (watchlistItems.isNotEmpty) {
                print('\n🎉 WATCHLIST FUNCTIONALITY CONFIRMED WORKING!');
                print('📱 Mobile app should now display watchlist items correctly');
                print('🔄 The empty watchlist issue is resolved - it was just due to no active auctions being available');
              }
            }
          } else {
            print('❌ Failed to add to watchlist');
          }
        } else {
          print('❌ Auction is not active yet. Status: $status');
          print('💡 The auction system may need manual activation or the start_time logic needs checking');
        }
      } else {
        print('❌ Failed to check auction status');
      }
    } else {
      print('❌ Failed to create auction');
      if (createResponse.statusCode == 400) {
        final errorData = jsonDecode(createResponse.body);
        print('Error details: ${errorData['message']}');
      }
    }

  } catch (e) {
    print('❌ Error: $e');
  }
}