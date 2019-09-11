import 'package:crypto_tracker/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  final String cardText;
  final String cryptoToken;
  final String cryptoName;

  const CustomCard({this.cardText, this.cryptoToken, this.cryptoName});

  @override
  Widget build(BuildContext context) {
    SvgPicture tokenImage = new SvgPicture.asset(
      'images/$cryptoToken.svg',
      width: 40.0,
      height: 40.0,
    );
    Widget imageContainer = Container(
      width: 50.0,
      height: 50.0,
      child: tokenImage,
    );
    return Card(
      color: Colors.white,
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: imageContainer,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  cardText,
                  style: kCardMainTextStyle,
                ),
                Text(
                  this.cryptoName,
                  style: kCardSubTextStyle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
