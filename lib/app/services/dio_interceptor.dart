import 'package:dio/dio.dart';
import 'package:m_logica/app/services/local/user_pref.dart';

class DioInterceptor extends Interceptor {
  final UserPref _userPref = UserPref();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String? token = await _userPref.getTokenPref();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    options.headers['Content-Type'] = 'application/json';

    super.onRequest(options, handler);
  }
}
