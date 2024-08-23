// import 'package:flutter/material.dart';
//
// import 'color1.dart';
// class votp extends StatefulWidget {
//   const votp({super.key});
//
//   @override
//   State<votp> createState() => _votpState();
// }
//
// class _votpState extends State<votp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: bac,
//       body: Column(
//         children: [
//           SizedBox(
//             height: 20,
//           ),
//           Center(child: Icon(Icons.poll,size: 140,color: Colors.white,)),
// Text("Verification",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30)),
//           Text("Enter your OTP code number",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   //autovalidateMode: AutovalidateMode.onUserInteraction,
//
//                   borderRadius: BorderRadius.circular(10),
//                 )
//
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(onPressed: (){}, child: Text("Verify",style: TextStyle(color: logbu),)),
//           ),
//           Text("Didn't you receive any code?",style: TextStyle(fontWeight: FontWeight.bold),),
//           TextButton(onPressed: (){}, child: Text("Resend New Code",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),))
//
//         ],
//       ),
//     );
//   }
// }
