import 'package:flutter/material.dart';
import 'package:sprint1_backup/color.dart';
import 'package:sprint1_backup/mai.dart';
import 'package:sprint1_backup/userotp.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

// import 'package:qwe/pol/color.dart';
// import 'package:qwe/pol/log.dart';

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
  // TextEditingController ctlforPassword = TextEditingController();

  final bmc = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();///keybord terger
  final FocusNode _focusNode = FocusNode();///key bord terger
  bool signIsPasswordVisible = false;
  bool signIsPasswordVisible1 = false;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }///key
  void _validateAndToggleKeyboard() {
    if (_formKey.currentState!.validate()) {
      // Hide the keyboard if the validation passes
      FocusScope.of(context).unfocus();
    } else {
      // Keep the keyboard open if validation fails
      FocusScope.of(context).requestFocus(_focusNode);
    }
  }///key
  var sample ={};
  loginuser()async{
    final response = await http.post(Uri.parse("http://92.205.109.210:8028/user/login"),
      headers: {
      "content-type" : "application/json"
      },
      body: jsonEncode({
        "phno":ctlPhonu.text,
        "password":ctlPassword.text
        })
    );
    print(response.statusCode);
    if(response.statusCode==200||response.statusCode==201){
      setState(() {
        sample = jsonDecode(response.body);
        print(sample);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>dym()));



      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: bac,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
              onPressed: () {
                Navigator.pop(context); // Handle back button press
              },
            )
        ),
        backgroundColor: bac,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.poll,color: Colors.white,size: 50,),///icon
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("To get started, first enter your phone number",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 25,color: Colors.white),),
            ),
            Form(
              key: bmc,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 20,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          focusNode: _focusNode,
                          validator: (input)

                          {
                            if( !RegExp( r"^(\+?\d{1,4}[\s-])?(?!0+\s+,?$)\d{10}\s*,?$").hasMatch(input!))
                            {
                              return"  Please Enter a valid phone number";
                            }
                          },
                          controller: ctlPhonu,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            label: Text("Phone number ",style: TextStyle(color: Colors.black),),
                            // hintText: "Phone number",
                            prefix: Text("+91",style: TextStyle(fontSize: 16),),
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(fontSize: 20.0, color: hin),
                          ),
                        ),
                      ),///phone number
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          // width: 280,
                            child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: ctlPassword,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                  if(!RegExp(r"^\d{6}$" ).hasMatch(input!) )
                                  {
                                    return "Please enter a valid Password!";
                                  }

                                },
                                onFieldSubmitted: (value) {
                                  _validateAndToggleKeyboard();
                                }
                            )
                        ),
                      ),///password
                      // SizedBox(
                      //   height: 20,
                      // ),
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
                      if(bmc.currentState!.validate()){
                      }
                      loginuser();
                    }, child: Text("Login",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
              ),
            ),
            //
            // Divider(
            //   color: Colors.white,
            // ),
            TextButton(onPressed: (){
              // loginuser();

              Navigator.push(context, MaterialPageRoute(builder: (context)=>userotp()));

            }, child: Text("Forgot password?",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),))
          ],
        ),
      ),
    );
  }
}