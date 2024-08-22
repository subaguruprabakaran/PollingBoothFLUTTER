import 'package:flutter/material.dart';
import 'package:pollibg_booth/sprint1/color.dart';
import 'package:pollibg_booth/sprint1/sample.dart';
import 'package:pollibg_booth/sprint1/userotp.dart';

//import 'package:responsive_framework/responsive_framework.dart';
class userlogin extends StatefulWidget {
  const userlogin({super.key});

  @override
  State<userlogin> createState() => _userloginState();
}
class _userloginState extends State<userlogin> {
  // final ctlName = TextEditingController();
  TextEditingController ctlPhonu = TextEditingController();
  TextEditingController ctlPassword = TextEditingController();
  TextEditingController ctlforPassword = TextEditingController();
  final bmc = GlobalKey<FormState>();
  bool signIsPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bac,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.poll,color: Colors.white,size: 70,),
              ),///icon
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("To get started, first enter your phone",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 25,color: Colors.white),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: bmc,
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (input)
                            {
                              if( !RegExp( r"^(\+?\d{1,4}[\s-])?(?!0+\s+,?$)\d{10}\s*,?$").hasMatch(input!))
                              {
                                return"  Please Enter a valid phone number";
                              }
                            },
                            controller: ctlPhonu,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              label: Text("Phone number ",style: TextStyle(color: Colors.black),),
                              hintText: "Phone number",
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
                              hintStyle: TextStyle(fontSize: 20.0, color: hin),
                            ),
                          ),
                        ),///phone number or username
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            // width: 280,
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                keyboardType: TextInputType.text,
                                controller: ctlPassword,
                                obscureText: !signIsPasswordVisible,//This will obscure text dynamically
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  hintText: 'Enter your password',
                                  border: OutlineInputBorder(),

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
                                        signIsPasswordVisible = !signIsPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                validator: (input)
                                {
                                  if(!RegExp(r"^.{6}$").hasMatch(input!) )
                                  {
                                    return "Please enter a valid Password!";
                                  }
                                },
                              )
                          ),
                        ),///password
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),

                  ),
                ),
              ),///user name and password
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
                            SnackBar(content: Text("Enter the valid values"),);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>sam()));
                          }
                        });

                      }, child: Text("Login",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                ),
              ),
              // Divider(
              //   color: Colors.white,
              // ),
              TextButton(onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>userotp()));

              }, child: Text("Forgot password?",style: TextStyle(color:logbu ),))
            ],
          ),
        ),
      ),
    );
  }
}