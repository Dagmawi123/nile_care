import 'package:flutter/material.dart';
import 'package:nile_care/auth/pages/custom_keypad.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPEntry extends StatefulWidget {
  const OTPEntry({super.key});

  @override
  State<OTPEntry> createState() => _OTPEntryState();
}

class _OTPEntryState extends State<OTPEntry> {
  final TextEditingController controller = TextEditingController();
  final key = GlobalKey<FormState>();
  var timer = 60;
  String $phone = "+251 911 234 567";

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

  @override
  void initState() {
    super.initState();
    tick();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Positioned(
              top: 20,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "OTP",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Comic Sans MS',
                      color: Colors.blue[900],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "Put the OTP number which is sent to your number",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  Text(
                    $phone,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Comic Sans MS',
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  )
                ],
              )),
          Positioned(
              top: 140,
              left: 10,
              right: 10,
              child: Form(
                key: key,
                child: PinCodeTextField(
                  appContext: context,
                  controller: controller,
                  length: 6,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      inactiveColor: Colors.brown),
                  backgroundColor: Colors.white,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                ),
              )),
          Positioned(
            top: 200,
            left: 40,
            right: 40,
            child: GestureDetector(
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
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.bold,
                      ))
                  : const Text(
                      "Didn't get the code? Resend Code",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 11,
                        fontFamily: 'Comic Sans MS',
                      ),
                    ),
            ),
          ),
          Positioned(
              top: 230,
              left: 20,
              right: 20,
              child: CustomKeypad(
                  onKeyTap: (val) {
                    print("u pressed it eko");
                    setState(() {
                      controller.text = controller.text + val;
                      controller.selection = TextSelection.fromPosition(
    TextPosition(offset: controller.text.length),
  );
                    });
                  },
                  onBackspace: () {}))
        ],
      ),
    );
  }
}
