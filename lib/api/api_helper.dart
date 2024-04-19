import 'dart:convert';
import 'dart:developer';

import 'package:flutter_topics/api/api_constant_url.dart';
import 'package:flutter_topics/api/api_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static List<User>? model = [];
  static UsersDataModel? modelData;
  static Future<UsersDataModel?> getData() async {
    String url = ApiConstant.baseUrl + ApiConstant.endPoint;
    http.Response response = await http.get(
      Uri.parse("https://dummyjson.com/users"),
    );
    if (response.statusCode == 200) {
      UsersDataModel data = UsersDataModel.fromJson(
        jsonDecode(response.body),
      );
      log('Models ggg || ${data.users.length}');
      modelData = data;
      return modelData;
    } else {
      return modelData;
    }
  }
}
