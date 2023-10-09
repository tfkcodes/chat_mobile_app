import 'package:chat_mobile_app/json/chat_json.dart';
import 'package:chat_mobile_app/pages/calls/dial_audio/components/audio_call_body.dart';
import 'package:flutter/material.dart';

class DialScreen extends StatelessWidget {

  const DialScreen(Key? key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AudioCallBody(),
    );
  }
}