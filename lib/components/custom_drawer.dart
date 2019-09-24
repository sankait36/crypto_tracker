import 'package:crypto_tracker/util/constants.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32.0),
            child: ListTile(
              title: Text(
                'CryptoTracker',
                style: kDrawerHeaderTextStyle,
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text(
              'Selected Currency',
              style: kDrawerTileTextStyle,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
