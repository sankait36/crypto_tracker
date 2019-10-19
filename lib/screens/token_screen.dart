import 'package:crypto_tracker/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TokenScreen extends StatelessWidget {
  static const String id = 'token_screen';

  final String cryptoToken;

  const TokenScreen({Key key, this.cryptoToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SvgPicture tokenImage = new SvgPicture.asset(
      'images/$cryptoToken.svg',
      width: 80.0,
      height: 80.0,
    );
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          this.cryptoToken,
        ),
      ),
      body: Center(
        child: Hero(
          tag: '${cryptoToken}_LOGO',
          child: tokenImage,
        ),
      ),
    );
  }
}
