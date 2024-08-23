import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color1.dart';
import 'color10.dart';
import 'otpnextpg.dart';
import 'resiveotp.dart';

class userotp extends StatefulWidget {
  const userotp({super.key});

  @override
  State<userotp> createState() => _userotpState();
}

class _userotpState extends State<userotp> {
  final ctlPhonu = TextEditingController(text: "+91 "); // Pre-fill with country code
  final bmc = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Set cursor after the pre-filled country code
    ctlPhonu.selection = TextSelection.fromPosition(
      TextPosition(offset: ctlPhonu.text.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bac,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Handle back button press
          },
        ),
      ),
      backgroundColor: bac,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.poll, color: Colors.white, size: 50),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Forget Password?",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "We will send you a One-Time Password on this mobile number",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: bmc,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      
                     // height: 70,
                     // color: Colors.white,
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all()

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (input) {
                            if (!RegExp(r"^(\+91\s)?[6-9]\d{9}$").hasMatch(input!)) {
                              return "Please enter a valid phone number";
                            }
                          },
                          controller: ctlPhonu,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            label: Text(
                              "Phone number",
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                            ),
                            hintText: "Phone number",
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle: TextStyle(fontSize: 20.0, color: hin),
                          ),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r"[0-9\s+]")),
                          ],
                        ),
                      ),

                    ),
                  ),
                  // TextFormField(
                  //   validator: (input) {
                  //     if (!RegExp(r"^(\+91\s)?[6-9]\d{9}$").hasMatch(input!)) {
                  //       return "Please enter a valid phone number";
                  //     }
                  //   },
                  //   controller: ctlPhonu,
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   style: TextStyle(color: Colors.black),
                  //   decoration: InputDecoration(
                  //     label: Text(
                  //       "Phone number",
                  //       style: TextStyle(color: Colors.black),
                  //     ),
                  //     hintText: "Phone number",
                  //     border: OutlineInputBorder(),
                  //     fillColor: Colors.white,
                  //     filled: true,
                  //     hintStyle: TextStyle(fontSize: 20.0, color: hin),
                  //   ),
                  //   keyboardType: TextInputType.phone,
                  //   inputFormatters: [
                  //     FilteringTextInputFormatter.allow(RegExp(r"[0-9\s+]")),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (bmc.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => votp()),
                            );
                          }
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Send OTP",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
