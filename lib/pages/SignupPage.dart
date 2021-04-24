import 'package:firebase_app_web/Custom/ButtonItem.dart';
import 'package:firebase_app_web/Custom/ColoredButton.dart';
import 'package:firebase_app_web/Custom/TextItem.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // ClipPath(
            //   child: Container(
            //     color: Colors.black.withOpacity(0.8),
            //   ),
            //   clipper: GetClipper(),
            // ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonItem(
                    text: "Continue with Google",
                    onClick: () {},
                    imagePath: "assets/google.svg",
                    size: 25,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ButtonItem(
                    text: "Continue with Mobile",
                    onClick: () {},
                    imagePath: "assets/phone.svg",
                    size: 30,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "or",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextItem(
                    labelText: "Email",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextItem(
                    labelText: "Password",
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ColoredButton(
                    text: "Sign Up",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(text: "Don't have an account?"),
                        TextSpan(
                          text: "  Create Account",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width + 125.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
