import 'package:dio/dio.dart';
import 'package:lingopanda_assignment/core/constants/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const Map<String, dynamic> defaultHeaders = {
  'Content-Type': 'application/json'
};

class Api {
  final Dio _dio = Dio();

  Api() {
    _dio.options.baseUrl = ApiEndpoints.baseUrl;
    _dio.options.headers = defaultHeaders;

    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  Dio get sendRequest => _dio;
}
