import 'dart:async';

import 'package:crypto_tracker/model/coin_model.dart';
import 'package:crypto_tracker/respository.dart/respositories.dart';
import 'package:flutter/material.dart';

import 'package:crypto_tracker/widgets/widgets.dart';

class CryptoTrackerScreen extends StatefulWidget {
  const CryptoTrackerScreen({Key? key}) : super(key: key);

  @override
  _CryptoTrackerScreenState createState() => _CryptoTrackerScreenState();
}

class _CryptoTrackerScreenState extends State<CryptoTrackerScreen> {
  late Future _futureCoins;
  late Respository respository;

  @override
  void initState() {
    callApi();
    super.initState();
  }

  callApi() {
    respository = Respository();
    _futureCoins = respository.coinGekoApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_left,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Live prices',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined, size: 25),
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Expanded(
            child: FutureBuilder(
              future: _futureCoins,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var coinsData = snapshot.data;
                  return Column(
                    children: [
                      HeaderRow(coins: coinsData),
                      const SizedBox(
                        height: 20,
                      ),
                      const SearchText(),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(child: CoinLists(coins: coinsData)),
                      
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.hasError}'),
                  );
                }

                return const Center(
                    child: CircularProgressIndicator(
                  color: Color(0xff18B762),
                ));
              },
            ),
          ),
        ],
      ),
    ));
  }
}
