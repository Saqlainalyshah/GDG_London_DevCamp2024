import 'package:flutter/material.dart';
import 'package:learning_app/screen_body/login_as_student.dart';
import 'package:learning_app/widgets/Text_Widget.dart';
import '../screens/login_as_student_screen.dart';
import '../widgets/button_widget.dart';

class WelcomeTeacherStudentBody extends StatelessWidget {
  const WelcomeTeacherStudentBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 10.0, right: 10.0, bottom: 10.0, top: 200.0),
      child: Column(
        children: [
          const TextWidget(
            text: "Welcome Back!",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          const TextWidget(
            text: "A lil bit about yourself",
            fontSize: 17,
          ),
          buildSizedBox20(),
          buildSizedBox20(),
          buildSizedBox20(),
          ButtonWidget(
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginAsStudentScreen()),
              );
            },
            color: const Color(0xFFDBDBDB),
            title: "Student",
            titleColor: Colors.black,
          ),
          buildSizedBox20(),
          ButtonWidget(
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginAsStudentScreen()),
              );
            },
            color: const Color(0xFFDBDBDB),
            title: "Teacher",
            titleColor: Colors.black,
          )
        ],
      ),
    );
  }
}
