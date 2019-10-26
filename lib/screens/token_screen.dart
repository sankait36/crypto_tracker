import 'package:crypto_tracker/components/custom_app_bar.dart';
import 'package:crypto_tracker/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TokenScreen extends StatelessWidget {
  final String cryptoToken;
  final String cryptoName;
  final String cryptoPrice;

  const TokenScreen({this.cryptoToken, this.cryptoName, this.cryptoPrice});

  @override
  Widget build(BuildContext context) {
    SvgPicture tokenImage = new SvgPicture.asset(
      'images/$cryptoToken.svg',
      width: 60.0,
      height: 60.0,
    );
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          cryptoName,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Hero(
                      tag: '${cryptoToken}_LOGO',
                      child: tokenImage,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        cryptoName,
                        style: kCardMainTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
