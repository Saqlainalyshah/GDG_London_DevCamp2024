import 'package:flutter/material.dart';
import '../screen_body/my_profile.dart';
import '../widgets/custom_appBar.dart';
import 'education_info_screen.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Kiran Sultana",
        color: Colors.black,
        trailingIconWidget1: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const EducationInfoScreen();
              }));
            },
            child: const Icon(
              Icons.edit_note_sharp,
              size: 40,
              color: Colors.teal,
            )),
      ),
      body: const SingleChildScrollView(child: MyProfileBody()),
    );
  }
}
