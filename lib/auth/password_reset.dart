import 'package:flutter/material.dart';
import 'package:nile_care/auth/pages/otp_entry.dart';
import 'package:nile_care/auth/pages/phone_input.dart';
import 'package:nile_care/auth/pages/recovery_password.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  int currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    final List _pages = [
    PhoneInput(nextPage: (){
      setState(() {
        currentIndex = 1;
      });
    }),
    OTPEntry(),
    RecoveryPassword(),
  ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:   SafeArea(child: _pages[currentIndex]),
    );
  }
}
