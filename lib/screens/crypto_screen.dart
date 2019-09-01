import 'package:crypto_tracker/components/custom_app_bar.dart';
import 'package:crypto_tracker/components/custom_card.dart';
import 'package:crypto_tracker/services/crypto_model.dart';
import 'package:crypto_tracker/util/coins_list.dart';
import 'package:crypto_tracker/util/constants.dart';
import 'package:flutter_cupertino_data_picker/flutter_cupertino_data_picker.dart';
import 'package:flutter/material.dart';

class CryptoScreen extends StatefulWidget {
  @override
  _CryptoScreenState createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  String currencySelection = 'USD';
  var cryptoData = {};

  @override
  initState() {
    super.initState();
    getCryptoData();
  }

  void getCryptoData() async {
    var cryptoData =
        await CryptoModel().getCryptoData(cryptoList, currenciesList);
    setState(() {
      this.cryptoData = cryptoData;
    });
  }

  List<Padding> getCryptoCards() {
    if (cryptoData.keys.isEmpty) {
      return [];
    }
    List<Padding> cryptoCardsList = [];
    for (String token in cryptoData.keys) {
      var price = cryptoData[token][currencySelection].toStringAsFixed(2);
      cryptoCardsList.add(
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: CustomCard(
            cardText: '1 $token = $price $currencySelection',
          ),
        ),
      );
    }
    return cryptoCardsList;
  }

  List<Widget> getCurrencyList() {
    return currenciesList.map((String item) {
      return Text(
        item,
      );
    }).toList();
  }

  void _showCupertinoDataPicker() {
    final bool showTitleActions = true;
    DataPicker.showDatePicker(
      context,
      showTitleActions: showTitleActions,
      datas: currenciesList,
      locale: 'en_us',
      title: 'Select Currency',
      onConfirm: (data) {
        setState(() {
          this.currencySelection = data;
        });
      },
    );
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
          IconButton(
            icon: Icon(Icons.more_vert),
            color: Colors.black,
            onPressed: () {
              _showCupertinoDataPicker();
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: getCryptoCards(),
            ),
          ),
        ],
      ),
    );
  }
}
