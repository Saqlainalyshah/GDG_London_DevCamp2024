import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/Text_Widget.dart';
import '../widgets/check_box.dart';

Padding aboutInfo(String title,String text) {
  return  Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(text: title,fontSize: 13,color: Colors.black,),
        TextWidget(text: text,fontSize: 13,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,)
      ],
    ),
  );
}
Row headerRowWidget(String text1,String text2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextWidget(text: text1,fontWeight: FontWeight.bold,fontSize: 14,),
      TextWidget(text: text2,fontWeight: FontWeight.bold,fontSize: 14,),
    ],
  );
}
Row customRowWidget(String title,String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomCheckBox(title: title),
      TextWidget(text: text,fontWeight: FontWeight.bold,fontSize: 13,),
    ],
  );
}

CircleAvatar myContainer(image) {
  return CircleAvatar(
        radius: 50,
        backgroundImage:NetworkImage(image)
    );
}

