import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screen_body/discover_tutor.dart';
import '../widgets/custom_appBar.dart';
class DiscoverTutorScreen extends StatelessWidget {
   DiscoverTutorScreen({Key? key}) : super(key: key);
final TextEditingController _conSearch =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //backgroundColor: const Color(0xff03989E),
      appBar:  CustomAppBar(
        backIconFunction: (){
          Navigator.pop(context);
        },
       title: "Discovered Tutor ",
        trailingIconWidget1: Icon(Icons.edit_note,color:Colors.teal, size: 40,),
        trailingIconWidget2: Icon(Icons.add_alert,color:Colors.teal, size: 30,),
      ),
      body: DiscoverTutorBody(),


    );
  }
}
