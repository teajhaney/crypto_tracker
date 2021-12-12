import 'package:crypto_tracker/model/chart_data.dart';
import 'package:crypto_tracker/model/coin_model.dart';
import 'package:crypto_tracker/screens/coins_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CoinLists extends StatelessWidget {
  CoinLists({
    Key? key,
    required this.coins,
  }) : super(key: key);
  final List<CoinApiModel> coins;
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return FadingEdgeScrollView.fromScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            controller: _controller,
            scrollDirection: Axis.vertical,
            itemCount: coins.length,
            itemBuilder: (BuildContext context, int index) {
              List<ChartData> data = [
                ChartData(coins[index].priceChangePercentage1hInCurrency, 1),
                ChartData(coins[index].priceChangePercentage24hInCurrency, 24),
                ChartData(coins[index].priceChangePercentage7dInCurrency, 168),
                ChartData(coins[index].priceChangePercentage30dInCurrency, 720),
                ChartData(
                    coins[index].priceChangePercentage200dInCurrency, 4800),
                ChartData(coins[index].priceChangePercentage1yInCurrency, 8760),
              ];
              return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CoinsDetailScreen(coin: coins[index]))),
                        child: Row(
                          children: [
                            Image(
                              width: 40,
                              height: 40,
                              image: NetworkImage(
                                coins[index].image,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        coins[index].name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        coins[index].symbol,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Expanded(
                                  //     child: Container(
                                  //         padding:
                                  //             const EdgeInsets.only(left: 16),
                                  //         height: 40,
                                  //         width: 60,
                                  //         child: SfCartesianChart(
                                  //             plotAreaBorderWidth: 0,
                                  //             primaryXAxis: CategoryAxis(
                                  //                 isVisible: false),
                                  //             primaryYAxis: CategoryAxis(
                                  //                 isVisible: false),
                                  //             legend: Legend(isVisible: false),
                                  //             tooltipBehavior: TooltipBehavior(
                                  //                 enable: false),
                                  //             series: <
                                  //                 ChartSeries<ChartData,
                                  //                     String>>[
                                  //               LineSeries<ChartData, String>(
                                  //                 dataSource: data,
                                  //                 xValueMapper:
                                  //                     (ChartData data, _) =>
                                  //                         data.year.toString(),
                                  //                 yValueMapper:
                                  //                     (ChartData data, _) =>
                                  //                         data.value,
                                  //               ),
                                  //             ]))),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '\$${coins[index].currentPrice.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${coins[index].priceChangePercentage24H.toStringAsFixed(2)}%',
                                        style: TextStyle(
                                          color: coins[index]
                                                      .priceChangePercentage24H >=
                                                  0
                                              ? const Color(
                                                  0xff18B762,
                                                )
                                              : Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )));
            }));
  }
}
