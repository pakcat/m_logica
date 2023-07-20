import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'dio_exception.dart';
import 'dio_interceptor.dart';

class DioClient {
  final String _baseUrl = 'https://uat-mostapi.mglog.co.id/api';
  //final String _baseUrl = 'http://adenazib-001-site1.ftempurl.com';

  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        sendTimeout: const Duration(seconds: 10),
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
    _dio.interceptors.add(DioInterceptor());
    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
    ));
  }

  Future<Response> post({
    required String path,
    Map<String, dynamic>? data,
    FormData? formData,
  }) async {
    try {
      final res = await _dio.post(
        _baseUrl + path,
        data: data ?? formData,
      );

      return res;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      throw errorMessage;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put({
    required String path,
    Map<String, dynamic>? data,
    FormData? formData,
  }) async {
    try {
      final res = await _dio.put(
        _baseUrl + path,
        data: data ?? formData,
      );

      return res;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      throw errorMessage;
    } catch (e) {
      rethrow;
    }
  }
}
