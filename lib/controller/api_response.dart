import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:new_test/models/api_model.dart';

class ApiResponse extends ChangeNotifier {
  Future<List<ApiModel>> getData() async {
    const url = 'https://fakestoreapi.com/products';

    try {
      var uri = Uri.parse(url);
      var res = await http.get(uri);
      List<dynamic> resFromApi = json.decode(res.body);
      List<ApiModel> products =
          resFromApi.map((e) => ApiModel.fromJson(e)).toList();
      print(resFromApi);
      return products;
    } catch (e) {
      print(e.toString());
      throw Exception('Could mot get data');
    }
  }
}
