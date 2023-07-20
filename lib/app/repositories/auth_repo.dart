import 'package:m_logica/app/data/remote/response/user.dart';
import 'package:m_logica/app/services/local/user_pref.dart';
import 'package:m_logica/app/services/remote/auth_api.dart';

class AuthRepo {
  final AuthApi _authApi = AuthApi();

  Future<User?> login({String? username, String? password}) async {
    try {
      final res = await _authApi.loginApi(
        username: username,
      );
      UserPref userPref = UserPref();

      userPref.setTokenPref(res['data']['bearerToken']);
      return User.fromJson(res['data']);
    } catch (e) {
      rethrow;
    }
  }
}
