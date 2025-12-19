import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // Test direct watchlist API call to reproduce the 500 error
  final loginUrl = 'https://api.ebidportal.com/auth/login';

  try {
    print('🔐 Testing login for watchlist...');
    final loginResponse = await http.post(
      Uri.parse(loginUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'emailOrMobile': 'manish@gmail.com', // Using the same user as in the logs
        'password': 'Manish@16', // assuming default password
      }),
    );

    if (loginResponse.statusCode != 200) {
      print('❌ Login failed: ${loginResponse.statusCode}');
      print('Response: ${loginResponse.body}');
      return;
    }

    final loginData = jsonDecode(loginResponse.body);
    if (loginData['success'] != true) {
      print('❌ Login unsuccessful: ${loginData['message']}');
      return;
    }

    final token = loginData['data']['token'];
    print('✅ Login successful, got token');

    // Direct watchlist API call to reproduce the issue
    print('\n📋 Testing watchlist API directly...');
    final watchlistUrl = 'https://api.ebidportal.com/api/v1/watchlist?page=1&limit=20';
    
    print('Making request to: $watchlistUrl');
    final watchlistResponse = await http.get(
      Uri.parse(watchlistUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
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
      } else {
        print('❌ Failed to get watchlist: ${watchlistData['message']}');
      }
    } else {
      print('❌ Watchlist API error: ${watchlistResponse.statusCode}');
      if (watchlistResponse.statusCode == 500) {
        final errorData = jsonDecode(watchlistResponse.body);
        print('🔥 SERVER ERROR: ${errorData['message']}');
        if (errorData['message'].contains('image_url')) {
          print('🚨 CONFIRMED: The backend is still trying to query auction.image_url which does not exist!');
          print('📋 BACKEND TEAM NEEDS TO: Update watchlist queries to use dynamic_attributes.images instead');
        }
      }
    }

  } catch (e) {
    print('❌ Error: $e');
  }
}