import 'package:dio/dio.dart';

import '../api/status_code.dart';

class ApiErrorHandler {
  static String getMessage(dynamic error) {
    String errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.connectionTimeout:
              errorDescription = "Connection timeout with API server";
              break;
            case DioExceptionType.sendTimeout:
            case DioExceptionType.receiveTimeout:
              errorDescription =
                  "Receive Or Send timeout in connection with API server";
              break;
            case DioExceptionType.badCertificate:
              errorDescription = "Bad Certificate with API server";
              break;
            case DioExceptionType.badResponse:
              switch (error.response?.statusCode) {
                case StatusCode.badRequest:
                  errorDescription = 'badRequest';
                  break;
                case StatusCode.unauthorized:
                  errorDescription = 'unauthorized ';
                  break;
                case StatusCode.forbidden:
                  errorDescription = 'forbidden ';
                  break;
                case StatusCode.notFound:
                  errorDescription = 'notFound ';
                  break;
                case StatusCode.conflict:
                  errorDescription = 'conflict ';
                  break;
                case 500:
                case 503:
                  errorDescription = error.response?.statusMessage ?? '';
                  break;
                default:
                  errorDescription = "Some other errors from API server";
                  break;
              }
              break;
            case DioExceptionType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;
            case DioExceptionType.connectionError:
              errorDescription = "Connection Error from API server";
              break;
            case DioExceptionType.unknown:
              errorDescription =
                  "Connection to API server failed due to internet connection";
              break;
          }
        } else {
          errorDescription = "Unexpected error occurred";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}
