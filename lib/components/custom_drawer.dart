import 'package:crypto_tracker/util/constants.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String currencySelection;
  final Function onCurrencySelectionChange;

  const CustomDrawer({this.currencySelection, this.onCurrencySelectionChange});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ListTile(
                title: Text(
                  'CryptoTracker',
                  style: kDrawerHeaderTextStyle,
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text(
              'Currency',
              style: kDrawerTileTextStyle,
            ),
            trailing: Text(
              currencySelection,
              style: kDrawerTileTextStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              onCurrencySelectionChange();
            },
          ),
        ],
      ),
    );
  }
}
