import 'package:flutter/material.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_widget.dart';
import 'login_as_student.dart';

class EditProfileBody extends StatelessWidget {
  EditProfileBody({Key? key}) : super(key: key);
  final TextEditingController _conName = TextEditingController();
  final TextEditingController _conEmail = TextEditingController();
  final TextEditingController _conPhone = TextEditingController();
  final TextEditingController _conPassword = TextEditingController();
  final TextEditingController _conConPassword = TextEditingController();
  final TextEditingController _conUniversity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage:
                      const AssetImage("assets/images/profile0.jpg"),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                ),
              ),
              Positioned(
                  left: width * (0.6 - 0.06),
                  bottom: width * (0.01),
                  child: Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.teal,
                      ),
                      child: const Icon(
                        Icons.edit_note_sharp,
                        color: Colors.white,
                        size: 25,
                      )))
            ],
          ),
          buildSizedBox20(),
          Container(
            padding:
                const EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 20),
            decoration: BoxDecoration(
                color: const Color(0xFFD4EAEA),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                TextFieldWidget(
                  controller: _conName,
                  hintText: "Student Name",
                  leadingIcon: Icons.person,
                ),
                buildSizedBox(),
                TextFieldWidget(
                  controller: _conEmail,
                  size: 25,
                  hintText: "Email Address",
                  leadingIcon: Icons.email_outlined,
                ), //imagePath: "assets/images/educational.jpeg"
                buildSizedBox(),
                TextFieldWidget(
                  controller: _conPassword,
                  result: true,
                  hintText: "Password",
                  leadingIcon: Icons.lock_person,
                  size: 25,
                  trailingIcon: Icons.visibility_off,
                ),
                buildSizedBox(),
                TextFieldWidget(
                  controller: _conConPassword,
                  result: true,
                  hintText: "Confirm Password",
                  leadingIcon: Icons.lock_person,
                  size: 25,
                  trailingIcon: Icons.visibility_off,
                ),
                buildSizedBox(),
                TextFieldWidget(
                  controller: _conPhone,
                  size: 25,
                  hintText: "Phone Number",
                  leadingIcon: Icons.phone,
                ), //imagePath: "assets/images/educational.jpeg"
                buildSizedBox(),
                TextFieldWidget(
                  controller: _conUniversity,
                  hintText: "University",
                  leadingIcon: Icons.account_balance,
                  size: 25,
                ),
                buildSizedBox(),
                ButtonWidget(
                    title: "Save Changes",
                    onPress: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

SizedBox buildSizedBox() => const SizedBox(
      height: 10,
    );
