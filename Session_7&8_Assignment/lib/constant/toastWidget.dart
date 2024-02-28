import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



void ToastFn(BuildContext context ,String message, Color color, IconData icon){
  FToast fToast=FToast();
  fToast.init(context);
  Widget toast = Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20.0),
    decoration: BoxDecoration(
        color: const Color(0xFFB3E7FA),
        borderRadius: BorderRadius.circular(10)
    ),
    child: Row(
    children: [
      Icon(icon,size: 25,color: color,),
      SizedBox(width: 10,),
      Expanded(child: Text(
        message,style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
      ))
    ],
    )
  );
  fToast.showToast(child: toast,toastDuration: const Duration(seconds: 2));
}