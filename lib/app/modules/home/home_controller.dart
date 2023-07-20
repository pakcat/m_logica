import 'package:get/get.dart';
import 'package:m_logica/app/core/utils/app_utils.dart';
import 'package:m_logica/app/data/remote/response/si.dart';
import 'package:m_logica/app/repositories/si_repo.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    fetchEvent();
    super.onInit();
  }

  List<Si> listSi = [];

  Future fetchEvent() async {
    try {
      String dateNow = DateUtil.getDateFormat(DateTime.now());

      listSi = await SiRepo().getSiRepo(
              startDate: DateUtil.getDateFormat(
                  DateTime.now().subtract(const Duration(days: 30))),
              endDate: dateNow) ??
          [];
      update();
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
