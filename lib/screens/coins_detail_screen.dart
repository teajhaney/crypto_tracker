import 'package:crypto_tracker/model/coin_model.dart';
import 'package:crypto_tracker/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinsDetailScreen extends StatefulWidget {
  final CoinApiModel coin;
  const CoinsDetailScreen({Key? key, required this.coin}) : super(key: key);

  @override
  State<CoinsDetailScreen> createState() => _CoinsDetailScreenState();
}

class _CoinsDetailScreenState extends State<CoinsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss.SSS'Z'")
        .parse(widget.coin.lastUpdated.toString());
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36),
            ),
            // title: const Text(
            //   'Coin Details',
            //   style: TextStyle(
            //     fontSize: 30,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // centerTitle: true,
            backgroundColor: const Color(0xFf262338),
            expandedHeight: 300.0,
            pinned: true,
            snap: true,
            floating: true,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: const ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                child: Image(
                  image: AssetImage('assets/images/crypto.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              titlePadding: const EdgeInsets.symmetric(vertical: 16),
              title: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 0.0),
                width: double.infinity,
                height: 60,
                child: ListTile(
                  leading: SizedBox(
                    height: 60,
                    width: 60,
                    child: Image(
                      image: NetworkImage(widget.coin.image),
                    ),
                  ),
                  title: Text(
                    widget.coin.name +
                        " " +
                        widget.coin.symbol +
                        "      " +
                        "#" +
                        widget.coin.marketCapRank.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: SliverAppBarDelegate(
              minHeight: 360,
              maxHeight: 360,
              child: Padding(
                  padding: const EdgeInsets.only(
                    top: 32,
                  ),
                  child: Column(
                    children: [
                      Text('\$${widget.coin.currentPrice}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                          )),
                      const SizedBox(height: 5),
                      Text(outputDate,
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                            color: Colors.grey,
                          )),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Circulating Supply',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    widget.coin.circulatingSupply.toString(),
                                    style: const TextStyle(
                                      color: Color(0xff18B762),
                                      fontSize: 25,
                                    ),
                                  ),
                                ]),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Max Supply',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    widget.coin.maxSupply.toString(),
                                    style: const TextStyle(
                                      color: Color(0xff18B762),
                                      fontSize: 25,
                                    ),
                                  ),
                                ]),
                            const SizedBox(height: 20),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Market Cap',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                  Text(
                                    widget.coin.marketCap > 999999999999
                                        ? "\$${(widget.coin.marketCap / 1000000000000).toStringAsFixed(1)}B"
                                        : '\$${widget.coin.marketCap.toString()}B',
                                    style: const TextStyle(
                                      color: Color(0xff18B762),
                                      fontSize: 25,
                                    ),
                                  ),
                                ])
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          //
        ],
      ),
    );
  }
}
