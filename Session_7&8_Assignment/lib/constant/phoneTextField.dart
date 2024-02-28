import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneTextField extends StatefulWidget {
   PhoneTextField({super.key,

     required this.controller,
     required this.onChanged,
   });

  TextEditingController controller;
   final Function(String) onChanged;
  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  String checktick="";
  Country selectedCountry= Country(
    phoneCode:"92",
    countryCode: "PK",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name:"Pakistan" ,
    example: "Pakistan",
    displayName:"Pakistan" ,
    displayNameNoCountryCode:"PK" ,
    e164Key: " ",
  );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:  TextInputType.phone,
      controller: widget.controller,
      maxLength: 10,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          hintText: "3135586233",
          counterText: " ",
          focusColor: Colors.black,
          contentPadding: const EdgeInsets.only(left: 10, right: 15),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon:Container(
            width: 90,
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap:  (){
                showCountryPicker(context: context,
                    onSelect: (value){
                      setState(() {
                        selectedCountry=value;
                        print("${selectedCountry.phoneCode} is code of country");
                      });
                    },
                    countryListTheme: const CountryListThemeData(
                        borderRadius: BorderRadius.zero,
                        bottomSheetHeight: 500
                    ));
              },
              child: Text("${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),),
            ),),
          suffixIcon: widget.controller.text.length ==10? Container(child: Icon(Icons.check_circle,color: Colors.green,),):null
      ),
    );
  }
}
