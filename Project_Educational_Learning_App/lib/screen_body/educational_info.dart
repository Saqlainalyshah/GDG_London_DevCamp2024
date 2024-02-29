import 'package:flutter/material.dart';
import 'package:learning_app/screens/myprofile_screen.dart';
import '../widgets/Text_Widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_widget.dart';

class EducationalInfoBody extends StatelessWidget {
  EducationalInfoBody({Key? key}) : super(key: key);
  final TextEditingController _conUni = TextEditingController();
  final TextEditingController _conCampus = TextEditingController();
  final TextEditingController _conDegree = TextEditingController();
  final TextEditingController _conDepart = TextEditingController();
  final TextEditingController _conLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/images/educational.jpeg"),
          ),
          buildSizedBox(),
          const TextWidget(
            text: 'Hi! Welcome',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          const TextWidget(
            text: 'A lil bit about Yourself',
            fontSize: 12,
          ),
          buildSizedBox(),
          Container(
            padding:
                const EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 20),
            decoration: BoxDecoration(
                color: const Color(0xFFD4EAEA),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                TextFieldWidget(
                    leadingIcon: Icons.account_balance,
                    size: 25,
                    controller: _conUni,
                    hintText: "University"),
                buildSizedBox(),
                TextFieldWidget(
                  leadingIcon: Icons.home_work_outlined,
                  size: 25,
                  controller: _conCampus,
                  hintText: "Campus",
                ),
                buildSizedBox(),
                TextFieldWidget(
                  leadingIcon: Icons.school_sharp,
                  size: 25,
                  controller: _conDegree,
                  hintText: "Degree",
                ),
                buildSizedBox(),
                TextFieldWidget(
                    leadingIcon: Icons.add_home_work_outlined,
                    size: 25,
                    controller: _conDepart,
                    hintText: "Department"),
                buildSizedBox(),
                TextFieldWidget(
                  controller: _conLocation,
                  hintText: "Location",
                  leadingIcon: Icons.location_on,
                  size: 25,
                ),
                buildSizedBox(),
                ButtonWidget(
                  title: "Save Changes",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyProfileScreen()),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox buildSizedBox() => const SizedBox(
        height: 10,
      );
}
