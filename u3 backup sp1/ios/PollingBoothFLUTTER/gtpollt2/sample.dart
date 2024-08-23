// import 'package:flutter/material.dart';
// import 'package:untitled3/test%20gtpoll/polldetails1.dart';
//
// import 'color1.dart';
// import 'color10.dart';
//
// // import 'color.dart';
// // import 'dummy poll .dart';
//
// class NewPolled extends StatefulWidget {
//   const NewPolled({super.key});
//
//   @override
//   State<NewPolled> createState() => _NewPolledState();
// }
//
// class _NewPolledState extends State<NewPolled> {
//   final List<TextEditingController> _controllers = List.generate(2, (index) => TextEditingController());
//   final TextEditingController _questionController = TextEditingController();
//
//   DateTime selectedDate = DateTime.now();
//   TimeOfDay selectedTime = TimeOfDay.now();
//   final ctlDOB = TextEditingController();
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//         _selectTime(context);
//       });
//     }
//   }
//
//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: selectedTime,
//     );
//     if (picked != null && picked != selectedTime) {
//       setState(() {
//         selectedTime = picked;
//       });
//     }
//   }
//
//   void _addTextField() {
//     if (_controllers.length < 4) {
//       setState(() {
//         _controllers.add(TextEditingController());
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('You can only have up to 4 choices.'),
//         ),
//       );
//     }
//   }
//
//   void _removeTextField(int index) {
//     if (_controllers.length > 2) {
//       setState(() {
//         _controllers[index].dispose();
//         _controllers.removeAt(index);
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('You must have at least 2 choices.'),
//         ),
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     for (var controller in _controllers) {
//       controller.dispose();
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
//               Navigator.pop(context);
//             },
//           ),
//           title: const Text("Creating Polling"),
//         ),
//         body: Column(
//           children: [
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Card(
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 20),
//                     Row(
//                       children: [
//                         const Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: CircleAvatar(),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             "test",
//                             style: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                         const Icon(Icons.verified_outlined, color: Colors.black),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 120.0),
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               backgroundColor: headercolo,
//                             ),
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => const NewPolled()),
//                               );
//                             },
//                             child: const Text(
//                               "Following",
//                               style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                         const Icon(Icons.more_vert, color: Colors.black),
//                       ],
//                     ),
//                     ListTile(
//                       leading: const Icon(Icons.poll, size: 30),
//                       title: TextFormField(
//                         controller: _questionController,
//                         style: const TextStyle(color: Colors.black),
//                         decoration: InputDecoration(
//                           labelText: "Ask a question...",
//                           hintText: "Ask a question...",
//                           fillColor: Colors.white,
//                           hintStyle: TextStyle(fontSize: 20.0, color: hin),
//                           filled: true,
//                           border: const OutlineInputBorder(),
//                         ),
//                       ),
//
//                     ),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: _controllers.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: TextFormField(
//                                   controller: _controllers[index],
//                                   style: const TextStyle(color: Colors.black),
//                                   decoration: InputDecoration(
//                                     labelText: "Choice ${index + 1}",
//                                     hintText: "Choice ${index + 1}",
//                                     fillColor: Colors.white,
//                                     hintStyle: TextStyle(fontSize: 20.0, color: hin),
//                                     filled: true,
//                                     border: const OutlineInputBorder(),
//                                   ),
//                                 ),
//                               ),
//                               IconButton(
//                                 onPressed: _addTextField,
//                                 icon: const Icon(Icons.add),
//                               ),
//                               IconButton(
//                                 onPressed: () => _removeTextField(index),
//                                 icon: const Icon(Icons.delete),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                     ListTile(
//                       leading: const Text(
//                         "Poll length",
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       // title: Text(
//                       //   "Selected date: ${selectedDate.toLocal()}".split(' ')[0] +
//                       //       "\nSelected time: ${selectedTime.format(context)}",
//                       // ),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.keyboard_arrow_down_sharp),
//                         onPressed: () {
//                           _selectDate(context);
//                         },
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         final String question = _questionController.text;
//                         final List<String> choices = _controllers.map((controller) => controller.text).toList();
//
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 PollDetails(
//                                   question: question,
//                                   choices: choices,
//                                   selectedDate: selectedDate,
//                                   selectedTime: selectedTime,
//                                 ),
//                           ),
//                         );
//                       },
//                       child: const Text("Create"),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }