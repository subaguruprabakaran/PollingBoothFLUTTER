import 'package:flutter/material.dart';
import 'color1.dart';
import 'color10.dart';
import 'otp.dart';
import 'userdraw.dart';

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
  TextEditingController ctlforPassword = TextEditingController();

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.poll,color: Colors.white,size: 50,),
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
                                hintText: "Phone number",
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(fontSize: 20.0, color: hin),
                              ),
                            ),
                          ),///phone number
                          Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                        signIsPasswordVisible1
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
                                    onFieldSubmitted: (value) {
                                      _validateAndToggleKeyboard();
                                    }
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
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      height: 48,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Color(0xff06b4d6)
                      ),
                       child: TextButton(onPressed: (){

                         Navigator.push(context, MaterialPageRoute(builder: (context)=>userdraw(question: "", choices: [], selectedDate:DateTime.now() , selectedTime: TimeOfDay.now())));

                       }, child: Text("login ",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),))
                    ),
                  ),
                ),
              ],
            ),

            Column(

              children: [
                Divider(
                  color: Colors.white,
                ),
                TextButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>userotp()));

                }, child: Text("Forgot password?",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),))
              ],
            )
          ],
        ),
      ),
    );
  }
}





