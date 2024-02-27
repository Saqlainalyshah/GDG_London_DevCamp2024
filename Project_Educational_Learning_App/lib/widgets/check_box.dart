import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/widgets/Text_Widget.dart';

class CustomCheckBox extends StatefulWidget {
  final String title; // Add a new String parameter for the text
  const CustomCheckBox({Key? key, required this.title}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.teal;
      }
      return Colors.amber;
    }

    return Row(
      children: [ // Use the text argument here
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        TextWidget(text: widget.title,fontSize: 13,),
      ],
    );
  }
}
