import 'package:crypto_tracker/components/custom_app_bar.dart';
import 'package:crypto_tracker/components/custom_card.dart';
import 'package:crypto_tracker/util/coins_list.dart';
import 'package:crypto_tracker/util/constants.dart';
import 'package:flutter/material.dart';

class CryptoScreen extends StatefulWidget {
  @override
  _CryptoScreenState createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  String currencySelection;

  void onCurrencySelected(String currency) {
    setState(() {
      this.currencySelection = currency;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Crypto Tracker',
          style: kAppBarTextStyle,
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: Icon(
              Icons.attach_money,
              color: Colors.black,
            ),
            onSelected: (item) {
              onCurrencySelected(item);
              print(currencySelection);
            },
            itemBuilder: (BuildContext context) {
              return currenciesList.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: kPopupMenuItemTextStyle,
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Selected Currency:',
                  style: kPopupMenuItemTextStyle,
                ),
                Text(
                  currencySelection,
                  style: kPopupMenuItemTextStyle,
                )
              ],
            ),
          ),
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
