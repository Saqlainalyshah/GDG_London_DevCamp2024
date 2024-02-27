import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/screen_body/edit_profile.dart';
import 'package:learning_app/screens/dicover_tutor_screen.dart';
import 'package:learning_app/widgets/Text_Widget.dart';
import 'package:learning_app/widgets/list_file.dart';
import 'package:learning_app/widgets/text_field_widget.dart';
import '../functionsdirec/slider.dart';
import '../widgets/button_widget.dart';
import '../widgets/dropdown_widegt.dart';

class ELearningBody extends StatefulWidget {
   ELearningBody({Key? key}) : super(key: key);

  @override
  State<ELearningBody> createState() => _ELearningBodyState();
}

class _ELearningBodyState extends State<ELearningBody> {
final TextEditingController _conSubject=TextEditingController();
final TextEditingController _conSearch=TextEditingController();

String? selectedSemester;
String? selectedUni;
String? selectedLocation;


  @override
  Widget build(BuildContext context) {
    double Height=MediaQuery.of(context).size.height;
    double Width=MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFieldWidget(controller: _conSubject, color:const Color(0xFFD4EAEA),leadingIcon: Icons.search,hintText: "Finding Tutor",trailingIcon: Icons.clear,),
          buildSizedBox(),
          SliderFunction(),
          buildSizedBox(),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                  color: const Color(0xFFD4EAEA),
                  borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const TextWidget(text: "Looking Tutor For",fontSize: 15,fontWeight: FontWeight.bold,),
                buildSizedBox(),
                SimpleTextFieldWidget(controller: _conSearch,hintText: "Enter Subject",),
                buildSizedBox(),
                CustomDropdownButton(
                  hintText: "Select Semester",
                  selectedValue: selectedSemester,
                  dropdownItems: semester,
                ),
                buildSizedBox(),
                CustomDropdownButton(
                  hintText: "Select University",
                  selectedValue: selectedUni,
                  dropdownItems: university,
                ),
                buildSizedBox(),
                CustomDropdownButton(
                  hintText: "Select Location",
                  selectedValue: selectedLocation,
                  dropdownItems: location,
                ),
                buildSizedBox(),
                ButtonWidget(title: "Find a Tutor",onPress: (){
                  Navigator.push(context,MaterialPageRoute(
                      builder: (context) =>  DiscoverTutorScreen()),);
                },),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
