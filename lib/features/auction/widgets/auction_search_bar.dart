import 'package:flutter/material.dart';

class AuctionSearchBar extends StatefulWidget {
  final Function(String) onSearchChanged;
  final String? initialQuery;

  const AuctionSearchBar({
    super.key,
    required this.onSearchChanged,
    this.initialQuery,
  });

  @override
  State<AuctionSearchBar> createState() => _AuctionSearchBarState();
}

class _AuctionSearchBarState extends State<AuctionSearchBar> {
  late TextEditingController _controller;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialQuery);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        onChanged: (query) {
          setState(() {
            _isSearching = query.isNotEmpty;
          });
          widget.onSearchChanged(query);
        },
        decoration: InputDecoration(
          hintText: 'Search auctions by name, brand, or description...',
          hintStyle: TextStyle(color: Colors.grey[600]),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey[600],
          ),
          suffixIcon: _isSearching
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _controller.clear();
                        setState(() {
                          _isSearching = false;
                        });
                        widget.onSearchChanged('');
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.mic),
                      onPressed: _startVoiceSearch,
                    ),
                  ],
                )
              : IconButton(
                  icon: const Icon(Icons.mic),
                  onPressed: _startVoiceSearch,
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }

  void _startVoiceSearch() {
    // Implement voice search functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Voice search coming soon!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}