import 'dart:convert';
import 'package:flutter_advanced_dart/exercises/exe02_exe03/models/tenor_gif_model.dart';
import 'package:http/http.dart' as http;

class HomeRepository02 {
  static const String AUTH_KEY = "AIzaSyBwbpFWe4wrldxgEXgwcWYj_5VRQIwTntM";
  static const String CLIENT_KEY = "my_test_app";

  @override
  //Exercise 02
  static Future<List<TenorGifModel>> getTenor() async {
    Uri uri = Uri.https("tenor.googleapis.com", "/v2/featured", {
      "key": HomeRepository02.AUTH_KEY,
      "client_key": HomeRepository02.CLIENT_KEY
    });
    http.Response response = await http.get(uri);

    var responseMap = jsonDecode(response.body);

    List<TenorGifModel> gifList = [];

    (responseMap["results"] as List<dynamic>).map((e) {
      gifList.add(TenorGifModel.fromJson(e));
    }).toList();
    return gifList;
  }

  // Exercise 03

  static Future<List<TenorGifModel>> search(String search,
      [int limet = 10]) async {
    Uri uri = Uri.https("tenor.googleapis.com", "/v2/search", {
      "key": HomeRepository02.AUTH_KEY,
      "client_key": HomeRepository02.CLIENT_KEY,
      "limit": limet.toString(),
      "q": search
    });
    http.Response response = await http.get(uri);
    var responseObj = jsonDecode(response.body);

    List<TenorGifModel> gifList = [];

    (responseObj['results'] as List<dynamic>).forEach((element) {
      gifList.add(TenorGifModel.fromJson(element));
    });
    return gifList;
  }
}
