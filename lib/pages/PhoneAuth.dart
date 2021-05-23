import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class PhoneAuth extends StatefulWidget {
  PhoneAuth({Key key}) : super(key: key);

  @override
  _PhoneAuthState createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController _phneController = TextEditingController();
  // Timer _timer;
  int _start = 30;
  String buttonName = "Send";
  bool wait = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text(
          "SignUp",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              textItem("Enter your phone Number", _phneController, false),
              SizedBox(
                height: 25,
              ),
              subdivider(
                "Enter your 6 digit otp ",
              ),
              SizedBox(
                height: 30,
              ),
              otp(),
              SizedBox(
                height: 40,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Send OTP again in ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.yellowAccent,
                    ),
                  ),
                  TextSpan(
                    text: " 00:$_start ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  TextSpan(
                    text: "sec ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.yellowAccent,
                    ),
                  ),
                ]),
              ),
              Expanded(child: Container()),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 60,
                decoration: BoxDecoration(
                  color: Color(0xffff9601),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Let's Go",
                    style: TextStyle(
                      color: Color(0xfffbe2ae),
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget subdivider(String text) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              margin: EdgeInsets.symmetric(horizontal: 12),
              color: Colors.grey,
            ),
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Expanded(
            child: Container(
              height: 1,
              margin: EdgeInsets.symmetric(horizontal: 12),
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget otp() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width - 34,
      fieldWidth: 58,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Color(0xff1d1d1d),
        borderColor: Colors.white,
      ),
      style: TextStyle(fontSize: 17, color: Colors.white),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: " + pin);
      },
    );
  }

  Widget textItem(
      String labeltext, TextEditingController controller, bool obscureText) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        color: Color(0xff1d1d1d),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 60,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: labeltext,
          hintStyle: TextStyle(
            fontSize: 17,
            color: Colors.white54,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 19, horizontal: 8),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
            child: Text(
              "(+91)",
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ),
          suffixIcon: InkWell(
            onTap: wait
                ? null
                : () {
                    setState(() {
                      _start = 30;
                      buttonName = "Resnd";
                      wait = true;
                    });
                    startTimer();
                  },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                buttonName,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: wait ? Colors.grey : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    Timer _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            wait = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
}
