import 'package:flutter/material.dart';
import 'package:learning_app/widgets/custom_appBar.dart';
import '../screen_body/tutor_view_body.dart';
import 'education_info_screen.dart';

class TutorViewScreen extends StatelessWidget {
  String? image;
  String? name;
  String? username;
  TutorViewScreen({super.key, this.image, this.name, this.username});

  @override
  Widget build(BuildContext context) {
    print(image);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        backIconFunction: () {
          Navigator.pop(context);
        },
        title: "Details of Tutor",
        trailingIconWidget1: const Icon(
          Icons.add_alert,
          color: Colors.teal,
          size: 30,
        ),
        trailingIconWidget2: InkWell(
          child: const Icon(
            Icons.edit_note,
            color: Colors.teal,
            size: 35,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const EducationInfoScreen()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
          child: TutorViewBody(
        image: image,
        name: name,
        username: username,
      )),
    );
  }
}
