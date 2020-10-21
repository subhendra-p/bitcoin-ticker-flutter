import 'package:bitcoin_ticker/network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';
import 'dart:io' show Platform;

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String conversionRate = '';

  DropdownButton<String> androidDropDown() {
    // for (var i = 0; i < currenciesList.length; i++) {
    //   print(currenciesList[i]);
    // }
    // selectedCurrency = currenciesList.first;
    List<DropdownMenuItem<String>> list = [];
    for (String currency in currenciesList) {
      var item = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      list.add(item);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: list,
      onChanged: (value) {
        print(value);
        setState(() {
          selectedCurrency = value;
          networkData(selectedCurrency);
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedItem) {
          print(selectedItem);
          setState(() {
            selectedCurrency = currenciesList[selectedItem];
            networkData(selectedCurrency);
          });
        },
        children: pickerItems);
  }

  // ignore: missing_return
  Widget getPicker() {
    // if (Platform.isIOS) {
    //   return iOSPicker();
    // } else if (Platform.isAndroid) {
    //   return androidDropDown();
    // }
    return iOSPicker();
  }

  void networkData(String currency) async {
    var decodeData = await NetworkHelper().conversionRateCoin(currency);
    double value = decodeData['bpi'][currency]['rate_float'];
    setState(() {
      conversionRate = value.toString();
    });
    print('response $decodeData');
  }

  @override
  void initState() {
    super.initState();
    networkData(selectedCurrency);
  }

  @override
  Widget build(BuildContext context) {
    // networkData(selectedCurrency);
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $conversionRate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            // child: androidDropDown(),
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
