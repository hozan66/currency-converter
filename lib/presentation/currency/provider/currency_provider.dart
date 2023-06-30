import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../app/resources/api/api_response.dart';
import '../../../app/resources/utils/utils.dart';
import '../data/repository/currency_repo.dart';

class CurrencyProvider with ChangeNotifier {
  final CurrencyRepo currencyRepo;
  CurrencyProvider({required this.currencyRepo});

  final TextEditingController baseCurrencyController = TextEditingController(text: '1.0');
  final TextEditingController targetCurrencyController = TextEditingController();
  String baseCurrency = 'USD';
  String targetCurrency = 'USD';

  // Set Base Currency
  void setBaseCurrency(String value) {
    baseCurrency = value;
    notifyListeners();
  }

  // Set Target Currency
  void setTargetCurrency(String value) {
    targetCurrency = value;
    notifyListeners();
  }

  List<String> currencyAbbreviations = [
    'USD',
    'IQD',
    'GBP',
    'EUR',
    'TRY',
  ];

  Map<String, dynamic>? _currencyData;
  Map<String, dynamic>? get getCurrencyData => _currencyData;

  Future<void> fetchCurrencyData(String baseCurrency) async {
    _currencyData = null;
    notifyListeners();
    final ApiResponse apiResponse = await currencyRepo.fetchCurrencyData(baseCurrency);
    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      log('=================getCurrencyData CurrencyProvider================');
      if (apiResponse.response?.data['result'] == 'success') {
        log(apiResponse.response?.data.toString()?? 'null');
        _currencyData = null;
        _currencyData=apiResponse.response?.data['conversion_rates'];
        baseCurrencyController.text='1.0';
          convertCurrency(baseCurrencyController.text, targetCurrency);
        // _homeModel = null;
        // _homeModel = HomeModel.fromJson(apiResponse.response?.data['data']);
      } else {
        log(apiResponse.response?.data['result']);
        Utils.showToast(
          message: apiResponse.response?.data['result'],
          state: ToastStates.error,
        );
      }
    } else {
      log(apiResponse.error.toString());
    }
    notifyListeners();
  }

void convertCurrency(String input, String targetCurrency)  {
    if(input.isNotEmpty){
      targetCurrencyController.text= (double.parse(input) * _currencyData![targetCurrency]).toString();
      notifyListeners();
    }
  }
}