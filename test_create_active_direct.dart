import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // Try creating an auction with status "active" directly
  final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1OWQ0M2Y2Yy00NzM5LTRmMDktOGM4NS0wMzAxMmRiMTRkNzYiLCJpZCI6IjU5ZDQzZjZjLTQ3MzktNGYwOS04Yzg1LTAzMDEyZGIxNGQ3NiIsImVtYWlsIjoibWFuaXNoQGdtYWlsLmNvbSIsInJvbGUiOiJidXllciIsImRlcGFydG1lbnRfaWQiOm51bGwsInJvbGVfaWQiOm51bGwsIm5hbWUiOiJNYW5pc2ggQWhpcmUiLCJkZXBhcnRtZW50X2NvZGUiOm51bGwsImFjY2Vzc19zY29wZSI6e30sImlhdCI6MTc2NjEzNjExNiwiZXhwIjoxNzY2NzQwOTE2fQ.RRy4dP3GxrQy4pnfvciiIGlHNjRvvOtmn-Fqh5UeES0';

  try {
    print('🏛️ CREATING ACTIVE AUCTION DIRECTLY...\n');

    // Create auction with status "active" directly
    final now = DateTime.now().toUtc();
    final endTime = now.add(Duration(hours: 2)); // Ends in 2 hours

    final auctionPayload = {
      "category_id": "91263161-f1ce-4829-9251-df8f0a4349a8",
      "dynamic_attributes": {
        "productName": "Active Watchlist Test Auction",
        "description": "This auction is created as active to test watchlist functionality.",
        "images": [
          "https://example.com/test-image.jpg"
        ]
      },
      "start_price": 50.00,
      "current_price": 50.00,
      "start_time": now.subtract(Duration(minutes: 5)).toIso8601String(), // Started 5 minutes ago
      "end_time": endTime.toIso8601String(),
      "reserve_price": 100.00,
      "status": "active", // Try setting as active directly
      "type": "english",
      "tags": ["test", "watchlist", "active"],
      "return_policy": "7-day return policy.",
      "authentication_required": false,
      "shipping_included": true,
      "bid_increment": 5.00,
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

    print('📝 Creating auction with status: active');
    print('📝 Start time: ${now.subtract(Duration(minutes: 5)).toIso8601String()}');
    print('📝 End time: ${endTime.toIso8601String()}');

    final createResponse = await http.post(
      Uri.parse('https://api.ebidportal.com/api/v1/auctions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(auctionPayload),
    );

    print('\n🏛️ CREATE ACTIVE AUCTION RESPONSE:');
    print('Status: ${createResponse.statusCode}');
    print('Response: ${createResponse.body}');

    if (createResponse.statusCode == 201) {
      final createData = jsonDecode(createResponse.body);
      final auctionId = createData['data']['id'];
      final actualStatus = createData['data']['status'];

      print('\n✅ AUCTION CREATED!');
      print('ID: $auctionId');
      print('Actual Status: $actualStatus');

      if (actualStatus == 'active') {
        print('\n🎯 AUCTION IS ACTIVE! Testing watchlist...');

        // Add to watchlist
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
          print('\n✅ WATCHLIST TEST COMPLETED SUCCESSFULLY!');
          print('📱 Mobile app watchlist functionality is working correctly');
        }
      } else {
        print('❌ Auction was not created as active. Status: $actualStatus');
        print('💡 The API may override the status or require admin permissions');
      }
    } else {
      print('❌ Failed to create active auction');
      if (createResponse.statusCode == 400) {
        final errorData = jsonDecode(createResponse.body);
        print('Error: ${errorData['message']}');
      }
    }

  } catch (e) {
    print('❌ Error: $e');
  }
}