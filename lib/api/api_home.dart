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
    ApiHelper.getData();
    super.initState();
    // delayedMethod();
    // d();
    // unAwaitedFuture();
    // log("Okay");
    // Future.wait([d(), e()]).then((value) => log(value.length.toString()));
    // Future<String> fetchDataA() async {
    //   await Future.delayed(
    //       const Duration(seconds: 3)); // Simulate fetching data A
    //   log('Data A fetched');
    //   return "Dhruv";
    // }
    //
    // Future<int> fetchDataB() async {
    //   await Future.delayed(
    //       const Duration(seconds: 1)); // Simulate fetching data B
    //   log('Data B fetched');
    //   return 5;
    // }
    //
    // // Execute both functions in parallel
    // Future.wait([fetchDataA(), fetchDataB()]).then(
    //   (value) => log("After all Methods Call Value is ${value}"),
    // );
  }
  //
  // void delayedMethod() async {
  //   log("Before Delayed Method Call");
  //   await Future.delayed(const Duration(seconds: 3), () {
  //     log("After 3 Seconds Call");
  //   });
  //   log("After Delayed Method Call");
  // }
  //
  // Future d() async {
  //   await Future.delayed(const Duration(seconds: 5), () {
  //     log(" async after 5 second form D ");
  //   });
  //   log(" async after 5 second form D after await");
  // }
  //
  // void unAwaitedFuture() {
  //   unawaited(d());
  //   log("UnAwaited Call");
  // }
  //
  // Future e() async {
  //   await Future.delayed(const Duration(seconds: 2), () {
  //     log(" async after 2 second");
  //   });
  // }

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
