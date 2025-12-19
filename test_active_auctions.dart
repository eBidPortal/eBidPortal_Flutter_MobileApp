import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // Test finding active auctions and adding them to watchlist
  final token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1OWQ0M2Y2Yy00NzM5LTRmMDktOGM4NS0wMzAxMmRiMTRkNzYiLCJpZCI6IjU5ZDQzZjZjLTQ3MzktNGYwOS04Yzg1LTAzMDEyZGIxNGQ3NiIsImVtYWlsIjoibWFuaXNoQGdtYWlsLmNvbSIsInJvbGUiOiJidXllciIsImRlcGFydG1lbnRfaWQiOm51bGwsInJvbGVfaWQiOm51bGwsIm5hbWUiOiJNYW5pc2ggQWhpcmUiLCJkZXBhcnRtZW50X2NvZGUiOm51bGwsImFjY2Vzc19zY29wZSI6e30sImlhdCI6MTc2NjEzNjExNiwiZXhwIjoxNzY2NzQwOTE2fQ.RRy4dP3GxrQy4pnfvciiIGlHNjRvvOtmn-Fqh5UeES0';

  try {
    print('🔍 CHECKING AVAILABLE AUCTIONS...\n');

    // Get all auctions to see their status
    print('📋 Getting all auctions...');
    final auctionsResponse = await http.get(
      Uri.parse('https://api.ebidportal.com/api/v1/auctions?page=1&limit=50'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('Auctions response status: ${auctionsResponse.statusCode}');
    if (auctionsResponse.statusCode == 200) {
      final auctionsData = jsonDecode(auctionsResponse.body);
      final auctions = auctionsData['data']['auctions'] as List;

      print('\n📊 AUCTION STATUS SUMMARY:');
      int activeCount = 0;
      int pendingCount = 0;
      int endedCount = 0;

      for (var auction in auctions) {
        final status = auction['status'];
        if (status == 'active') activeCount++;
        else if (status == 'pending') pendingCount++;
        else if (status == 'ended') endedCount++;
      }

      print('✅ Active auctions: $activeCount');
      print('⏳ Pending auctions: $pendingCount');
      print('❌ Ended auctions: $endedCount');
      print('📊 Total auctions: ${auctions.length}');

      // Find active auctions
      final activeAuctions = auctions.where((a) => a['status'] == 'active').toList();

      if (activeAuctions.isNotEmpty) {
        print('\n🎯 FOUND ACTIVE AUCTIONS!');
        for (var auction in activeAuctions.take(3)) {
          print('ID: ${auction['id']} - Title: ${auction['title'] ?? 'No title'} - Status: ${auction['status']}');
        }

        // Try to add the first active auction to watchlist
        final firstActive = activeAuctions[0];
        final auctionId = firstActive['id'];
        final auctionTitle = firstActive['title'] ?? 'No title';

        print('\n❤️ Adding ACTIVE auction to watchlist...');
        print('Auction ID: $auctionId');
        print('Auction Title: $auctionTitle');

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
          print('✅ SUCCESS: Added active auction to watchlist!');

          // Verify it's in the watchlist
          print('\n📋 Verifying watchlist...');
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
              print('🎉 MOBILE APP SHOULD NOW SHOW WATCHLIST ITEMS!');
            }
          }
        } else {
          print('❌ Failed to add to watchlist');
        }
      } else {
        print('\n⚠️ NO ACTIVE AUCTIONS FOUND');
        print('📝 This explains why the mobile app shows empty watchlist');
        print('💡 Need to create some active auctions to test watchlist functionality');

        // Show some pending auctions that could become active
        final pendingAuctions = auctions.where((a) => a['status'] == 'pending').toList();
        if (pendingAuctions.isNotEmpty) {
          print('\n⏳ PENDING AUCTIONS (could become active):');
          for (var auction in pendingAuctions.take(3)) {
            final startTime = DateTime.parse(auction['start_time']);
            final now = DateTime.now().toUtc();
            final timeUntilStart = startTime.difference(now);

            print('ID: ${auction['id']}');
            print('Title: ${auction['title'] ?? 'No title'}');
            print('Start Time: ${auction['start_time']}');
            print('Time until start: ${timeUntilStart.inHours} hours ${timeUntilStart.inMinutes % 60} minutes');
            print('---');
          }
        }
      }
    } else {
      print('❌ Failed to get auctions');
    }

  } catch (e) {
    print('❌ Error: $e');
  }
}