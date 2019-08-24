import 'package:crypto_tracker/components/custom_app_bar.dart';
import 'package:crypto_tracker/components/custom_card.dart';
import 'package:crypto_tracker/util/constants.dart';
import 'package:flutter/material.dart';

class CryptoScreen extends StatefulWidget {
  @override
  _CryptoScreenState createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Crypto Tracker',
          style: kAppBarTextStyle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: CustomCard(
              cardText: '1 BTC = ? USD',
            ),
          ),
        ],
      ),
    );
  }
}
