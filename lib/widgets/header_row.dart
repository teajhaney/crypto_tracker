import 'package:crypto_tracker/model/coin_model.dart';
import 'package:flutter/material.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({
    Key? key,
    required this.coins,
  }) : super(key: key);
  final List<CoinApiModel> coins;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'BTC Market cap',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  coins[0].marketCap > 999999999999
                      ? "\$${(coins[0].marketCap / 1000000000000).toStringAsFixed(1)}B"
                      : '\$${coins[0].marketCap.toString()}B',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  '${coins[0].marketCapChangePercentage24H.toStringAsFixed(2)}%',
                  style: TextStyle(
                    color: coins[0].marketCapChangePercentage24H >= 0
                        ? const Color(
                            0xff18B762,
                          )
                        : Colors.red,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'BTC Cap rank',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              coins[0].marketCapRank.toString(),
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'BTC Volume',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              coins[0].totalVolume > 999999999
                  ? "\$${(coins[0].totalVolume / 1000000000).toStringAsFixed(0)}B"
                  : '\$${coins[0].totalVolume.toString()}B',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
