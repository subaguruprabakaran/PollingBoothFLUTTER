import 'package:flutter/material.dart';
import 'package:untitled3/test%20gtpoll/usercreat1.dart';
import 'package:untitled3/test%20gtpoll/userlogin1.dart';
import 'package:image_picker_ios/image_picker_ios.dart';

import 'color1.dart';
import 'color10.dart';

class usersign extends StatefulWidget {
  const usersign({super.key});

  @override
  State<usersign> createState() => _usersignState();
}

class _usersignState extends State<usersign> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bac,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Icon(Icons.poll,color: Colors.white,size: 50,)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Tommorow's innovations start with today's vote!...",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w800),),
            ),
            // SizedBox(
            //   height: 100,
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white),onPressed: (){}, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/google.png"))
                        ),
                      ),
                      Text("Continue with Google",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                    ],
                  )),
                ),
                Text("or",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserCreat()));
                  }, child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        //   width: 50,
                        decoration: BoxDecoration(
                          //image: DecorationImage(image: NetworkImage("data:image/png;base64,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"))
                        ),
                      ),
                      Text("Create Account",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                    ],
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("By signing up, you agree to our Terms, Privacy Policy, and Cookies use.",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have an account already?",style: TextStyle(color: Colors.white,fontSize: 17),),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>userlogin()));
                      }, child: Text("Log in",style: TextStyle(color: Colors.blue[300] ,fontSize: 17,fontWeight: FontWeight.bold)))
                    ],
                  ),

                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),//,
            // /secondary column wid two buttons and more
          ],
        ),
      ),
    );
  }
}