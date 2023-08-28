import 'package:flutter/material.dart';
import 'package:flutter_advanced_dart/exercises/exe05/repositories/coin_repository.dart';
import 'package:flutter_advanced_dart/exercises/exe05/models/coin_model.dart';
import '../http/http_client.dart';

class HomePageCoin extends StatelessWidget {
  const HomePageCoin({Key? key});

  @override
  Widget build(BuildContext context) {
    final coinRepository = CoinRepository(client: HttpClient());

    return Scaffold(
      appBar: AppBar(
        title: Text('Cotação Api'),
        centerTitle: true,
      ),
      body: FutureBuilder<CoinModel>(
        future: coinRepository.getCoin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('Nada a ser exibido'));
          } else {
            final coinData = snapshot.data!;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Código: ${coinData.code}'),
                  Text('Nome: ${coinData.name}'),
                  Text('Cotação: ${coinData.currentValue}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
