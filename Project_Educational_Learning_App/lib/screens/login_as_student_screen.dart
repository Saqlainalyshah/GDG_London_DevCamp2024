import 'package:flutter/material.dart';
import 'package:learning_app/screen_body/login_as_student.dart';
import 'package:learning_app/screens/welcomeback_screen.dart';
import '../widgets/custom_appBar.dart';

class LoginAsStudentScreen extends StatelessWidget {
  const LoginAsStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:  CustomAppBar(
          backIconFunction: (){
            Navigator.pop(context);
          },
        title: "Login as Student",
        ),
        body:SingleChildScrollView(
            child: LoginAsStudentBody()
        ),
    );
  }
}
