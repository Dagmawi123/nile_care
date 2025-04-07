import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  int timer = 60;
  @override
  void initState() {
    super.initState();
    tick();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Verification',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w900,
                fontFamily: 'Comic Sans MS'),
          ),
        ),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 45.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 35),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Colors.blue.withOpacity(0.2),
                        Colors.blue.withOpacity(0.05),
                      ],
                      radius: 0.8,
                    ),
                  ),
                  child: const Center(
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        maxRadius: 35,
                        child: Icon(
                          Icons
                              .mark_email_unread, // Use email icon for verification page
                          size: 26,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Verification Code',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Comic Sans MS',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("We have sent the verification code to",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comic Sans MS',
                    )),
                const Text(
                  "dagmawiasch****@gmail.com",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 100, 98, 98),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                OtpTextField(
                    fieldWidth: 35,
                    fieldHeight: 50,
                    numberOfFields: 6,
                    showFieldAsBox: true,
                    borderColor: const Color(0xFF512DA8)),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: timer > 0
                      ? null
                      : () {
                          setState(() {
                            timer = 60;
                          });
                          tick();
                        },
                  child: timer > 0
                      ? Text("Resend the code in $timer s",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.bold,
                          ))
                      : const Text(
                          "Resend Code",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                            fontFamily: 'Comic Sans MS',
                          ),
                        ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 50,
              left: 10,
              right: 10,
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      "Verify",
                      style: TextStyle(fontFamily: 'Comic Sans MS',
                      fontWeight: FontWeight.bold),
                    )),
              ))
        ]),
      ),
    );
  }

  void tick() {
    Future.delayed(const Duration(seconds: 1), () {
      if (timer > 0) {
        setState(() {
          timer--;
        });
        tick();
      }
    });
  }
}
