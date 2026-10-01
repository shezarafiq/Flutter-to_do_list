import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget{
  final TextEditingController componentController;
  final String hintText;
  const CustomTextField({super.key,required this.componentController, required this.hintText});
  @override
  Widget build(BuildContext context){
    return TextField(
        controller: componentController,
        decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    //borderSide: BorderSide (color:Colors.orange)
    ),
        ),
    );
  }
}