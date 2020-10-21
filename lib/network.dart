import 'dart:convert';

import 'package:http/http.dart' as http;

const apiLey = '230EB4F8-79B8-4F3C-99DC-86137F20545F';
const baseUrl = 'https://rest.coinapi.io/v1/exchangerate/BTC/';
const baseCoinDesk = 'https://api.coindesk.com/v1/bpi/currentprice/';
const endPoint = '.json';

class NetworkHelper {
  // Future<dynamic> conversionRate() async {
  //   var data = await http.get('$baseUrl/USD', headers: {
  //     "Accept": "application/json",
  //     "Content-Type": "application/x-www-form-urlencoded",
  //     "X-CoinAPI-Key": "230EB4F8-79B8-4F3C-99DC-86137F20545F"
  //   });
  //   print('Network ${data.body}');
  //   return jsonDecode(data.body);
  // }

  Future<dynamic> conversionRateCoin(String currency) async {
    print('input currency $currency');
    var data = await http.get('$baseCoinDesk$currency$endPoint');
    print('Network ${data.body}');
    return jsonDecode(data.body);
  }
}
