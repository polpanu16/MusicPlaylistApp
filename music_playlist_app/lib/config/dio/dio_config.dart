import 'package:dio/dio.dart';

class DioConfig {
  static final DioConfig _instance = DioConfig._internal();
  late final Dio dio;

  DioConfig._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://storage.googleapis.com/',
      ),
    );
  }

  factory DioConfig() {
    return _instance;
  }
}
