import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class TextFieldWidget extends StatefulWidget {
  final double iconSize;
  final FontWeight fontWeight;
  bool secure, inputType, isCNIC;
  Container? container;
  final String hintText;
  String? errorText;
  TextInputType? textInputType;
  final Color fillColor;
  final TextEditingController controller;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final VoidCallback? trailingFn;
  //Constructor
  TextFieldWidget({
    Key? key,
    required this.controller,
    this.leadingIcon,
    this.fontWeight = FontWeight.normal,
    this.inputType = false,
    this.fillColor = Colors.white,
    this.iconSize = 20.0,
    this.container,
    this.textInputType=TextInputType.text,
    this.secure = false,
    this.trailingIcon,
    this.hintText = " ",
    this.errorText,
    this.onChanged,
    this.onTap,
    this.trailingFn,
    this.isCNIC = false,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}
class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.isCNIC ? TextInputType.number : widget.textInputType,
      inputFormatters: widget.isCNIC ? [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(13),
        CNICFormatter(),
      ]: null,
      cursorWidth: 1.0,
      cursorColor: Colors.black,
      obscureText: widget.secure,
      controller: widget.controller,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      decoration: InputDecoration(
        errorText: widget.errorText,
        focusColor: Colors.black,
        contentPadding: const EdgeInsets.only(left: 10, right: 15),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: widget.fillColor,
        prefixIcon: widget.leadingIcon == null
            ? null
            : Icon(
          widget.leadingIcon,
          color: Colors.black,
          size: widget.iconSize,
        ),
        suffixIcon: widget.trailingIcon == null
            ? null
            : InkWell(
              onTap: widget.trailingFn,
              child: Icon(
                widget.trailingIcon,
                color: Colors.black,
                size: widget.iconSize,
          ),
        ),
        hintText: widget.hintText,
      ),
    );
  }
}
class CNICFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove non-digits
    String text = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (text.length >= 5 && text.length <= 13) {
      // Add hyphen at the 12th position for CNIC format
      text = text.substring(0, 5) +
          '-' +
          text.substring(5, min(12, text.length)) +
          (text.length > 12 ? '-' + text.substring(12) : '');
    }
    return newValue.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
