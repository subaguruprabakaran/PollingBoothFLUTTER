// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:responsive_framework/responsive_framework.dart';
// import 'package:untitled3/test%20gtpoll/userlogin1.dart';
// import '../test gtpoll/color10.dart';
// import 'color1.dart';
// import 'color10.dart';
// import 'newpoll1.dart';
//
// class UserCreate extends StatefulWidget {
//   const UserCreate({super.key});
//
//   @override
//   State<UserCreate> createState() => _UserCreateState();
// }
//
// class _UserCreateState extends State<UserCreate> {
//   final ctlName = TextEditingController();
//   final ctlPhone = TextEditingController(text: "+91"); // Add default country code here
//   final ctlEmail = TextEditingController();
//   final ctlDOB = TextEditingController();
//   final ctlGender = TextEditingController();
//   final ctlPassword = TextEditingController();
//   final ctlConPass = TextEditingController();
//   final _otpControllers = List.generate(6, (index) => TextEditingController());
//   final _otpFocusNodes = List.generate(6, (index) => FocusNode());
//   final bmc = GlobalKey<FormState>();
//   bool signIsPasswordVisible = false;
//   bool signIsPasswordVisible1 = false;
//   String? selectedGender;
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null && picked != DateTime.now()) {
//       setState(() {
//         ctlDOB.text = DateFormat('dd/MM/yyyy').format(picked);
//       });
//     }
//   }
//
//   void _showOtpBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (BuildContext context) {
//         return Padding(
//           padding: EdgeInsets.only(
//               bottom: MediaQuery.of(context).viewInsets.bottom),
//           child: Container(
//             padding: EdgeInsets.all(16.0),
//             height: 300,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'Enter OTP',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'An OTP has been sent to ${ctlPhone.text}. Please enter it below:',
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: List.generate(6, (index) {
//                       return SizedBox(
//                         width: 45,
//                         height: 60,
//                         child: TextFormField(
//                           controller: _otpControllers[index],
//                           focusNode: _otpFocusNodes[index],
//                           keyboardType: TextInputType.number,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(color: Colors.black, fontSize: 24),
//                           obscureText: true,
//                           obscuringCharacter: '●',
//                           inputFormatters: [
//                             LengthLimitingTextInputFormatter(1), // Limits input to 1 character
//                             FilteringTextInputFormatter.digitsOnly, // Allows only digits
//                           ],
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.grey[300],
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                           onChanged: (value) {
//                             if (value.length == 1 && index < 5) {
//                               _otpFocusNodes[index + 1].requestFocus(); // Move to the next field
//                             } else if (value.isEmpty && index > 0) {
//                               _otpFocusNodes[index - 1].requestFocus(); // Move back to the previous field
//                             }
//                           },
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     String otp = _otpControllers.map((controller) => controller.text).join();
//                     if (otp.length == 6) {
//                       // Handle OTP verification
//                       Navigator.pop(context); // Close the bottom sheet
//                     } else {
//                       // Show a warning message if OTP is not complete
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Please enter a 6-digit OTP")),
//                       );
//                     }
//                   },
//                   child: Text('Verify OTP'),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//         backgroundColor: bac,
//         appBar: AppBar(
//         leading: IconButton(
//         icon: Icon(Icons.arrow_back_ios, color: Colors.white),
//     onPressed: () {
//     Navigator.pop(context); // Handle back button press
//     },
//     ),
//     backgroundColor: bac,
//     title: Text("CREATE YOUR ACCOUNT", style: TextStyle(color: Colors.white)),
//     actions: [
//     Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Icon(Icons.poll, color: Colors.white, size: 40),
//     )
//     ],
//     ),
//     body: Form(
//     key: bmc,
//     child: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Card(
//     child: SingleChildScrollView(
//     child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     SizedBox(height: 20),
//     Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Text(
//     "PERSONAL DETAILS",
//     style: TextStyle(fontWeight: FontWeight.bold),
//     ),
//     ),
//     Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: TextFormField(
//     validator: (input) {
//     if (!RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z])*$").hasMatch(input!)) {
//     return 'Please enter a valid name';
//     }
//     return null;
//     },
//     controller: ctlName,
//     autovalidateMode: AutovalidateMode.onUserInteraction,
//     style: TextStyle(color: Colors.black),
//     decoration: InputDecoration(
//     labelText: "Name",
//     fillColor: Colors.white,
//     filled: true,
//     border: OutlineInputBorder(),
//     ),
//     ),
//     ),
//     Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Row(
//     children: [
//     Container(
//     padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
//     decoration: BoxDecoration(
//     color: Colors.white,
//     border: Border.all(color: Colors.grey),
//     borderRadius: BorderRadius.circular(5.0),
//     ),
//     child: Text(
//     "+91", // Display default country code here
//     style: TextStyle(color: Colors.black, fontSize: 16),
//     ),
//     ),
//     SizedBox(width: 10),
//     Expanded(
//     child: TextFormField(
//     validator: (input) {
//     if (!RegExp(r'^[0-9]{10}$').hasMatch(input!)) {
//     return "Please enter a valid mobile number";
//     }
//     return null;
//     },
//     controller: ctlPhone,
//     autovalidateMode: AutovalidateMode.onUserInteraction,
//     style: TextStyle(color: Colors.black),
//     keyboardType: TextInputType.phone,
//     decoration: InputDecoration(
//     labelText: "Phone number",
//     fillColor: Colors.white,
//     filled: true,
//     border: OutlineInputBorder(),
//     ),
//     ),
//     ),
//     SizedBox(width: 10),
//     TextButton(
//     onPressed: () {
//     // Trigger the OTP bottom sheet
//     _showOtpBottomSheet(context);
//     },
//     child: Text("Verify"),
//     ),
//     ],
//     ),
//     ),
//     Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: TextFormField(
//     controller: ctlEmail,
//     autovalidateMode: AutovalidateMode.onUserInteraction,
//     validator: (input) {
//     if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(input!)) {
//     return "Please enter a valid email address";
//     }
//     return null;
//     },
//     style: TextStyle(color: Colors.black),
//     decoration: InputDecoration(
//     labelText: "Email ID",
//     fillColor: Colors.white,
//     filled: true,
//     border: OutlineInputBorder(),
//     ),
//     ),
//     ),
//     Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: TextFormField(
//     controller: ctlDOB,
//     readOnly: true,
//     onTap: () => _selectDate(context),
//     style: TextStyle(color: Colors.black),
//     decoration: InputDecoration(
//     labelText: "DOB",
//     fillColor: Colors.white,
//     filled: true,
//     hintText: "Select your"
