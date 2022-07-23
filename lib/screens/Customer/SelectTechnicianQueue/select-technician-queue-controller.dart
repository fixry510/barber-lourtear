import 'package:barber/config/api-endpoint.dart';
import 'package:barber/models/technic-time-data.dart';
import 'package:barber/models/user-data.dart';
import 'package:barber/network/request-exception.dart';
import 'package:barber/network/request.dart';
import 'package:barber/utils/date-select.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SelectTechnicianQueueController extends GetxController {
  UserData technic = Get.arguments;
  String currentDate = "";
  List<TechnicTimeData> technicTimeData = [];
  final isLoad = false.obs;

  Future<void> selectDateQueue() async {
    final dateSelect = await showDateSelect(firstDate: DateTime.now());
    if (dateSelect != null) {
      currentDate = formatYearThai(
        date: dateSelect,
      );
      update();
      fetchTime();
    }
  }

  Future<void> fetchTime() async {
    try {
      isLoad.value = true;
      technicTimeData = [];
      String currentNewFormat = currentDate.split("/").reversed.join("-");
      final respone = await getRequest(
          path: "${APIEndpoint.hostName}/technician/time/${technic.userId}",
          queryParameters: {
            "date": currentNewFormat,
          });
      respone.forEach((data) {
        final timeObj = TechnicTimeData.fromJson(data);
        timeObj.fromTime = timeObj.fromTime.substring(0, 5);
        timeObj.toTime = timeObj.toTime.substring(0, 5);
        technicTimeData.add(timeObj);
      });
    } on RequestException catch (_) {
    } finally {
      Future.delayed(Duration(milliseconds: 500), () {
        isLoad.value = false;
      });
    }
  }

  String formatYearThai({date}) {
    String current = DateFormat("dd/MM/yyyy").format(date ?? DateTime.now());
    String year = current.split("/")[2];
    year = (int.parse(year) + 543).toString();
    String finalAnswer =
        current.split("/")[0] + "/" + current.split("/")[1] + "/" + year;
    return finalAnswer;
  }

  @override
  void onInit() {
    super.onInit();
    currentDate = formatYearThai();
    fetchTime();
  }
}
