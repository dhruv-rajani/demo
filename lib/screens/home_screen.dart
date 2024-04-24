import 'package:flutter/material.dart';

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 60.0;

  @override
  double get maxExtent => 120.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text(
        'My Persistent Header',
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<String> items = List.generate(20, (index) => "Index $index");
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text('Sliver AppBar'),
            expandedHeight: 200,
            flexibleSpace:
                Placeholder(), // Replace with your flexible space widget
          ),
          SliverPersistentHeader(
            delegate: MyPersistentHeaderDelegate(),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Header',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     // childCount: items.length,
          //     (context, index) {
          //       return ListTile(
          //         title: Text(items[index].toString()),
          //         leading: Text(items[index].toString()),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
