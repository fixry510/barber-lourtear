import 'dart:async';
import 'dart:io';

import 'package:barber/network/request-exception.dart';
import 'package:dio/dio.dart';

Future<dynamic> fromDataRequest({
  required String path,
  FormData? data,
}) async {
  var dio = Dio();
  try {
    final res = await dio.post(
      path,
      data: data,
    );

    return res.data;
  } on DioError catch (e) {
    print("error request : $path");
    errorFilter(e);
  }
}

Future<dynamic> postRequest({
  required String path,
  Map? data,
}) async {
  var dio = Dio();
  try {
    final res = await dio.post(
      path,
      data: data,
    );
    return res.data;
  } on DioError catch (e) {
    print("error request : $path");
    print(e.toString());
    errorFilter(e);
  }
}

Future<dynamic> getRequest({
  required String path,
  Map<String, dynamic>? queryParameters,
}) async {
  var dio = Dio();
  try {
    final res = await dio.get(
      path,
      queryParameters: queryParameters,
    );
    return res.data;
  } on DioError catch (e) {
    print(e.type);
    print("error request : $path");
    errorFilter(e);
  }
}

Future<dynamic> deleteRequest({
  required String path,
  Map<String, dynamic>? queryParameters,
}) async {
  var dio = Dio();
  try {
    final res = await dio.delete(
      path,
      queryParameters: queryParameters,
    );
    return res.data;
  } on DioError catch (e) {
    print(e.type);
    print("error request : $path");
    errorFilter(e);
  }
}

Future<dynamic> putRequest({
  required String path,
  Map? data,
}) async {
  var dio = Dio();
  try {
    final res = await dio.put(
      path,
      data: data,
    );
    return res.data;
  } on DioError catch (e) {
    print("error request : $path");
    errorFilter(e);
  }
}

errorFilter(DioError e) {
  if (e.error is SocketException) {
    throw RequestException(
      statusCode: 503,
      data: e.response?.data,
      message: "ไม่สามารถเชื่อมต่ออินเตอร์เน็ตได้",
      subMessage: "กรุณาเชื่อมต่ออินเตอร์เน็ตแล้วลองอีกครั้ง",
    );
  }
  if (e.response != null) {
    if (e.response!.statusCode! >= 500) {
      throw RequestException(
        statusCode: e.response!.statusCode!,
        data: e.response?.data,
        message: "ไม่สามารถเชื่อมต่อเซิฟเวอร์ได้",
        subMessage: "ไม่สามารถเชื่อมต่อเซิฟเวอร์ได้กรุณาลองใหม่อีกครั้ง",
      );
    } else {
      throw RequestException(
        statusCode: e.response!.statusCode!,
        data: e.response?.data,
        message: "เกิดข้อผิดพลาด",
        subMessage: "เกิดข้อผิดพลาดกรุณาลองใหม่อีกครั้ง",
      );
    }
  } else {
    print(e.message);
    throw RequestException(
      statusCode: 0,
      data: null,
      message: "มีข้อผิดพลาดเกิดขึ้น",
      subMessage: "เกิดข้อผิดพลาดกรุณาลองใหม่อีกครั้ง",
    );
  }
}

// class Test {
//   final nameController = TextEditingController();
//   final lastnameController = TextEditingController();
//   final phoneController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//   final addressController = TextEditingController();

  // Future<void> onRegister() async {
  //   final auth = FirebaseAuth.instance;
  //   auth
  //       .createUserWithEmailAndPassword(
  //           email: emailController.text, password: passwordController.text)
  //       .then((value) async {
  //     var dio = Dio();      
  //     final res = await dio.post(
  //       "${API_URL.hostName}/register-user",
  //       data: {},
  //     );

  //   });
  // }
// }
