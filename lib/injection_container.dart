import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rest_api/repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    // ..registerLazySingleton<Dio>(Dio.new)
    ..registerLazySingleton<Dio>(
      () => Dio()
        ..interceptors.add(
          PrettyDioLogger(
            requestBody: true,
          ),
        ),
    )
    ..registerLazySingleton<Repository>(() => Repository(sl<Dio>()));
}
