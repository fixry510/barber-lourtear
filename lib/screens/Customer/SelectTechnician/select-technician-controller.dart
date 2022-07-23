import 'package:barber/config/api-endpoint.dart';
import 'package:barber/models/user-data.dart';
import 'package:barber/network/request-exception.dart';
import 'package:barber/network/request.dart';
import 'package:get/get.dart';

class SelectTechnicianController extends GetxController {
  final isLoad = true.obs;

  List<UserData> technicians = [];

  Future<void> fetchTechnician() async {
    try {
      final res = await getRequest(
        path: "${APIEndpoint.hostName}/technicians",
      );
      res.forEach((data) {
        technicians.add(UserData.fromJson(data));
      });
    } on RequestException catch (_) {
    } finally {
      isLoad.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchTechnician();
  }
}
