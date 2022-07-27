import 'package:barber/screens/Customer/BookingDetail/booking-detail.dart';
import 'package:barber/screens/Customer/HairDetail/hair-detail.dart';
import 'package:barber/screens/Customer/Home/home-user.dart';
import 'package:barber/screens/Customer/Payment/CreditCard/credit-card.dart';
import 'package:barber/screens/Customer/Payment/PaymentSummary/payment-summary.dart';
import 'package:barber/screens/Customer/Payment/PromtPay/promt-pay.dart';
import 'package:barber/screens/Customer/Payment/payment.dart';
import 'package:barber/screens/Customer/SelectTechnician/select-technician.dart';
import 'package:barber/screens/Customer/SelectTechnicianQueue/select-technician-queue.dart';
import 'package:barber/screens/Auth/Login/login-screen.dart';
import 'package:barber/screens/Auth/OTP/otp-screen.dart';
import 'package:barber/screens/Auth/Register/register-screen.dart';
import 'package:barber/screens/Technician/Home/home-technician.dart';
import 'package:barber/screens/auth-load.dart';
import 'package:get/route_manager.dart';

class Routes {
  Routes._();

  static const authLoad = "/auth-load";
  static const authRoute = "/login-screen";
  static const registerScreen = "/register-screen";
  static const otpScreen = "/otp-screen";

  static const homeUser = "/home-user";
  static const hairDetail = "/home-detail";
  static const selectTechnician = "/select-technician";
  static const selectTechnicianQueue = "/select-technician-queue";
  static const bookingDetail = "/booking-detail";
  static const payment = "/payment";
  static const creditCard = "/credit-card";
  static const promtpay = "/promtpay";
  static const paymentSummary = "/payment-summary";

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
      GetPage(name: hairDetail, page: () => HairDetail()),
      GetPage(name: selectTechnician, page: () => SelectTechnician()),
      GetPage(name: selectTechnicianQueue, page: () => SelectTechnicianQueue()),
      GetPage(name: bookingDetail, page: () => BookingDetail()),
      GetPage(name: payment, page: () => Payment()),
      GetPage(name: creditCard, page: () => CreditCard()),
      GetPage(name: promtpay, page: () => PromtPay()),
      GetPage(name: paymentSummary, page: () => PaymentSummary()),
      //
      GetPage(
        name: homeTechnician,
        page: () => HomeTechnician(),
        transition: Transition.noTransition,
      ),
    ];
  }
}
