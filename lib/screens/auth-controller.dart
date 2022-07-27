import 'package:barber/config/api-endpoint.dart';
import 'package:barber/config/routes.dart';
import 'package:barber/models/user-data.dart';
import 'package:barber/network/request-exception.dart';
import 'package:barber/network/request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final isLogin = false.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(3000.milliseconds, () {
      isLogin.value = FirebaseAuth.instance.currentUser == null ? false : true;
    });
    ever(isLogin, (bool val) async {
      if (val) {
        final userMap = await fetchUser();
        print(userMap);
        if (userMap != null) {
          final userData = Get.put(UserData.fromJson(userMap), permanent: true);
          if (userData.position == "1") {
            print("คนใช้ทั่วไป");
            Get.offAllNamed(Routes.homeUser);
          } else if (userData.position == "2") {
            print("ช่าง");
            Get.offAllNamed(Routes.homeTechnician);
          }
        } else {
          Get.offAllNamed(Routes.authRoute);
        }
      } else {
        Get.offAllNamed(Routes.authRoute);
      }
    });
  }

  Future<Map<String, dynamic>?> fetchUser() async {
    try {
      final userFirebase = FirebaseAuth.instance.currentUser!;
      final res = await getRequest(
          path: "${APIEndpoint.hostName}/user/${userFirebase.uid}");
      return res;
    } on RequestException catch (_) {
      return null;
    }
  }

  Future<void> logout() async {
    Get.delete<UserData>(force: true);
    FirebaseAuth.instance.signOut();
    isLogin.value = false;
  }
}
