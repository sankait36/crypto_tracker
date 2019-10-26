import 'package:crypto_tracker/components/custom_app_bar.dart';
import 'package:crypto_tracker/components/custom_card.dart';
import 'package:crypto_tracker/components/custom_drawer.dart';
import 'package:crypto_tracker/services/crypto_model.dart';
import 'package:crypto_tracker/util/coins_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_data_picker/flutter_cupertino_data_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CryptoScreen extends StatefulWidget {
  static const String id = 'crypto_screen';

  @override
  _CryptoScreenState createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  String currencySelection = 'USD';
  String appBarTitle = 'Prices';
  var cryptoData = {};

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
    getCryptoData();
  }

  Future<void> getCryptoData() async {
    var newCryptoData = await CryptoModel()
        .getCryptoData(cryptoList.keys.toList(), currenciesList);
    setState(() {
      this.cryptoData = newCryptoData;
    });
  }

  List<Padding> getCryptoCards() {
    if (cryptoData.keys.isEmpty) {
      return [];
    }
    List<Padding> cryptoCardsList = [];
    for (String token in cryptoData.keys) {
      var price = cryptoData[token][currencySelection].toStringAsFixed(2);
      cryptoCardsList.add(
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: CustomCard(
            cardText: '1 $token = $price $currencySelection',
            cryptoToken: token,
            cryptoName: cryptoList[token],
          ),
        ),
      );
    }
    return cryptoCardsList;
  }

  List<Widget> getCurrencyList() {
    return currenciesList.map((String item) {
      return Text(
        item,
      );
    }).toList();
  }

  void _showCupertinoDataPicker() {
    final bool showTitleActions = true;
    DataPicker.showDatePicker(
      context,
      showTitleActions: showTitleActions,
      datas: currenciesList,
      locale: 'en_us',
      title: 'Select Currency',
      onConfirm: (data) {
        setState(() {
          this.currencySelection = data;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (this.cryptoData.isEmpty) {
      return Scaffold(
        body: Center(
          child: SpinKitCubeGrid(
            color: Colors.grey.shade700,
            size: 50.0,
          ),
        ),
      );
    }
    return Scaffold(
      drawer: CustomDrawer(
        currencySelection: this.currencySelection,
        onCurrencySelectionChange: () {
          this._showCupertinoDataPicker();
        },
      ),
      appBar: CustomAppBar(
        title: Text(
          this.appBarTitle,
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: getCryptoData,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(18.0),
                  children: getCryptoCards(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
