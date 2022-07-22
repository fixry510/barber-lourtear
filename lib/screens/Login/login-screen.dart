import 'package:barber/config/routes.dart';
import 'package:barber/screens/Login/login-controller.dart';
import 'package:barber/utils/background-curves.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: BackGroudCurve(
          child: Container(
            width: Get.width,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Image.asset(
                      "assets/images/text-logo.png",
                      width: 200,
                    ),
                    SizedBox(height: 50),
                    Hero(
                      tag: 'logo',
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: 230,
                        height: 230,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: Get.width * 0.7,
                      child: Column(
                        children: [
                          getTextField(
                            hintText: 'Email',
                            icon: Icons.person,
                            controller: controller.emailController,
                          ),
                          SizedBox(height: 20),
                          getTextField(
                            hintText: 'Password',
                            icon: Icons.lock,
                            isPassword: true,
                            controller: controller.passwordController,
                          ),
                          SizedBox(height: 30),
                          Container(
                            width: Get.width * 0.5,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.onLogin();
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.registerScreen);
                            },
                            child: Text(
                              "Rigister",
                              style: TextStyle(
                                fontSize: 14,
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
        prefixIcon: Icon(
          icon,
          size: 25,
          color: Colors.grey,
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
