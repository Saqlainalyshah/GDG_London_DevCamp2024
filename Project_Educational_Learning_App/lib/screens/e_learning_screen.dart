import 'package:flutter/material.dart';
import 'package:learning_app/screen_body/my_profile.dart';
import 'package:learning_app/screens/myprofile_screen.dart';
import 'package:learning_app/widgets/custom_appBar.dart';
import '../screen_body/e_learning.dart';
import 'education_info_screen.dart';

class ELearningScreen extends StatelessWidget {
  const ELearningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          leadingTitle: "E-Learning",
          color: Colors.black,
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
        body: const SingleChildScrollView(child: ELearningBody()),
        drawer: const MyProfileBody(),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.teal,
          items: [
            const BottomNavigationBarItem(
              icon: InkWell(
                child: Icon(
                  Icons.home,
                  color: Colors.black54,
                  size: 30,
                ),
              ),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.grading_outlined,
                size: 30,
                color: Colors.black54,
              ),
              label: "Assignments",
            ),
            BottomNavigationBarItem(
                icon: InkWell(
                    onTap: () {
                      // Review: This is good, but a better approach is to use named routes for navigation, check out the docs
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyProfileScreen()),
                      );
                    },
                    child: const Icon(
                      Icons.person_add_alt_1,
                      color: Colors.black54,
                      size: 30,
                    )),
                label: "Profile"),
          ],
        ));
  }
}
