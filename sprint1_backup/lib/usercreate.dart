import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sprint1_backup/color.dart';
import 'package:sprint1_backup/userlogin.dart';
import 'package:http/http.dart'as http;

class UserCreate extends StatefulWidget {
  const UserCreate({super.key});

  @override
  State<UserCreate> createState() => _UserCreateState();
}

class _UserCreateState extends State<UserCreate> {
  final ctlName = TextEditingController();
  final ctlPhonu = TextEditingController();
  final ctlEmail = TextEditingController();
  final ctlDOB = TextEditingController();
  final ctlGender = TextEditingController();
  final ctlPassword = TextEditingController();
  final ctlConPass = TextEditingController();
  final _otpControllers = List.generate(6, (index) => TextEditingController());
  final _otpFocusNodes = List.generate(6, (index) => FocusNode());
  final bmc = GlobalKey<FormState>();
  bool signIsPasswordVisible = false;
  bool signIsPasswordVisible1 = false;
  bool isPhoneVerified = false;




  String? selectedGender;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        ctlDOB.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  void _showOtpBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: EdgeInsets.all(16.0),
            height: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Enter OTP',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 20),
                Text(
                  'An OTP has been sent to ${ctlPhonu.text}. Please enter it below:',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: 45,
                        height: 60,
                        child: TextFormField(
                          controller: _otpControllers[index],
                          focusNode: _otpFocusNodes[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 24),
                          obscureText: true,
                          obscuringCharacter: '●',
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            // Limits input to 1 character
                            FilteringTextInputFormatter.digitsOnly,
                            // Allows only digits
                          ],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[300],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.length == 1 && index < 5) {
                              _otpFocusNodes[index + 1]
                                  .requestFocus(); // Move to the next field
                            } else if (value.isEmpty && index > 0) {
                              _otpFocusNodes[index - 1]
                                  .requestFocus(); // Move back to the previous field
                            }
                          },
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String otp = _otpControllers.map((controller) => controller.text).join();
                    if (otp.length == 6) {
                      // Simulate OTP verification
                      setState(() {
                        isPhoneVerified = true;
                      });
                      Navigator.pop(context); // Close the bottom sheet
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please enter a 6-digit OTP")),
                      );
                    }

                  },
                  child: Text('Verify OTP'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  var sample = {};
  String name="";
  String email="";
  String phoneno="";
  String gender="";
  String password="";
  createuser()async{
    print("ji");

   setState(() {
     name=ctlName.text;
     email=ctlEmail.text;
     phoneno=ctlPhonu.text;
     gender=selectedGender!;
     password=ctlPassword.text;
   });
    print(name);
    print(email);
    print(phoneno);
    print(gender);
    print(password);

    final response = await http.post(Uri.parse("http://92.205.109.210:8028/user/signup"),
        headers: {
          "content-type" : "application/json"
        },
        body: json.encode(
            {
              "user_name":name,
              "e_mail":email,
                "phno":phoneno,
                "dob":"2000-02-10",
                "gender":gender,
                "password":password,
                "age":23
            }

    ));
    print(response.statusCode);
    if(response.statusCode==200||response.statusCode==201) {
      setState(() {
        sample = jsonDecode(response.body);
        print(sample);
       if(bmc.currentState!.validate()){
         Navigator.push(
           context,
           MaterialPageRoute(
               builder: (context) => userlogin()),
         );
       }
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bac,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context); // Handle back button press
            },
          ),
          backgroundColor: bac,
          title: Text("CREATE YOUR ACCOUNT",
              style: TextStyle(color: Colors.white)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.poll, color: Colors.white, size: 40),
            )
          ],
        ),
        body: Column(
          children: [
            Form(
              key: bmc,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "PERSONAL DETAILS",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                print("abc");
                                createuser();
                              },
                              child: Text("SAVE",
                                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
                            ),
                          ],
                        ),
                      ),
                      //SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(5.5),
                        child: TextFormField(
                          validator: (input) {
                            if (!RegExp(
                            r"^[A-Za-z]{3,}(?:[-'][A-Za-z]+)*$"


                            )
                                .hasMatch(input!)) {
                              return 'Please enter a valid name';
                            }
                            return null;
                          },
                          controller: ctlName,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Name",
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      //SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(5.5),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                validator: (input) {
                                  if (!RegExp(
                                          r"^(\+?\d{1,4}[\s-])?(?!0+\s+,?$)\d{10}\s*,?$")
                                      .hasMatch(input!)) {
                                    return "Please enter a valid mobile number";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                controller: ctlPhonu,
                                enabled: !isPhoneVerified,

                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  prefix: Text("+91"),
                                  labelText: "Phone number",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            TextButton(
                              onPressed: () {

                                // Trigger the OTP bottom sheet
                                 _showOtpBottomSheet(context);
                              },
                              child: Text(  isPhoneVerified ? "Verified" : "Verify",
                                style: TextStyle(
                                  color: isPhoneVerified ? Colors.green : Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                            ),
                            )
                          ],
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () {
                      //     // Trigger the OTP bottom sheet
                      //     _showOtpBottomSheet(context);
                      //   },
                      //   child: Text("Verify Phone Number"),
                      // ),
                      // SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(5.5),
                        child: TextFormField(
                          controller: ctlEmail,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (input) {
                            if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(input!)) {
                              return "Please enter a valid email address";
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Email ID",
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      // SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(5.5),
                        child: TextFormField(
                          controller: ctlDOB,
                          readOnly: true,
                          onTap: () => _selectDate(context),
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "DOB",
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Select your date of birth",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please select your date of birth";
                            }
                            return null;
                          },
                        ),
                      ),
                      // SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(5.5),
                        child: DropdownButtonFormField<String>(
                          value: selectedGender,
                          hint: Text("Select Gender"),
                          items: ['Male', 'Female', 'Other'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: (value) =>
                              value == null ? 'Please select a gender' : null,
                        ),
                      ),

                      ///mfg
                      //SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(5.5),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.text,
                          controller: ctlPassword,
                          obscureText: !signIsPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                signIsPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  signIsPasswordVisible = !signIsPasswordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (input) {
                            if (!RegExp(r"^\d{6}$").hasMatch(input!)) {
                              return "It should be at 6 characters ";
                            }
                            return null;
                          },
                        ),
                      ),
                      // SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(5.5),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: ctlConPass,
                            obscureText: !signIsPasswordVisible1,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Confirm your password",
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  signIsPasswordVisible1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    signIsPasswordVisible1 =
                                        !signIsPasswordVisible1;
                                  });
                                },
                              ),
                            ),
                            validator: (input) {
                              if (!RegExp(r"^\d{6}$").hasMatch(input!)) {
                                return "It should be at 6 characters";
                              }
                              if (ctlPassword.text != ctlConPass.text) {
                                return "Password must be same as above";
                              }
                            }),
                      ),
                      // SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Have an account already?",style: TextStyle(color: Colors.black,fontSize: 17),),
                          TextButton(onPressed: (){
                            // createuser();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>userlogin()));
                          }, child: Text("Log in",style: TextStyle(color: Colors.blue,fontSize: 17,fontWeight: FontWeight.bold)))
                        ],
                      ),
                      // SizedBox(
                      //   height: 20,
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
