import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/screen_body/edit_profile.dart';
import 'package:learning_app/screens/myprofile_screen.dart';
import '../widgets/custom_appBar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        backIconFunction: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => const MyProfileScreen()),);
        },
        title: "Edit Profile",
        trailingIconWidget1: Icon(Icons.notifications_active,color: Colors.teal,size: 30,),
      ),
      body: SingleChildScrollView(
          child: EditProfileBody()
      ),
    );
  }
}
