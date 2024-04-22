import 'dart:developer';

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
    // TODO: implement initState
    super.initState();
    // timerDemo();
  }

  // Timer? timer;
  // void timerDemo() {
  //   timer = Timer(const Duration(seconds: 1), () {
  //     setState(() {
  //       counter++;
  //     });
  //   });
  // }

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text('Custom Scroll List'),
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
                'Header Section',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text("${index + 1}"),
                  ),
                  title: Text('Item ${index + 1}'),
                  subtitle: Text('Description of Item $index'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    log('Tapped on item $index');
                  },
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Footer Section',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
