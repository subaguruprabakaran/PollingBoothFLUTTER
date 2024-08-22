import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pollibg_booth/sprint1/color.dart';
import 'package:pollibg_booth/sprint1/sample.dart';

class usercreate extends StatefulWidget {
  const usercreate({super.key});

  @override
  State<usercreate> createState() => _usercreateState();
}

class _usercreateState extends State<usercreate> {
  bool keypad = true;
  final ctlName = TextEditingController();
  final ctlPhonu = TextEditingController();
  final ctlEmail = TextEditingController();
  final ctlDOB = TextEditingController();
  final ctlGender = TextEditingController();
  final ctlPassword = TextEditingController();
  final ctlconpass = TextEditingController();
  final bmc = GlobalKey<FormState>();
  bool signIsPasswordVisible = false;

  String? selectedGender; // Declare the selectedGender variable here

  @override
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Current date as initial date
      firstDate: DateTime(1900), // Earliest allowed date
      lastDate: DateTime.now(), // Latest allowed date
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        ctlDOB.text =
            DateFormat('dd/MM/yyyy').format(picked); // Formatting date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bac,
        body: SingleChildScrollView(
          child: GestureDetector(
            onDoubleTap: (){
              setState(() {
                keypad = false;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.poll,
                    color: Colors.white,
                    size: 70,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Create your account for create and voting polls!",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Card(
                      color: Colors.white,
                      child: Form(
                        key: bmc,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                //width: 280,
                                child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (input) {
                                    if (!RegExp(r"^[A-Za-z]{4,}(?:\s[A-Za-z]+)?$")
                                        .hasMatch(input!)) {
                                      return 'Give a validate name';
                                    }
                                  },
                                  controller: ctlName,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    label: Text(
                                      "Name",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    hintText: "Name",
                                    fillColor: Colors.white30,
                                    hintStyle:
                                        TextStyle(fontSize: 20.0, color: hin),
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    errorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    // hintStyle: TextStyle(fontSize: 20.0,olor: Colors.black),
                                  ),
                                ),
                              ),
                            ),

                            ///name

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(

                                  inputFormatters: [
                                  LengthLimitingTextInputFormatter(10), // Limits to 10 characters
                                FilteringTextInputFormatter.digitsOnly],// Allows only d,
                                keyboardType: TextInputType.number,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (input) {
                                  if (!RegExp(
                                          r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
                                      .hasMatch(input!)) {
                                    return " Give a valid mobile number";
                                  }
                                },
                                controller: ctlPhonu,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  fillColor: Colors.white30,
                                  label: Text(
                                    "Phone number",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  hintText: "Phone number",
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red)),
                                  hintStyle:
                                      TextStyle(fontSize: 20.0, color: hin),
                                ),
                              ),
                            ),

                            ///phone number

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: ctlEmail,
                                validator: (input) {
                                  if (!RegExp(
                                          r"^[a-zA-Z0.9]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(input!)) {
                                    return "Give a valid mail ID";
                                  }
                                },
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  label: Text(
                                    "e-mail ID",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  hintText: "e-mail ID",
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red)),
                                  hintStyle:
                                      TextStyle(fontSize: 20.0, color: hin),
                                ),
                              ),
                            ),

                            ///email

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: ctlDOB,
                                readOnly: false,
                                // Prevents keyboard from appearing
                                onTap: () => _selectDate(context),
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  label: Text("DOB",
                                      style: TextStyle(color: Colors.black)),
                                  hintText: "Select your date of birth",
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red)),
                                  hintStyle:
                                      TextStyle(fontSize: 20.0, color: hin),
                                ),
                                validator: (value) => value == null
                                    ? 'Please select a Date of Birth'
                                    : null,
                              ),
                            ),

                            ///dob

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text("", style: TextStyle(color: hin, fontSize: 20)),
                                  DropdownButtonFormField<String>(
                                    //style: TextStyle(color: Colors.black),
                                    value: selectedGender,
                                    hint: Text("Select Gender",
                                        style: TextStyle(color: Colors.black)),
                                    items: ['Male', 'Female', 'Other']
                                        .map((String value) {
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
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      errorBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                    ),
                                    validator: (value) => value == null
                                        ? 'Please select a gender'
                                        : null,
                                  ),
                                ],
                              ),
                            ),

                            ///gender

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.text,
                                controller: ctlPassword,
                                obscureText: !signIsPasswordVisible,
                                //This will obscure text dynamically
                                decoration: InputDecoration(
                                  filled: false,
                                  hintStyle: TextStyle(fontSize: 20,color: hin),
                                  // fillColor: Colors.white30,
                                  label: Text("Password",style: TextStyle(color: Colors.black),),
                                  hintText: 'Enter your password',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red)),

                                  // Here is key idea
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      signIsPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        signIsPasswordVisible =
                                            !signIsPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                validator: (input) {
                                  if (!RegExp(r"^.{6}$").hasMatch(input!)) {
                                    return "Please enter a valid Password!";
                                  }
                                },
                              ),
                            ),

                            /// password
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: ctlconpass,
                                  obscureText: true,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    label: Text(
                                      "Confirm Password",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    hintText: "Confirm Password",
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    errorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    hintStyle:
                                        TextStyle(fontSize: 20.0, color: hin),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        signIsPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        setState(() {
                                          signIsPasswordVisible =
                                              !signIsPasswordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                  validator: (input) {
                                    if (!RegExp(r"^.{6}$").hasMatch(input!)) {
                                      return "Please enter your Password!";
                                    }
                                    if (ctlPassword.text != ctlconpass.text) {
                                      return "Password must be same as above";
                                    }
                                  }),
                            ),

                            ///confirm password
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        backgroundColor: back),
                                    onPressed: () {
                                      if (bmc.currentState!.validate()) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => sam()));
                                      }
                                    },
                                    child: Text(
                                      "Sign up",
                                      style: TextStyle(color: Colors.black),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
