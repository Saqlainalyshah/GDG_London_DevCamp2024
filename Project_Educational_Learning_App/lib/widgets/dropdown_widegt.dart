import 'package:flutter/material.dart';
import 'package:learning_app/widgets/Text_Widget.dart';

class CustomDropdownButton extends StatefulWidget {
        String? selectedValue;
        final String hintText;
        final List<String> dropdownItems;

  CustomDropdownButton({
    this.hintText='',
    required this.selectedValue,
    required this.dropdownItems,
  });
  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.selectedValue,
     // isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        labelText: widget.hintText,
        labelStyle: TextStyle(fontSize: 11),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      menuMaxHeight: 150,
      onChanged: (String? newValue) {
        setState(() {
          widget.selectedValue = newValue;
        });
      },
      items: widget.dropdownItems.map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  onTap: (){
                    print(value);
                  },
                  value: value,
                  child: TextWidget(text:value,fontSize: 11,),
                );
      }).toList(),
    );
  }
}
