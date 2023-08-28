import 'package:flutter/material.dart';
import 'package:flutter_advanced_dart/exercises/exe05/models/coin_model.dart';

class ListTileCoin extends StatelessWidget {
  ListTileCoin({super.key, required this.coinModel});

  CoinModel coinModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(coinModel.code),
      title: Text(coinModel.name),
      trailing: Text(coinModel.currentValue),
    );
  }
}
