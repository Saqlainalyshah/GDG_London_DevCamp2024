import 'package:flutter/material.dart';
import 'package:learning_app/screen_body/welcome_teacher_student.dart';
import 'package:learning_app/widgets/custom_appBar.dart';

class WelcomeTeacherStudent extends StatelessWidget {
  const WelcomeTeacherStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "Choose Option",
        leadingTitle: "",
      ),
      body: SingleChildScrollView(child: WelcomeTeacherStudentBody()),
    );
  }
}
