

import 'package:chat_mobile_app/json/chat_json.dart';
import 'package:chat_mobile_app/theme/colors.dart';
import 'package:chat_mobile_app/widgets/chat_bubble.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ChatDetailPage extends StatefulWidget {
  final String name;
  final String img;
  const ChatDetailPage({ Key? key,required this.name,required this.img }) : super(key: key);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      bottomNavigationBar: getBottomBar(),
      body: getBody(),
    );
  }
  Widget getAppBar(){
    return AppBar(
      elevation: 0,
      backgroundColor: greyColor,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.name,style: TextStyle(
                    fontSize: 17,color: white,
                    fontWeight: FontWeight.bold
                  ),),
                  Text("last seen recently",style: TextStyle(
                    fontSize: 12,color: white.withOpacity(0.4),
                   
                  ),),
                ],
              ),
            ),
            
          ],
        ),
      ),
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios,color: primary,),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: NetworkImage(widget.img),
        )
      ],
    );
  }
  Widget getBottomBar(){
    var size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: greyColor
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.attachment,
            color: primary,
            size: 21,
            ),
            Container(
              width: size.width*0.76,
              height: 32,
              decoration: BoxDecoration(
                color: white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: TextField(
                  style: TextStyle(
                    color: white,
                    
                  ),
                  cursorColor: primary,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(CommunityMaterialIcons.sticker_emoji,color: primary,size: 25,)
                  ),
                ),
              ),
            ),
            Icon(CommunityMaterialIcons.microphone,
            color: primary,size: 28,)
          ],
        ),
      ),
    );
  }
  Widget getBody(){
    return ListView(
      padding: EdgeInsets.only(top: 20,bottom: 80),
      children: List.generate(messages.length, (index) {
        return CustomBubbleChat(isMe: messages[index]['isMe'], message: messages[index]['message'], time: messages[index]['time'], isLast: messages[index]['isLast']);
      }),
    );
  }
}