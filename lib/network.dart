import 'package:http/http.dart' as http;

const apiLey = '230EB4F8-79B8-4F3C-99DC-86137F20545F';
const baseUrl = 'https://rest.coinapi.io/v1/exchangerate/BTC';

class NetworkHelper {
  Future<dynamic> conversionRate() async {
    var data = await http.get('$baseUrl/USD', headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      "X-CoinAPI-Key": "230EB4F8-79B8-4F3C-99DC-86137F20545F"
    });
    print('Network ${data.body}');
    return data;
  }
}
