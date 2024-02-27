import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/screens/e_learning_screen.dart';
import 'package:learning_app/screens/edit_profile_screen.dart';
import '../screen_body/my_profile.dart';
import '../widgets/custom_appBar.dart';
import 'education_info_screen.dart';
class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   CustomAppBar(
        title: "Kiran Sultana",
        color: Colors.black,
        trailingIconWidget1: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return EducationInfoScreen();
          }));
        }
        ,child: Icon(Icons.edit_note_sharp,size: 40,color: Colors.teal,)),
      ),
      body: SingleChildScrollView(
          child: MyProfileBody()),

    );
  }
}
