import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  String selectedValue = "Select";
  final String hintText;
  final List<String> dropdownItems;
  final void Function(String)? onChanged; // New onChanged property

  CustomDropdownButton({
    this.hintText = '',
    required this.selectedValue,
    required this.dropdownItems,
    this.onChanged, // Include onChanged in the constructor
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.selectedValue.toString(),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        labelText: widget.hintText,
        labelStyle: const TextStyle(fontSize: 11),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      menuMaxHeight: 150,
      onChanged: (newValue) {
        setState(() {
          widget.selectedValue = newValue.toString();
        });

        // Call the onChanged function if provided
        if (widget.onChanged != null) {
          widget.onChanged!(newValue.toString());
        }
      },
      items: widget.dropdownItems.map<DropdownMenuItem<String>>(
            (String value) {
          return DropdownMenuItem<String>(
            onTap: () {
              setState(() {
                widget.selectedValue = value.toString();
              });

              // Call the onChanged function if provided
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
    );
  }
}
