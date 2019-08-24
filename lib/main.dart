import 'package:crypto_tracker/screens/crypto_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(CryptoTrackerApp());

class CryptoTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CryptoScreen(),
    );
  }
}