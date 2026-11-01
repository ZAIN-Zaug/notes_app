import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required  this.active, required this.color});
  final bool  active;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return active ? CircleAvatar(
      backgroundColor: Colors.white,
      radius: 38,
      child: CircleAvatar(
        radius: 34,
        backgroundColor: color,
      ),
    ) : CircleAvatar(
    radius: 34,
    backgroundColor: color,
    );
  }
}
