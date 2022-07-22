import 'package:barber/config/routes.dart';
import 'package:barber/models/user-data.dart';
import 'package:barber/screens/Register/register-controller.dart';
import 'package:barber/utils/background-curves.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.orange,
            size: 30,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: BackGroudCurve(
          child: Container(
            width: Get.width,
            child: SafeArea(
              child: SingleChildScrollView(
                child: GetBuilder<RegisterController>(
                  init: RegisterController(),
                  builder: (controller) => Column(
                    children: [
                      Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          controller.onPickImage();
                        },
                        child: Container(
                          width: 200,
                          height: 200,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 3,
                              color: Colors.orange,
                            ),
                          ),
                          child: controller.file != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.file(
                                    controller.file!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 40,
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        width: Get.width * 0.7,
                        child: Column(
                          children: [
                            getTextField(
                              hintText: 'Email',
                              icon: Icons.email,
                              controller: controller.emailController,
                            ),
                            SizedBox(height: 20),
                            getTextField(
                              hintText: 'Password',
                              icon: Icons.lock,
                              controller: controller.passwordController,
                              isPassword: true,
                            ),
                            SizedBox(height: 20),
                            getTextField(
                              hintText: 'Confrim password',
                              icon: Icons.lock,
                              controller: controller.confirmController,
                              isPassword: true,
                            ),
                            SizedBox(height: 20),
                            getTextField(
                              hintText: 'Full name',
                              controller: controller.fullNameController,
                              icon: Icons.person,
                            ),
                            SizedBox(height: 20),
                            getTextField(
                              hintText: 'Number phone',
                              controller: controller.phoneController,
                              icon: Icons.phone,
                            ),
                            SizedBox(height: 30),
                            Container(
                              width: Get.width * 0.5,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(Routes.otpScreen);
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                child: Text(
                                  'ยืนยันการสมัคร',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget getTextField({hintText, icon, controller, isPassword = false}) {
  return Container(
    height: 35,
    child: TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Icon(
            icon,
            size: 25,
            color: Colors.grey,
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    ),
  );
}
