import 'package:flutter/material.dart';

class LazyLoading extends StatefulWidget {
  const LazyLoading({super.key});

  @override
  State<LazyLoading> createState() => _LazyLoadingState();
}

class _LazyLoadingState extends State<LazyLoading> {
  List<int> _items = List.generate(20, (index) => index + 1);
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreItems);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreItems() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        _isLoading = true;
      });
      fetchMoreData();
    }
  }

  fetchMoreData() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _items.addAll(List.generate(10, (index) => _items.length + index + 1));
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lazy Loading Example"),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length + (_isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < _items.length) {
            return ListTile(
              title: Text('Item ${_items[index]}'),
            );
          } else {
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
