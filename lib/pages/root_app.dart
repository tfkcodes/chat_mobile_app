
import 'package:badges/badges.dart' as badges;
import 'package:chat_mobile_app/pages/calls_page.dart';
import 'package:chat_mobile_app/pages/chats_page.dart';
import 'package:chat_mobile_app/pages/contact_page.dart';
import 'package:chat_mobile_app/pages/setting_page.dart';
import 'package:chat_mobile_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';



class RootApp extends StatefulWidget {
  const RootApp({ Key? key }) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }
  Widget getBody(){
    return IndexedStack(
      index: pageIndex,
      children: [
        ChatPage(),
        CallsPage(),
        
        SettingPage()
      ],
    );
  }
  Widget getFooter(){
    List iconsItems = [
      CommunityMaterialIcons.chat,
      CommunityMaterialIcons.phone,
      CommunityMaterialIcons.cog,
    ];
    List textItems = [
      "Messages",
      "Calls",
      "Settings"
      
    ];
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: greyColor
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(iconsItems.length, (index) {
            return GestureDetector(
              onTap: (){
                setState(() {
                  pageIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Column(
                  children: [
                    index == 0 ? badges.Badge(
                      badgeContent: Text("3",style: TextStyle(
                        color:white
                      ),
                      
                      ),
                      child:Icon(iconsItems[index],size: 30,color:pageIndex == index ? primary :white.withOpacity(0.5)) ,
                    ) : Icon(iconsItems[index],size: 30,color:pageIndex == index ? primary :white.withOpacity(0.5)),
                    SizedBox(height: 3,),
                    Text(textItems[index],style: TextStyle(fontSize: 11,color:pageIndex == index ? primary : white.withOpacity(0.5)),)
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}