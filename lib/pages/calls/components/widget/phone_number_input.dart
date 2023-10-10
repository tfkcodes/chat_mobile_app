import 'package:chat_mobile_app/pages/calls/components/widget/keyboard.dart';
import 'package:chat_mobile_app/theme/colors.dart';
import 'package:community_material_icon/community_material_icon.dart';
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
      body: Column(
        children: [
          Container(
            height: 70,
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => _clearLastDigit(),
              onLongPress: () => _clearText(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Dynamic prefix icon (will appear only when text is not empty)
                  if (_phoneNumberController.text.isNotEmpty)
                    Icon(Icons.phone, color: Colors.white),
                  // Text widget to display the typed value
                  Text(
                    _phoneNumberController.text,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  // Dynamic suffix icon (will appear only when text is not empty)
                  if (_phoneNumberController.text.isNotEmpty)
                    Icon(Icons.clear, color: Colors.white),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NumericButton(label: '1', onPressed: () => onKeyPressed('1')),
                    NumericButton(label: '2', onPressed: () => onKeyPressed('2')),
                    NumericButton(label: '3', onPressed: () => onKeyPressed('3')),
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NumericButton(label: '4', onPressed: () => onKeyPressed('4')),
                    NumericButton(label: '5', onPressed: () => onKeyPressed('5')),
                    NumericButton(label: '6', onPressed: () => onKeyPressed('6')),
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NumericButton(label: '7', onPressed: () => onKeyPressed('7')),
                    NumericButton(label: '8', onPressed: () => onKeyPressed('8')),
                    NumericButton(label: '9', onPressed: () => onKeyPressed('9')),
                  ],
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  // Placeholder for empty space
                    NumericButton(label: '*', onPressed: () => onKeyPressed('*')),
                    NumericButton(
                        label: '0', onPressed: () => onKeyPressed('0')),
                        NumericButton(
                        label: '#', onPressed: () => onKeyPressed('#')),
                  ],
                ),

                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                  onPressed: () {
                    
                  },
                  mini: false,
                  child:  const Icon(CommunityMaterialIcons.phone),
                )
                  ],
                ),
              ],
            )
        ],
      ),
    );
  }
  
  onKeyPressed(String value) {
    setState(() {
      _phoneNumberController.text += value;
    });
  }

   void _clearText() {
    setState(() {
      _phoneNumberController.clear();
    });
  }

    void _clearLastDigit() {
    setState(() {
      final text = _phoneNumberController.text;
      if (text.isNotEmpty) {
        _phoneNumberController.text = text.substring(0, text.length - 1);
      }
    });
  }

}
