// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:responsive_framework/responsive_framework.dart';
// import '../test gtpoll/color1.dart';
// import '../test gtpoll/color10.dart';
// import '../test gtpoll/otpnextpg.dart';
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
//   final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
//   final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
//
//   @override
//   void dispose() {
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
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back_ios, color: Colors.white),
//             onPressed: () {
//               Navigator.pop(context); // Handle back button press
//             },
//           ),
//           title: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Icon(Icons.poll, color: Colors.white, size: 60),
//           ),
//         ),
//         body: ResponsiveWrapper.builder(
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Verification",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: ResponsiveValue(
//                     context,
//                     defaultValue: 30.0,
//                     valueWhen: [
//                       Condition.smallerThan(name: MOBILE, value: 24.0),
//                       Condition.largerThan(name: TABLET, value: 34.0),
//                     ],
//                   ).value,
//                 ),
//               ),
//               Text(
//                 "Enter your OTP code number",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: ResponsiveValue(
//                     context,
//                     defaultValue: 30.0,
//                     valueWhen: [
//                       Condition.smallerThan(name: MOBILE, value: 20.0),
//                       Condition.largerThan(name: TABLET, value: 40.0),
//                     ],
//                   ).value!,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: List.generate(6, (index) {
//                     return SizedBox(
//                       width: ResponsiveValue(
//                         context,
//                         defaultValue: 55.0,
//                         valueWhen: [
//                           Condition.smallerThan(name: MOBILE, value: 45.0),
//                           Condition.largerThan(name: TABLET, value: 65.0),
//                         ],
//                       ).value!,
//                       height: 80,
//                       child: TextFormField(
//                         controller: _controllers[index],
//                         focusNode: _focusNodes[index],
//                         keyboardType: TextInputType.number,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(color: Colors.black, fontSize: 20),
//                         obscureText: true, // Displays input as dots
//                         obscuringCharacter: '●',
//                         inputFormatters: [
//                           LengthLimitingTextInputFormatter(1),
//                           FilteringTextInputFormatter.digitsOnly,
//                         ],
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         onChanged: (value) {
//                           if (value.length == 1 && index < 5) {
//                             _focusNodes[index + 1].requestFocus();
//                           } else if (value.isEmpty && index > 0) {
//                             _focusNodes[index - 1].requestFocus();
//                           }
//                         },
//                       ),
//                     );
//                   }),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     String otp = _controllers.map((controller) => controller.text).join();
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => userotp2()));
//                     // Handle OTP verification here
//                   },
//                   child: Text(
//                     "Verify",
//                     style: TextStyle(color: logbu),
//                   ),
//                 ),
//               ),
//               Text(
//                 "Didn't you receive any code?",
//                 style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//               TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   "Resend New Code",
//                   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//           breakpoints: [
//             ResponsiveBreakpoint.resize(350, name: MOBILE),
//             ResponsiveBreakpoint.autoScale(600, name: TABLET),
//             ResponsiveBreakpoint.resize(800, name: DESKTOP),
//             ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
//           ],
//         ),
//       ),
//     );
//   }
// }
