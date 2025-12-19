import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // Test the specific auction that's failing in the app
  final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1OWQ0M2Y2Yy00NzM5LTRmMDktOGM4NS0wMzAxMmRiMTRkNzYiLCJpZCI6IjU5ZDQzZjZjLTQ3MzktNGYwOS04Yzg1LTAzMDEyZGIxNGQ3NiIsImVtYWlsIjoibWFuaXNoQGdtYWlsLmNvbSIsInJvbGUiOiJidXllciIsImRlcGFydG1lbnRfaWQiOm51bGwsInJvbGVfaWQiOm51bGwsIm5hbWUiOiJNYW5pc2ggQWhpcmUiLCJkZXBhcnRtZW50X2NvZGUiOm51bGwsImFjY2Vzc19zY29wZSI6e30sImlhdCI6MTc2NjEzNjExNiwiZXhwIjoxNzY2NzQwOTE2fQ.RRy4dP3GxrQy4pnfvciiIGlHNjRvvOtmn-Fqh5UeES0';

  final auctionId = '82cc2d12-1643-4546-9580-4c8fdd5ba7c0'; // The auction from the app logs

  try {
    print('🔍 INVESTIGATING WATCHLIST ERROR...\n');

    // Extract user ID from JWT token
    final tokenParts = token.split('.');
    if (tokenParts.length >= 2) {
      final payload = jsonDecode(utf8.decode(base64Url.decode(base64Url.normalize(tokenParts[1]))));
      final userId = payload['userId'];
      print('👤 User ID from token: $userId');
    }

    // Get auction details
    print('\n🏛️ Getting auction details for ID: $auctionId');
    final auctionResponse = await http.get(
      Uri.parse('https://api.ebidportal.com/api/v1/auctions/$auctionId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('Auction details status: ${auctionResponse.statusCode}');
    if (auctionResponse.statusCode == 200) {
      final auctionData = jsonDecode(auctionResponse.body);
      final auction = auctionData['data'];
      final sellerId = auction['seller_id'];
      final status = auction['status'];
      final title = auction['title'] ?? 'No title';

      print('📊 Auction Details:');
      print('- Title: $title');
      print('- Seller ID: $sellerId');
      print('- Status: $status');
      print('- User Role: buyer (from token)');

      // Check if this is really the user's own auction
      final userIdFromToken = '59d43f6c-4739-4f09-8c85-03012db14d76'; // From JWT payload
      final isOwnAuction = sellerId == userIdFromToken;

      print('\n🔍 OWNERSHIP ANALYSIS:');
      print('- Auction Seller ID: $sellerId');
      print('- User ID from token: $userIdFromToken');
      print('- Is own auction: $isOwnAuction');

      if (!isOwnAuction) {
        print('\n❌ BUG DETECTED: API incorrectly thinks this is user\'s own auction!');
        print('💡 This auction belongs to seller $sellerId, not user $userIdFromToken');
        print('🔧 BACKEND BUG: The watchlist validation logic has an error');

        // Try to add to watchlist anyway to confirm the error
        print('\n❤️ Attempting to add to watchlist (expecting error)...');
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

        if (addResponse.statusCode == 400) {
          final errorData = jsonDecode(addResponse.body);
          if (errorData['message'].contains('your own auction')) {
            print('\n🚨 CONFIRMED BUG: Backend incorrectly identifies this as user\'s own auction');
            print('📋 ACTION NEEDED: Fix the ownership validation logic in watchlist endpoint');
          }
        }
      } else {
        print('\n✅ CORRECT BEHAVIOR: This is actually the user\'s own auction');
        print('💡 Cannot add own auctions to watchlist - this is correct business logic');
      }
    } else {
      print('❌ Failed to get auction details');
    }

  } catch (e) {
    print('❌ Error: $e');
  }
}