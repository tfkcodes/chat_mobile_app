import 'package:chat_mobile_app/theme/colors.dart';
import 'package:flutter/material.dart';

class VideoCallBody extends StatelessWidget {
  const VideoCallBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text("John doe"),
        centerTitle: true,
actions: [
  IconButton(onPressed: (){}, icon: Icon(Icons.settings))
],
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Caller's Image (left)
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(left:5.0,bottom: 70),
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Add Participants Button (top right)
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.all(16.0),
              child: Container(
                    height: 50,
                    width: 50,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.person_add,color: white,),),
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    ),
            ),
          ),
          // Action Buttons (bottom center)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.mic),),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    ),
                  SizedBox(width: 20.0),
                  Container(
                    height: 50,
                    width: 50,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.videocam),),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    ),
                  
                  SizedBox(width: 20.0),
                  Container(
                    height: 50,
                    width: 50,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.call_end,color: white,),),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
