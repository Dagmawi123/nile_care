import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneInput extends StatefulWidget {
 final void Function()? nextPage;
  const PhoneInput({super.key,required this.nextPage});

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox.expand(
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
                      "Forgot Password",
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
                      "Please enter your phone number below to receive your OTP number",
                      maxLines: null,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    )
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Positioned(
              top: 100,
              left: 10,
              right: 10,
              child: Container( 
                  height:70, 
                  width: 300,
                  child: IntlPhoneField(
                    initialCountryCode: 'ET',
                    decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder()),
                    onSubmitted: (phone) {},
                  )),
            ),
            Positioned(
                bottom: 50,
                left: 10,
                right: 10,
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                      onPressed: widget.nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // Rounded corners
                        ),
                      ),
                      child: const Text(
                        "Send OTP",
                        style: TextStyle(
                            fontFamily: 'Comic Sans MS',
                            fontWeight: FontWeight.bold),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
