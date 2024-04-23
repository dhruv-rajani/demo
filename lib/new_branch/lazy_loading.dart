import 'dart:math';

import 'package:flutter/material.dart';

class LazyLoadingExample extends StatefulWidget {
  const LazyLoadingExample({super.key});

  @override
  State<LazyLoadingExample> createState() => _LazyLoadingExampleState();
}

class _LazyLoadingExampleState extends State<LazyLoadingExample> {
  ScrollController controller = ScrollController();
  List<String> items = List.generate(20, (index) => "Index $index");
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      scrollListener();
    });
  }

  void scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent) {
      setState(() {
        isLoading = true;
      });
      fetchData();
    }
  }

  Future fetchData() async {
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        items.addAll(
          List.generate(10, (index) => "New Data - $randomNumber"),
        );
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  String get randomNumber => Random().nextInt(1000).toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.purple.withOpacity(0.5),
      ),
      body: ListView.builder(
        controller: controller,
        itemCount: isLoading ? items.length + 1 : items.length,
        itemBuilder: (context, index) {
          if (items.length == index) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListTile(
            leading: CircleAvatar(
              child: Text("${index + 1}"),
            ),
            title: Text(items[index + 1]),
            onTap: () {
              print('Tapped on item $index');
            },
          );
        },
      ),
    );
  }
}
