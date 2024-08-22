import 'package:flutter/material.dart';
import 'package:pollibg_booth/sprint1/color.dart';
import 'package:pollibg_booth/sprint1/userlogin.dart';
class userotp2 extends StatefulWidget {
  const userotp2({super.key});

  @override
  State<userotp2> createState() => _userotp2State();
}

class _userotp2State extends State<userotp2> {
  final ctlPassword = TextEditingController();
  final ctlconpass = TextEditingController();
  bool signIsPasswordVisible = false;
  final bmc = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bac,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.poll,color: Colors.white,size: 70,),
              ),
               SizedBox(height: 50,),
              Text("Create New Password",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 25),),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("This password must be different from the previous password",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 25),),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  color: Colors.white,
                  child: Form(
                    key: bmc,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            //  width: 280,
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                controller: ctlPassword,
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
                                  label: Text("New  Password",style: TextStyle(color: Colors.black),),
                                  hintText: "New Password",
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black
                                      )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black
                                      )
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red
                                    )
                                  ),

                                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
          
                                ),
                                validator: (input)
                                {
                                  if(!RegExp(r"^.{6}$").hasMatch(input!) )
                                  {
                                    return "Please enter your Password!";
                                  }
                                }
                            ),
                          ),
                        ),
                        // SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            //  width: 280,
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                controller: ctlconpass,
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
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black
                                    )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black
                                    )
                                  ),
                                  errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red
                                      )
                                  ),

                                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
          
                                ),
                                validator: (input)
                                {
                                  if(!RegExp(r"^.{6}$").hasMatch(input!) )
                                  {
                                    return "Please enter your Password!";
                                  }
                                  if(ctlPassword.text!=ctlconpass.text){
                                    return "Password must be same as above";
                                  }
                                }
                            ),
                          ),
                        ),///con
                        SizedBox(height: 20,),
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
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),
              )
          
          
            ],
          ),
        ),
      ),
    );
  }
}