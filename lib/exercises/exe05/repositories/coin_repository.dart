import 'dart:convert';

import 'package:flutter_advanced_dart/exercises/exe05/http/http_client.dart';

import '../models/coin_model.dart';
import 'package:http/http.dart' as http;

abstract class ICoinRepository {
  Future<CoinModel> getCoin();
}

class CoinRepository implements ICoinRepository {
  final IHttpClient client;
  CoinRepository({required this.client});
  @override
  Future<CoinModel> getCoin() async {
    final response = await client.get(
        url: 'https://economia.awesomeapi.com.br/last/USD-BRL');

    if (response.statusCode == 200) {
      final responseObj = jsonDecode(response.body);
      final Map<String, dynamic> coinData = responseObj['USDBRL'];
      return CoinModel.fromMap(coinData);
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }
}
