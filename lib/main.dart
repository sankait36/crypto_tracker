import 'package:crypto_tracker/screens/crypto_screen.dart';
import 'package:crypto_tracker/util/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(CryptoTrackerApp());

class CryptoTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.white,
          brightness: Brightness.light,
          textTheme: TextTheme(title: kAppBarTextStyle),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(title: kAppBarTextStyleDark),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: CryptoScreen(),
    );
  }
}
