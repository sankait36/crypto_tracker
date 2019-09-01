import 'package:crypto_tracker/services/networking.dart';

const bitcoinAverageAPIBase =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker/short';

// https://apiv2.bitcoinaverage.com/indices/global/ticker/short?crypto=BTC,ETH,LTC&fiat=USD,EUR,AUD

class CryptoModel {
  Future<Object> getCryptoData(
      List<String> cryptoList, List<String> currencyList) async {
    String cryptos = cryptoList.join(',');
    String fiats = currencyList.join(',');
    Networking networkHelper =
        Networking('$bitcoinAverageAPIBase?crypto=$cryptos&fiat=$fiats');
    var cryptoData = await networkHelper.getData();
    var priceData = getPricesForCryptoToken(cryptoList, cryptoData);
    return priceData;
  }

  Object getPricesForCryptoToken(dynamic cryptoList, dynamic cryptoData) {
    var result = {};
    for (String item in cryptoList) {
      result[item] = {};
    }
    for (String data in cryptoData.keys) {
      result[data.substring(0, 3)][data.substring(3)] = cryptoData[data]['last'];
    }
    return result;
  }
}
