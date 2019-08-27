import 'package:crypto_tracker/components/custom_app_bar.dart';
import 'package:crypto_tracker/components/custom_card.dart';
import 'package:crypto_tracker/util/coins_list.dart';
import 'package:crypto_tracker/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CryptoScreen extends StatefulWidget {
  @override
  _CryptoScreenState createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  String currencySelection = 'USD';
  int selectedIndex = 0;

  List<Widget> getCurrencyList() {
    return currenciesList.map((String item) {
      return Text(
        item,
      );
    }).toList();
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
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext builder) {
                    return CupertinoPicker(
                      scrollController: FixedExtentScrollController(initialItem: selectedIndex),
                      itemExtent: 32.0,
                      diameterRatio: 1.0,
                      onSelectedItemChanged: (selectedIndex) {
                        setState(() {
                          this.currencySelection = currenciesList.elementAt(selectedIndex);
                          this.selectedIndex = selectedIndex;
                        });
                      },
                      children: getCurrencyList(),
                    );
                  });
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
              cardText: '1 BTC = ? $currencySelection',
            ),
          ),
        ],
      ),
    );
  }
}
