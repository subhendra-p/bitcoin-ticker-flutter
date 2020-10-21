import 'dart:convert';

import 'package:http/http.dart' as http;

const baseCoinDesk = 'https://api.coindesk.com/v1/bpi/currentprice/';
const endPoint = '.json';

class NetworkHelper {
  Future<dynamic> conversionRateCoin(String currency) async {
    print('input currency $currency');
    var data = await http.get('$baseCoinDesk$currency$endPoint');
    print('Network ${data.body}');
    return jsonDecode(data.body);
  }
}
