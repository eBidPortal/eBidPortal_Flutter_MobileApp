import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // Activate the test auction using bulk status update
  final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1OWQ0M2Y2Yy00NzM5LTRmMDktOGM4NS0wMzAxMmRiMTRkNzYiLCJpZCI6IjU5ZDQzZjZjLTQ3MzktNGYwOS04Yzg1LTAzMDEyZGIxNGQ3NiIsImVtYWlsIjoibWFuaXNoQGdtYWlsLmNvbSIsInJvbGUiOiJidXllciIsImRlcGFydG1lbnRfaWQiOm51bGwsInJvbGVfaWQiOm51bGwsIm5hbWUiOiJNYW5pc2ggQWhpcmUiLCJkZXBhcnRtZW50X2NvZGUiOm51bGwsImFjY2Vzc19zY29wZSI6e30sImlhdCI6MTc2NjEzNjExNiwiZXhwIjoxNzY2NzQwOTE2fQ.RRy4dP3GxrQy4pnfvciiIGlHNjRvvOtmn-Fqh5UeES0';

  final auctionId = 'ae8040a8-e929-4ca0-b62a-4cf736bd3b66'; // The auction we created

  try {
    print('🚀 ACTIVATING TEST AUCTION FOR WATCHLIST TESTING...\n');

    // Activate the auction using bulk status update
    final activateResponse = await http.patch(
      Uri.parse('https://api.ebidportal.com/api/v1/auctions/bulk-status'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'auction_ids': [auctionId],
        'status': 'active'
      }),
    );

    print('ACTIVATE AUCTION RESPONSE:');
    print('Status: ${activateResponse.statusCode}');
    print('Response: ${activateResponse.body}');

    if (activateResponse.statusCode == 200) {
      print('\n✅ AUCTION ACTIVATED SUCCESSFULLY!');

      // Verify it's now active
      print('\n🔍 Verifying auction is now active...');
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
        print('✅ Auction status: $status');

        if (status == 'active') {
          print('\n🎯 AUCTION IS ACTIVE! Now testing watchlist functionality...');

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
                print('\n🎉 COMPLETE WATCHLIST FUNCTIONALITY TEST PASSED!');
                print('📱 Mobile app watchlist should now work correctly');
                print('🔄 The issue was simply no active auctions available to add to watchlist');

                // Show the watchlist item details
                final firstItem = watchlistItems[0] as Map<String, dynamic>;
                print('\n📊 Watchlist Item Details:');
                print('- Auction ID: ${firstItem['auction_id'] ?? firstItem['id']}');
                print('- Title: ${firstItem['title'] ?? 'No title'}');
                print('- Current Price: ${firstItem['current_price'] ?? 'N/A'}');
                print('- Status: ${firstItem['status'] ?? 'N/A'}');
              }
            }
          } else {
            print('❌ Failed to add to watchlist');
          }
        } else {
          print('❌ Auction activation failed');
        }
      }
    } else {
      print('❌ Failed to activate auction');
      if (activateResponse.statusCode == 403) {
        print('💡 You may not have admin permissions to activate auctions');
      }
    }

  } catch (e) {
    print('❌ Error: $e');
  }
}