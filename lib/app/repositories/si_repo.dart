import 'package:m_logica/app/data/remote/response/si.dart';
import 'package:m_logica/app/services/remote/si_api.dart';

class SiRepo {
  final SiApi _authApi = SiApi();

  Future<List<Si>?> getSiRepo(
      {required String startDate, required String endDate}) async {
    try {
      final res = await _authApi.getSiApi(
        endDate: endDate,
        startDate: startDate,
      );

      final List<Si> data =
          (res?['data'] as List<dynamic>).map((e) => Si.fromJson(e)).toList();

      final List<Si> filterData = data
          .where((e) => e.siBooking?.driveRName?.isNotEmpty ?? false)
          .toList();

      return filterData;
    } catch (e) {
      rethrow;
    }
  }
}
