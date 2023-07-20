import 'package:m_logica/app/services/dio_client.dart';
import 'package:m_logica/app/services/remote/api_path.dart';

class SiApi {
  final DioClient _dioClient = DioClient();

  Future<dynamic> getSiApi({
    required String startDate,
    required String endDate,
  }) async {
    try {
      final res = await _dioClient.post(
        path: ApiPath.getSi,
        data: <String, dynamic>{
          'START_ETA': startDate,
          'END_ETA': endDate,
        },
      );
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
