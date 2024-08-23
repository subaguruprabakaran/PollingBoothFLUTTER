import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sprint1_backup/color.dart';
import 'package:sprint1_backup/userlogin.dart';

class userotp2 extends StatefulWidget {
  const userotp2({super.key});

  @override
  State<userotp2> createState() => _userotp2State();
}

class _userotp2State extends State<userotp2> {
  final ctlPassword = TextEditingController();
  final ctlconpass = TextEditingController();
  bool signIsPasswordVisible = false;
  bool signIsPasswordVisible1 = false;
  final bmc = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
            onPressed: () {
              Navigator.pop(context); // Handle back button press
            },
          ),
          backgroundColor: bac,
        ),
        backgroundColor: bac,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.poll,color: Colors.white,size: 50,),
            ),
            // SizedBox(height: 20,),
            Text("Create New Password",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 25),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("This password must be different from the previous password",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 25),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                child: Form(
                  key: bmc,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            // inputFormatters: [
                            //   LengthLimitingTextInputFormatter(10), // Limits to 10 characters
                            //   FilteringTextInputFormatter.digitsOnly, // Allows only digits
                            // ],
                            controller: ctlPassword,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            obscureText: !signIsPasswordVisible1,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  signIsPasswordVisible1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    signIsPasswordVisible1 = !signIsPasswordVisible1;
                                  });
                                },
                              ),
                              label: Text("New  Password",style: TextStyle(color: Colors.black),),
                              hintText: "New Password",
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),

                            ),
                            validator: (input)
                            {
                              if(!RegExp(r"^\d{6}$").hasMatch(input!) )
                              {
                                return "Please enter your Password!";
                              }
                            }
                        ),
                      ),
                      // SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            // inputFormatters: [
                            //   LengthLimitingTextInputFormatter(10), // Limits to 10 characters
                            //   FilteringTextInputFormatter.singleLineFormatter, // Allows only digits
                            // ],
                            controller: ctlconpass,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            obscureText: !signIsPasswordVisible,

                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
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
                                    signIsPasswordVisible = !signIsPasswordVisible;
                                  });
                                },
                              ),
                              label: Text("Confirm Password",style: TextStyle(color: Colors.black),),
                              hintText: "Confirm Password",
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),

                            ),
                            validator: (input)
                            {
                              if(!RegExp(r"^\d{6}$").hasMatch(input!) )
                              {
                                return "Please enter your Password!";
                              }
                              if(ctlPassword.text!=ctlconpass.text){
                                return "Password must be same as above";
                              }
                            }
                        ),
                      ),///con
                      // SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: sinupbutton
                              ),
                              onPressed: (){
                                setState(() {
                                  if(bmc.currentState!.validate())

                                  {
                                    SnackBar(content: Text("enter the valid values"),);
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>userlogin()));

                                  }
                                });

                              }, child: Text("SUBMIT",style: TextStyle(color: Colors.black),)),
                        ),
                      ),
                      // SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}