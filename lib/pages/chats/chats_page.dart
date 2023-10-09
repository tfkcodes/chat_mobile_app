import 'package:badges/badges.dart' as badges;
import 'package:chat_mobile_app/json/chat_json.dart';
import 'package:chat_mobile_app/pages/chats/chat_detail_page.dart';
import 'package:chat_mobile_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: const Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: greyColor,
      title: const Text(
        "Messages",
        style:
            TextStyle(fontSize: 20, color: white, fontWeight: FontWeight.w500),
      ),
      
      actions: [
        const IconButton(
            onPressed: null,
            icon: Icon(
              LineIcons.edit,
              color: primary,
            ))
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 68,
            decoration: const BoxDecoration(color: greyColor),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 38,
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      style: const TextStyle(color: white),
                      cursorColor: primary,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            LineIcons.search,
                            color: white.withOpacity(0.3),
                          ),
                          hintText: "Search for messages or users",
                          hintStyle: TextStyle(
                              color: white.withOpacity(0.3), fontSize: 17)),
                    ),
                  )
                ],
              ),
            ),
          ),const SizedBox(height: 10), // Add some spacing
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Action buttons for filtering messages
                    filterButton("All", true), // true means it's selected
                    filterButton("Promotion", false),
                    filterButton("Private", false),
                    filterButton("Spam", false),
                  ],
                ),
          const SizedBox(
            height: 20,
          ),
          getListChats()
        ],
      ),
    );
  }

  Widget getListChats() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(chat_data.length, (index) {
        return GestureDetector(
          onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => ChatDetailPage(name: chat_data[index]['name'], img: chat_data[index]['img'])));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12,right: 12,top: 5),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(chat_data[index]['img']),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: SizedBox(
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: (size.width - 40) * 0.6,
                              child: Text(
                                chat_data[index]['name'],
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: white,
                                    fontWeight: FontWeight.w600),
                                maxLines: 2,
                              ),
                            ),
                            Text(chat_data[index]['date'],style: TextStyle(
                              fontSize: 14,color: white.withOpacity(0.4)
                            ),)
            
                          ],
                        ),
                        const SizedBox(height: 4,),
                       SizedBox(
                         width: (size.width-40)*1,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(chat_data[index]['text'],style: TextStyle(
                               fontSize: 15,
                               height: 1.3,
                               color: white.withOpacity(0.3)
                             ),),
                             chat_data[index]['badge'] > 0 ? badges.Badge(
                                badgeStyle: const badges.BadgeStyle(
                                  badgeColor: primary
                                ),
                               badgeContent: Padding(
                                 padding: const EdgeInsets.all(1),
                                 child: Text(chat_data[index]['badge'].toString(),style: const TextStyle(
                                   color: white
                                 ),),
                               ),
                             ) : Container()
                           ],
                         ),
                       ),
                       Divider(
                         color: white.withOpacity(0.3),
                       )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
  Widget filterButton(String label, bool isSelected) {
  return ElevatedButton(
    onPressed: () {
      // Add filter logic here
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        isSelected ? primary : chatBoxOther, // Customize button color
      ),
    ),
    child: Text(
      label,
      style: TextStyle(
        color: isSelected ? white : white.withOpacity(0.5),
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
}
