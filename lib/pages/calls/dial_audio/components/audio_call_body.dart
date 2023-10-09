import 'package:chat_mobile_app/theme/colors.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class AudioCallBody extends StatefulWidget {
  const AudioCallBody({
    Key? key,
  });
  @override
  _AudioCallBodyState createState() => _AudioCallBodyState();
}

class _AudioCallBodyState extends State<AudioCallBody> {
  bool isMuted = false;
  bool isCameraOff = false;
  bool isSpeakerOn = false;
  bool isVideoCall = false;
  bool isChatOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: const Text("Anna williams"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
                radius: 60.0,
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
                )),
            const SizedBox(height: 16.0),
            const SizedBox(height: 16.0),
            const Text(
              "Duration: 00:00",
              style: TextStyle(fontSize: 18.0, color: white),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    isMuted ? Icons.mic_off : Icons.mic,
                    size: 40.0,
                    color: white,
                  ),
                  onPressed: () {
                    setState(() {
                      isMuted = !isMuted;
                    });
                  },
                ),
                const SizedBox(width: 40.0),
                IconButton(
                  icon: Icon(
                    isSpeakerOn ? Icons.volume_up : Icons.volume_off,
                    size: 40.0,
                    color: white,
                  ),
                  onPressed: () {
                    setState(() {
                      isSpeakerOn = !isSpeakerOn;
                    });
                  },
                ),
                const SizedBox(width: 40.0),
                IconButton(
                  icon: Icon(
                    isCameraOff ? Icons.videocam_off : Icons.videocam,
                    size: 40.0,
                    color: white,
                  ),
                  onPressed: () {
                    setState(() {
                      isCameraOff = !isCameraOff;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    CommunityMaterialIcons.message_outline,
                    size: 40.0,
                    color: white,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(width: 40.0),
                IconButton(
                  icon: const Icon(
                    CommunityMaterialIcons.account_plus_outline,
                    size: 40.0,
                    color: white,
                  ),
                  onPressed: () {
                  
                  },
                ),
                const SizedBox(width: 40.0),
                IconButton(
                  icon: const Icon(
                   CommunityMaterialIcons.voicemail,
                    size: 40.0,
                    color: white
                  ),
                  onPressed: () {
                    
                  },
                ),
                 
              ],
            ),
            const SizedBox(height: 40.0),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                  icon: const Icon(
                   CommunityMaterialIcons.phone_hangup,
                    size: 40.0,
                    color: chatBoxMe
                  ),
                  onPressed: () {
                    
                  },
                ),
                  ],
                 ),
            const SizedBox(height: 25.0),
            
          ],
        ),
      ),
    );
  }
}
