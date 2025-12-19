import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // Use the exact same JWT token from the user's logs to test the watchlist API
  final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1OWQ0M2Y2Yy00NzM5LTRmMDktOGM4NS0wMzAxMmRiMTRkNzYiLCJpZCI6IjU5ZDQzZjZjLTQ3MzktNGYwOS04Yzg1LTAzMDEyZGIxNGQ3NiIsImVtYWlsIjoibWFuaXNoQGdtYWlsLmNvbSIsInJvbGUiOiJidXllciIsImRlcGFydG1lbnRfaWQiOm51bGwsInJvbGVfaWQiOm51bGwsIm5hbWUiOiJNYW5pc2ggQWhpcmUiLCJkZXBhcnRtZW50X2NvZGUiOm51bGwsImFjY2Vzc19zY29wZSI6e30sImlhdCI6MTc2NjEyOTMwNywiZXhwIjoxNzY2NzM0MTA3fQ.TQ_ecVOpKlCO6zIVgfYCNqQOBYRThOcVJs1bjEVzSMY';

  try {
    // Direct watchlist API call using the same parameters from user logs
    print('📋 Testing watchlist API with exact same params from user logs...');
    final watchlistUrl = 'https://api.ebidportal.com/api/v1/watchlist?page=1&limit=20';
    
    print('Making request to: $watchlistUrl');
    print('Using token from user logs (first 50 chars): ${token.substring(0, 50)}...');
    
    final watchlistResponse = await http.get(
      Uri.parse(watchlistUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('\n📊 RESPONSE DETAILS:');
    print('Status Code: ${watchlistResponse.statusCode}');
    print('Response Body: ${watchlistResponse.body}');

    if (watchlistResponse.statusCode == 500) {
      try {
        final errorData = jsonDecode(watchlistResponse.body);
        print('\n🚨 500 ERROR ANALYSIS:');
        print('Success: ${errorData['success']}');
        print('Message: ${errorData['message']}');
        print('Errors: ${errorData['errors']}');
        
        if (errorData['message'].toString().contains('image_url')) {
          print('\n🔥 CONFIRMED ISSUE: Backend is querying non-existent auction.image_url column');
          print('📋 BACKEND TEAM ACTION NEEDED:');
          print('   1. Update watchlist queries to use dynamic_attributes.images[0] instead of auction.image_url');
          print('   2. Add transformAuctionForWatchlist() function as mentioned in API docs');
          print('   3. Deploy the fix that was supposedly done in v3.2.4');
        }
      } catch (parseError) {
        print('Could not parse error response as JSON: $parseError');
      }
    } else if (watchlistResponse.statusCode == 200) {
      print('✅ Watchlist API working correctly!');
      try {
        final responseData = jsonDecode(watchlistResponse.body);
        print('Response: $responseData');
      } catch (e) {
        print('Could not parse success response: $e');
      }
    } else {
      print('❌ Unexpected status code: ${watchlistResponse.statusCode}');
    }

  } catch (e) {
    print('❌ Network/Runtime Error: $e');
  }
}