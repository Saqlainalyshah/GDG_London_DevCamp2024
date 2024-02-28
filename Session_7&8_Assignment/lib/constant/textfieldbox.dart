import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldBox extends StatefulWidget {
   TextFieldBox({super.key,
  required this.controller,
   this.obscuretxt=true
   });
  TextEditingController controller=TextEditingController();
  bool obscuretxt;

  @override
  State<TextFieldBox> createState() => _TextFieldBoxState();
}

class _TextFieldBoxState extends State<TextFieldBox> {

  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: TextFormField(
        controller: widget.controller,
        autofocus: true,
        obscureText: widget.obscuretxt,
        onChanged: (v) {
          if (v.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if(v.length!=1){
            FocusScope.of(context).previousFocus();
          }
        },
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            counterText: " "),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}