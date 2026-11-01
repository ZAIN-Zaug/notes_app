import 'package:flutter/material.dart';

import 'custom_icon.dart';



class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.pageTitle, required this.iconName, this.onPressed});
  final String pageTitle;
 final IconData iconName ;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(pageTitle,style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),),
        Spacer(),
        CustomIconSearch(iconName:iconName,onPressed:onPressed),


      ],
    );
  }
}
