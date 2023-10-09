import 'package:flutter/material.dart';
import 'package:chat_mobile_app/theme/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final VoidCallback? onPressed;
    
   final Widget? customLeading;
   final IconData? customLeadingIcon;
   final Color? iconColor;

  CustomAppBar({required this.title, this.onPressed, this.customLeading,this.customLeadingIcon,this.iconColor});

@override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
          IconData leadingIcon = customLeadingIcon ?? Icons.menu; 
         Widget leading = customLeading ?? IconButton(
      onPressed: onPressed,
      icon: Icon(
        leadingIcon,
        color: iconColor, 
      ),
    );
    return AppBar(
      elevation: 0,
      backgroundColor: greyColor,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: white,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: leading,
    );
  }
}
