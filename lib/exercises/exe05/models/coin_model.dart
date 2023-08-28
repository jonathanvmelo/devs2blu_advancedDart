class CoinModel {
  String code = "";
  String name = "";
  String currentValue = "";

  CoinModel({
    required this.code,
    required this.name,
    required this.currentValue,
  });

  CoinModel.fromMap(Map<String, dynamic> map) {
    code = map["code"] ?? "N/A";
    name = map["name"] ?? "N/A";
    currentValue = map["bid"] ?? "N/A";
  }
}



  // "USDBRL": {
  //   "code": "USD",
  //   "codein": "BRL",
  //   "name": "Dólar Americano/Real Brasileiro",
  //   "high": "4.9008",
  //   "low": "4.8579",
  //   "varBid": "-0.0081",
  //   "pctChange": "-0.17",
  //   "bid": "4.8711",
  //   "ask": "4.8731",
  //   "timestamp": "1692997198",
  //   "create_date": "2023-08-25 17:59:58"
