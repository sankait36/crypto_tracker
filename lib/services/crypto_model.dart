import 'package:crypto_tracker/services/networking.dart';

const bitcoinAverageAPIBase = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/short';

// https://apiv2.bitcoinaverage.com/indices/global/ticker/short?crypto=BTC,ETH,LTC&fiat=USD,EUR,AUD

class CryptoModel {
  Future<dynamic> getCryptoData(List<String> cryptoList, List<String> currencyList) async {
    String cryptos = cryptoList.join(',');
    String fiats = currencyList.join(',');
    Networking networkHelper = Networking('$bitcoinAverageAPIBase?crypto=$cryptos&fiat=$fiats');
    var cryptoData = await networkHelper.getData();
    return cryptoData;
  }
}
