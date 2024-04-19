import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_topics/api/api_helper.dart';

class ApiHome extends StatefulWidget {
  const ApiHome({super.key});

  @override
  State<ApiHome> createState() => _ApiHomeState();
}

class _ApiHomeState extends State<ApiHome> {
  // List<UsersDataModel>? dataModel = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiHelper.getData();
    d();
  }

  d() async {
    await Future.delayed(const Duration(seconds: 4), () {
      log(" async d ");

      /// num datatype can accept both int and double
      // num x = 5;
      // num a = 10.02;
      // print(a);
    });
    Future.delayed(const Duration(seconds: 2), () {
      log(" async after 2 second ");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Calling"),
      ),
      body: FutureBuilder(
        future: ApiHelper.getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: ApiHelper.modelData?.users.length,
              itemBuilder: (context, index) {
                final constUser = ApiHelper.modelData?.users[index];
                return ListTile(
                  title: Text(
                    constUser!.address.coordinates.lat.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
