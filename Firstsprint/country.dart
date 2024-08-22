import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pollibg_booth/sprint1/color.dart';

class ccode extends StatefulWidget {
  const ccode({super.key});

  @override
  State<ccode> createState() => _ccodeState();
}
class _ccodeState extends State<ccode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bac,

      body: Column(
        children: [
          IntlPhoneField(
            flagsButtonPadding: const EdgeInsets.all(8),
            dropdownIconPosition: IconPosition.trailing,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            initialCountryCode: 'IN',

            onChanged: (phone) {
              print(phone.completeNumber);
            },
          )

        ],
      ),
    );
  }
}