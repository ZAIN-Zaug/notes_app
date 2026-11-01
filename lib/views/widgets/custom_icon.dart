import 'package:flutter/material.dart';

class CustomIconSearch extends StatelessWidget {
  const CustomIconSearch ({super.key, required this.iconName, this.onPressed});
  final IconData iconName;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
    height: 46,
    width: 46,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(12),
color: Colors.white.withValues(alpha: .2),

),
child: Center(
child: IconButton(
 icon: Icon(iconName,size: 30,) ,
  onPressed:onPressed,
),
),
);
  }
}
