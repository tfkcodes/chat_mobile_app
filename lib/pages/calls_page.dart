import 'package:chat_mobile_app/json/calls_json.dart';
import 'package:chat_mobile_app/json/contact_json.dart';
import 'package:chat_mobile_app/theme/colors.dart';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
          child: getAppBar(), preferredSize: const Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: greyColor,
      title: const Text(
        "Calls",
        style:
            TextStyle(fontSize: 20, color: white, fontWeight: FontWeight.w500),
      ),
      actions: const [
        IconButton(
            onPressed: null,
            icon: Icon(
              CommunityMaterialIcons.magnify,
              color: primary,
            )),
        IconButton(
            onPressed: null,
            icon: Icon(
              LineIcons.cog,
              color: primary,
            ))
      ],
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 68,
            decoration: BoxDecoration(color: greyColor),
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
                      style: TextStyle(color: white),
                      cursorColor: primary,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            LineIcons.search,
                            color: white.withOpacity(0.3),
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(
                              color: white.withOpacity(0.3), fontSize: 17)),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          getContactLists()
        ],
      ),
    );
  }

  Widget getContactLists() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: List.generate(call_list.length, (index) {
          String callStatusText = '';
           IconData callIcon = Icons.call;
          Color callIconColor = chatBoxMe;

          // Determine the call status text, icon, and color based on call_status
          switch (call_list[index]['call_status']) {
            case 'outgoing':
              callStatusText = 'Outgoing Call';
              callIcon = Icons.call_made;
              break;
            case 'received':
              callStatusText = 'Received Call';
              callIcon = Icons.call_received;
              callIconColor = primary;
              break;
            case 'missed':
              callStatusText = 'Missed Call';
              callIcon = Icons.call_missed;
              callIconColor = Colors.red;
              break;
            default:
              callStatusText = 'Unknown';
              break;
          }

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(call_list[index]['img']),
            ),
            title: Text(
              call_list[index]['name'],
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Row(
            children: [
              Icon(
                callIcon,
                color: callIconColor,
              ),
              SizedBox(width: 4),
              Text(
                callStatusText,
                style: TextStyle(
                  fontSize: 13,
                  color: callIconColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
            trailing: Icon(
              call_list[index]['call_type'] == "video"
                  ? Icons.videocam
                  : Icons.phone,
              color: primary,
            ),
            onTap: () {
              // Handle tap on the contact item here if needed.
            },
          );
        }),
      ),
    );
  }
}
