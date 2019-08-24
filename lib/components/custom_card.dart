import 'package:crypto_tracker/util/constants.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String cardText;

  const CustomCard({this.cardText});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          cardText,
          textAlign: TextAlign.center,
          style: kCardTextStyle,
        ),
      ),
    );
  }
}
