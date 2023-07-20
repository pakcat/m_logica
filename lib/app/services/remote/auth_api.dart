import '../dio_client.dart';
import 'api_path.dart';

class AuthApi {
  final DioClient _dioClient = DioClient();

  Future<dynamic> loginApi({String? username, String? password}) async {
    try {
      final res = await _dioClient.post(
        path: ApiPath.login,
        data: {
          'email': username,
        },
      );
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
