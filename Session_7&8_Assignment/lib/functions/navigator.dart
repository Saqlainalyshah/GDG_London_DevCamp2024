import 'package:flutter/material.dart';

navigatorFunction(BuildContext context,Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context){
    return screen;
  }));

}