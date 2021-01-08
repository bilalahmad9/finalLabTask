import 'package:flutter/material.dart';

InputDecoration textfieldInputDecoration(String hintText){
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.grey,
    ),

    // change the color of the hint text bottom line
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),

    //Now if we click on the other textfield the color of bottom line will always be white by using this
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
  );
}

// i use the Textstyle function for all the textstyle widget rather than write again and again
TextStyle simpleTextFieldStyle(){
  return TextStyle(
    color: Colors.grey,
    fontSize: 15,
  );
}
TextStyle simpleTextStyle(){
  return TextStyle(
    color: Colors.grey,
    fontSize: 17,
  );
}

TextStyle MediumTextStyle(){
  return TextStyle(
    color: Colors.grey,
    fontSize: 13,
  );
}