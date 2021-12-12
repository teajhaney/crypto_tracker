class CoinApiModel {
  CoinApiModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.totalVolume,
    required this.priceChangePercentage24H,
    required this.marketCapChange24H,
    required this.marketCapChangePercentage24H,
    required this.priceChangePercentage1hInCurrency,
    required this.priceChangePercentage1yInCurrency,
    required this.priceChangePercentage200dInCurrency,
    required this.priceChangePercentage24hInCurrency,
    required this.priceChangePercentage30dInCurrency,
    required this.priceChangePercentage7dInCurrency,
    required this.lastUpdated,
    required this.circulatingSupply,
    required this.maxSupply,
    required this.totalSupply,
  });

  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;
  int marketCap;
  int marketCapRank;
  int totalVolume;
  double circulatingSupply;
  double totalSupply;
  double maxSupply;
  DateTime lastUpdated;
  double priceChangePercentage24H;
  double marketCapChange24H;
  double marketCapChangePercentage24H;
  double priceChangePercentage1hInCurrency;
  double priceChangePercentage1yInCurrency;
  double priceChangePercentage200dInCurrency;
  double priceChangePercentage24hInCurrency;
  double priceChangePercentage30dInCurrency;
  double priceChangePercentage7dInCurrency;

  factory CoinApiModel.fromJson(Map<String, dynamic> json) {
    return CoinApiModel(
      id: json["id"],
      symbol: json["symbol"],
      name: json["name"],
      image: json["image"],
      currentPrice: json["current_price"].toDouble(),
      marketCap: json["market_cap"],
      marketCapRank: json["market_cap_rank"],
      totalVolume: json["total_volume"],
      circulatingSupply: json["circulating_supply"].toDouble(),
      totalSupply: json["total_supply"] ?? 0,
      maxSupply: json["max_supply"] ?? 0,
      priceChangePercentage24H: json["price_change_percentage_24h"].toDouble(),
      marketCapChange24H: json["market_cap_change_24h"].toDouble(),
      lastUpdated: DateTime.parse(json["last_updated"]),
      marketCapChangePercentage24H:
          json["market_cap_change_percentage_24h"] ?? 0,
      priceChangePercentage1hInCurrency:
          json["price_change_percentage_1h_in_currency"] ?? 0,
      priceChangePercentage1yInCurrency:
          json["price_change_percentage_1y_in_currency"] ?? 0,
      priceChangePercentage200dInCurrency:
          json["price_change_percentage_200d_in_currency"] ?? 0,
      priceChangePercentage24hInCurrency:
          json["price_change_percentage_24h_in_currency"] ?? 0,
      priceChangePercentage30dInCurrency:
          json["price_change_percentage_30d_in_currency"] ?? 0,
      priceChangePercentage7dInCurrency:
          json["price_change_percentage_7d_in_currency"] ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbol'] = symbol;
    data['name'] = name;
    data['image'] = image;
    data['current_price'] = currentPrice;
    data['market_cap'] = marketCap;
    data['market_cap_change_percentage_24h'] = marketCapChangePercentage24H;
    data['market_cap_rank'] = marketCapRank;
    data['total_volume'] = totalVolume;
    data['circulating_supply'] = circulatingSupply;
    data['total_supply'] = totalSupply;
    data['max_supply'] = maxSupply;
    data['last_updated'] = lastUpdated.toIso8601String();
    data['price_change_percentage_1h_in_currency'] =
        priceChangePercentage1hInCurrency;
    data['price_change_percentage_1y_in_currency'] =
        priceChangePercentage1yInCurrency;
    data['price_change_percentage_200d_in_currency'] =
        priceChangePercentage200dInCurrency;
    data['price_change_percentage_24h_in_currency'] =
        priceChangePercentage24hInCurrency;
    data['price_change_percentage_30d_in_currency'] =
        priceChangePercentage30dInCurrency;
    data['price_change_percentage_7d_in_currency'] =
        priceChangePercentage7dInCurrency;

    return data;
  }
}
