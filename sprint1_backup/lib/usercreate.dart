import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sprint1_backup/color.dart';
import 'package:sprint1_backup/userlogin.dart';

class UserCreate extends StatefulWidget {
  const UserCreate({super.key});

  @override
  State<UserCreate> createState() => _UserCreateState();
}

class _UserCreateState extends State<UserCreate> {
  final ctlName = TextEditingController();
  final ctlPhonu = TextEditingController(text: "+91 ");
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
                    String otp = _otpControllers
                        .map((controller) => controller.text)
                        .join();
                    if (otp.length == 6) {
                      // Handle OTP verification
                      Navigator.pop(context); // Close the bottom sheet
                    } else {
                      // Show a warning message if OTP is not complete
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
        body: Form(
          key: bmc,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "PERSONAL DETAILS",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              if (bmc.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Form is valid")),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => userlogin()),
                                );
                              }
                            },
                            child: Text("SAVE",
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (input) {
                          if (!RegExp(
                                  r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z])$")
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
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              validator: (input) {
                                if (!RegExp(
                                        r"[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$")
                                    .hasMatch(input!)) {
                                  return "Please enter a valid mobile number";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              controller: ctlPhonu,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
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
                            child: Text("Verify "),
                          ),
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
                      padding: const EdgeInsets.all(8.0),
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
                      padding: const EdgeInsets.all(8.0),
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
                      padding: const EdgeInsets.all(8.0),
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
                      padding: const EdgeInsets.all(8.0),
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
                          if (!RegExp(r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{6,16}$").hasMatch(input!)) {
                            return "It should be at least 6 characters with a special character";
                          }
                          return null;
                        },
                      ),
                    ),
                    // SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                            if (!RegExp(r"^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{6,16}$").hasMatch(input!)) {
                              return "It should be at least 6 characters with a special character";
                            }
                            if (ctlPassword.text != ctlConPass.text) {
                              return "Password must be same as above";
                            }
                          }),
                    ),
                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Have an account already?",style: TextStyle(color: Colors.black,fontSize: 17),),
                        TextButton(onPressed: (){
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
        ),
      ),
    );
  }
}
