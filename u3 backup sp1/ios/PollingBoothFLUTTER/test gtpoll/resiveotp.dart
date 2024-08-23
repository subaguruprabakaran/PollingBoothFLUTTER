// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../test gtpoll/color1.dart';
// import '../test gtpoll/otpnextpg.dart';
// import 'color10.dart';
//
//
// class votp extends StatefulWidget {
//   const votp({super.key});
//
//   @override
//   State<votp> createState() => _votpState();
// }
//
// class _votpState extends State<votp> {
//   // Create a list of 6 TextEditingControllers
//   final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
//   final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
//
//   @override
//   void dispose() {
//     // Dispose all controllers and focus nodes
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     for (var focusNode in _focusNodes) {
//       focusNode.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: bac,
//         appBar: AppBar(
//           backgroundColor: bac,
//
//               //backgroundColor: bac,
//
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
//                 onPressed: () {
//                   Navigator.pop(context); // Handle back button press
//                 },
//               ),
//
//           title: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Icon(Icons.poll,color: Colors.white,size: 60,),
//           ),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Center(
//             //   child: Icon(Icons.poll, size: 140, color: Colors.white),
//             // ),
//             Text(
//               "Verification",
//               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
//             ),
//             Text(
//               "Enter your OTP code number",
//               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: List.generate(6, (index) {
//                   return SizedBox(
//                     width: 55,
//                     height: 80,
//                     child: TextFormField(
//                       controller: _controllers[index],
//                       focusNode: _focusNodes[index],
//                       keyboardType: TextInputType.number,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.black, fontSize: 20),
//                       obscureText: true, // Displays input as dots
//                       obscuringCharacter: '●', // Custom character for obscuring
//                       inputFormatters: [
//                         LengthLimitingTextInputFormatter(1), // Limits to 1 character
//                         FilteringTextInputFormatter.digitsOnly, // Allows only digits
//                       ],
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       // maxLength: 1,
//                       onChanged: (value) {
//                         if (value.length == 1 && index < 5) {
//                           _focusNodes[index + 1].requestFocus();
//                         } else if (value.isEmpty && index > 0) {
//                           _focusNodes[index - 1].requestFocus();
//                         }
//                       },
//                     ),
//                   );
//                 }),
//               ),
//             ),///textformfiled of otps
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   String otp = _controllers.map((controller) => controller.text).join();
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>userotp2()));
//                   // Handle OTP verification here
//                 },
//                 child: Text(
//                   "Verify",
//                   style: TextStyle(color: logbu),
//                 ),
//               ),
//             ),///verify button
//             Text(
//               "Didn't you receive any code?",
//               style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: Text(
//                 "Resend New Code",
//                 style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../test gtpoll/color1.dart';
import 'otpnextpg.dart';
import 'color10.dart';

class votp extends StatefulWidget {
  const votp({super.key});

  @override
  State<votp> createState() => _votpState();
}

class _votpState extends State<votp> {
  // Create a list of 6 TextEditingControllers
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    // Dispose all controllers and focus nodes
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bac,
        appBar: AppBar(
          backgroundColor: bac,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // Handle back button press
            },
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.poll, color: Colors.white, size: 60),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Verification",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Text(
              "Enter your OTP code number",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 55,
                    height: 80,
                    child: TextFormField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      obscureText: true, // Displays input as dots
                      obscuringCharacter: '●', // Custom character for obscuring
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1), // Limits to 1 character
                        FilteringTextInputFormatter.digitsOnly, // Allows only digits
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.length == 1 && index < 5) {
                          _focusNodes[index + 1].requestFocus();
                        } else if (value.isEmpty && index > 0) {
                          _focusNodes[index - 1].requestFocus();
                        }
                      },
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Check if all fields are filled
                  bool isOtpComplete = _controllers.every((controller) => controller.text.isNotEmpty);

                  if (isOtpComplete) {
                    String otp = _controllers.map((controller) => controller.text).join();
                    // Perform OTP verification if needed
                    Navigator.push(context, MaterialPageRoute(builder: (context) => userotp2()));
                  } else {
                    // Show a message if OTP is not complete
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter all 6 digits of the OTP.')),
                    );
                  }
                },
                child: Text(
                  "Verify",
                  style: TextStyle(color: logbu),
                ),
              ),
            ),
            Text(
              "Didn't you receive any code?",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Resend New Code",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
