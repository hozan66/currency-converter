import 'package:currency_converter/app/resources/api/dio_client.dart';
import 'package:currency_converter/app/resources/api/end_points.dart';
import 'package:currency_converter/app/resources/api/logging_interceptor.dart';
import 'package:currency_converter/presentation/currency/provider/currency_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/currency/data/repository/currency_repo.dart';


final GetIt sl = GetIt.instance;

class DIContainer {
  Future<void> init() async {
    // Core
    // sl.registerLazySingleton<BaseNetworkInfo>(() => NetworkInfoImpl());
    sl.registerLazySingleton(() => DioClient(EndPoints.baseUrl, sl(),
        loggingInterceptor: sl(), sharedPreferences: sl()));

    // Data Source
    // sl.registerLazySingleton(() => LocalDataSource(sharedPreferences: sl()));

    // Repository
    sl.registerLazySingleton(() => CurrencyRepo(dioClient: sl()));

    // Provider
    sl.registerFactory(() => CurrencyProvider(currencyRepo: sl()));

    // External
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton(() => LoggingInterceptor());
  }
}
