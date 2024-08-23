import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class keybord extends StatefulWidget {
  @override
  _keybordState createState() => _keybordState();
}

class _keybordState extends State<keybord> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _validateAndToggleKeyboard() {
    if (_formKey.currentState!.validate()) {
      // Hide the keyboard if the validation passes
      FocusScope.of(context).unfocus();
    } else {
      // Keep the keyboard open if validation fails
      FocusScope.of(context).requestFocus(_focusNode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keyboard Toggle Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10), // Limits to 10 characters
                  FilteringTextInputFormatter.digitsOnly, // Allows only digits
                ],
                focusNode: _focusNode,
                decoration: InputDecoration(
                  labelText: 'Enter text',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  if (value != 'equal') {
                    return 'Input must be "equal"';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  _validateAndToggleKeyboard();
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _validateAndToggleKeyboard,
                child: Text('Validate and Toggle Keyboard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
