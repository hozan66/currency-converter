import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../app/resources/api/api_response.dart';
import '../../../../app/resources/api/dio_client.dart';
import '../../../../app/resources/api/end_points.dart';
import '../../../../app/resources/error/api_error_handler.dart';

class CurrencyRepo{
  final DioClient dioClient;
  CurrencyRepo({required this.dioClient});

  Future<ApiResponse> fetchCurrencyData(String baseCurrency) async {
    try {
      final Response response = await dioClient.get('${EndPoints.apiKey}${EndPoints.latestUri}/$baseCurrency');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      log('==============Error getCurrencyData=============');
      log(e.toString());
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}