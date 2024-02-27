import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/widgets/Text_Widget.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    Key? key,
    required this.controller,
    this.leadingIcon,
    this.color = Colors.white,
    this.size = 20.0,
    this.result = false,
    this.trailingIcon,
    this.hintText=" ",
    this.errorText,
    this.onChanged,
    this.onTap,
  }) : super(key: key);

  final double size;
  bool result;
  final String hintText;
  String? errorText;
  final Color color;
  final TextEditingController controller;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Size sizetext = MediaQuery.of(context).size;
    return TextFormField(
      cursorWidth: 1.0,
      cursorColor: Colors.black,
      obscureText: result,
      controller: controller,
      onChanged: onChanged, // Pass the onChanged function to the TextFormField
      onTap: onTap, // Pass the onTap function to the TextFormField
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        errorText: errorText?? null,
        focusColor: Colors.black,
        contentPadding: const EdgeInsets.only(left: 10, right: 15),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: color,
        prefixIcon: leadingIcon == null
            ? const TextWidget(text: "")
            : Icon(
          leadingIcon,
          color: Colors.black38,
          size: size,
        ),
        suffixIcon: trailingIcon == null
            ? const TextWidget(text: "")
            : Icon(
          trailingIcon,
          color: Colors.black38,
          size: size,
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}

class SimpleTextFieldWidget extends StatelessWidget {
  SimpleTextFieldWidget({Key? key, required this.controller, this.hintText})
      : super(key: key);
  TextEditingController controller = TextEditingController();
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorWidth: 1.0,
      cursorColor: Colors.black,
      controller: controller,
      style: const TextStyle(
          color: Colors.black,fontSize: 13),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 10,right: 15),
        border:  OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Colors.black87, fontSize: 12, fontWeight: FontWeight.normal),
      ),
    );
  }
}
