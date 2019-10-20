import 'package:crypto_tracker/screens/token_screen.dart';
import 'package:crypto_tracker/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  final String cryptoToken;
  final String cryptoName;
  final String cryptoPrice;
  final String currencySelection;

  const CustomCard(
      {this.cryptoToken,
      this.cryptoName,
      this.cryptoPrice,
      this.currencySelection});

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
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TokenScreen(
                        cryptoToken: cryptoToken,
                        cryptoName: cryptoName,
                      )));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Hero(
                        tag: '${cryptoToken}_LOGO',
                        child: imageContainer,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          this.cryptoName,
                          style: kCardMainTextStyle,
                        ),
                        Text(
                          this.cryptoToken,
                          style: kCardSubTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    this.cryptoPrice,
                    style: kCardMainTextStyle,
                  ),
                  Text(
                    this.currencySelection,
                    style: kCardSubTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
