import 'package:barber/screens/Customer/Home/home-user.dart';
import 'package:barber/screens/Login/login-screen.dart';
import 'package:barber/screens/OTP/otp-screen.dart';
import 'package:barber/screens/Register/register-screen.dart';
import 'package:barber/screens/Technician/Home/home-technician.dart';
import 'package:barber/screens/auth-load.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/route_manager.dart';

class Routes {
  Routes._();
  static const authRoute = "/login-screen";
  static const initalRoute = authRoute;
  static const registerScreen = "/register-screen";
  static const otpScreen = "/otp-screen";
  static const authLoad = "/auth-load";

  static const homeUser = "/home-user";

  static const homeTechnician = "/home-technician";

  static List<GetPage> allRoute() {
    return [
      GetPage(name: authRoute, page: () => LoginScreen()),
      GetPage(name: registerScreen, page: () => RegisterScreen()),
      GetPage(name: otpScreen, page: () => OTPScreen()),
      GetPage(
        name: authLoad,
        page: () => AuthLoadScreen(),
        transition: Transition.noTransition,
      ),
      //
      GetPage(
        name: homeUser,
        page: () => HomeUser(),
        transition: Transition.noTransition,
      ),
      GetPage(
        name: homeTechnician,
        page: () => HomeTechnician(),
        transition: Transition.noTransition,
      ),
    ];
  }
}
