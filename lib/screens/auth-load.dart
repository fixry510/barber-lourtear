import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AuthLoadScreen extends StatelessWidget {
  const AuthLoadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: Center(
        child: TweenAnimationBuilder(
          duration: Duration(milliseconds: 1500),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (ctx, double val, child) {
            return Opacity(
              opacity: val,
              child: child,
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 250,
                height: 250,
              ),
              SizedBox(height: 30),
              Text(
                "Lour Tear Barber...",
                style: GoogleFonts.caveat(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
