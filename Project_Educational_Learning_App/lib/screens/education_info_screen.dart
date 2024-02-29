import 'package:flutter/material.dart';
import 'package:learning_app/screen_body/educational_info.dart';
import 'package:learning_app/widgets/custom_appBar.dart';

class EducationInfoScreen extends StatelessWidget {
  const EducationInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Educational Info",
        trailingIconWidget1: Icon(
          Icons.notifications_active,
          color: Colors.teal,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(child: EducationalInfoBody()),
    );
  }
}
