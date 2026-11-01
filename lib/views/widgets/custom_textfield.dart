import 'package:flutter/material.dart';

import '../../constants.dart';





class CustomTextField extends StatelessWidget {
const CustomTextField({super.key, required this.hintText,  this.Maxlines=1, this.onSaved,  this.text='', this.onChange,});
   final void Function(String?)? onSaved;
   final String  hintText;
   final int Maxlines;
   final String  text ;
   final void Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      initialValue: text,
      onSaved: onSaved ,
      validator: (value){
      if(value?.isEmpty ?? true){
        return "this field is required";
      }
      else {
        return null;
      }
      },
      cursorColor: kPrimaryColor,
        maxLines: Maxlines,
      decoration:  InputDecoration(

        hintText: hintText,
        hintStyle: TextStyle(color:kPrimaryColor.withValues(alpha: .4)),

        enabledBorder:buildOutlineInputBorder(),
        border: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(color: kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({dynamic  color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
          color: color ?? Colors.white
      ),
      borderRadius: BorderRadius.circular(12),

    );
  }
}

