import 'package:chat_mobile_app/theme/colors.dart';
import 'package:flutter/material.dart';

class PhoneNumberEntrySheet extends StatefulWidget {
  @override
  _PhoneNumberEntrySheetState createState() => _PhoneNumberEntrySheetState();
}

class _PhoneNumberEntrySheetState extends State<PhoneNumberEntrySheet> {
  TextEditingController _phoneNumberController = TextEditingController();
  FocusNode _phoneNumberFocusNode = FocusNode();



  @override
  void initState() {
    super.initState();
    // Set focus on the phone number field when the widget is created
    _phoneNumberFocusNode.requestFocus();
  }

  void _callNumber() {
    // You can implement the logic to make a phone call here
    // You may need to use a package like 'url_launcher' to achieve this
    // For example: launch('tel:$_phoneNumberController.text');
  }

 @override
  void dispose() {
    _phoneNumberController.dispose();
    _phoneNumberFocusNode.requestFocus();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             TextField(
              controller: _phoneNumberController,
               focusNode: _phoneNumberFocusNode,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: (){},
              icon: Icon(Icons.call),
              label: Text('Call Number'),
            ),
          ],
        ),
      ),
    );
  }
}
