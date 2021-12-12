import 'dart:convert';

import 'package:crypto_tracker/model/coin_model.dart';
import 'package:http/http.dart' as http;

class Respository {
  Future<List<CoinApiModel>> coinGekoApi() async {
    var uri = Uri.parse(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=200&page=1&sparkline=false&price_change_percentage=1h%2C24h%2C7d%2C30d%2C200d%2C1y");
    var response = await http.get(uri);
    var responseData = jsonDecode(response.body);
    print(responseData);

    return List<CoinApiModel>.from(
        responseData.map((data) => CoinApiModel.fromJson(data)));
  }
}
