import 'package:flutter/material.dart';

import '../../constants.dart';
class CustomAddButton extends StatelessWidget {
  
 const CustomAddButton({super.key, required this.formKey, this.onTap,this.isLoading=false});
  final  bool isLoading;
  final  void Function()? onTap;
  final formKey;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap
    ,
      child: Container(
        width: 350,
        height: 60,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius:BorderRadius.circular(10) ,
      
        ),
        child: Center(child:
        isLoading ? SizedBox(
          height: 26,
          width: 26,
          child: const  CircularProgressIndicator(
            color: Colors.black,
          ),
        ) : const Text("Add",style:  TextStyle(
            color: Colors.black,
            fontSize: 20
      
        ),)),
      ),
    );
  }
}
