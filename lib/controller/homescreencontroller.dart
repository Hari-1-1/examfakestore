import 'dart:convert';
import 'package:fakestoreapi/model/apimodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  List<SampleResp> productlist = [];
  fetchData() async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body) as List;

      productlist = decodedData
          .map<SampleResp>((element) => SampleResp.fromJson(element))
          .toList();
      print(productlist[1].category);
      notifyListeners();
    }
  }
}