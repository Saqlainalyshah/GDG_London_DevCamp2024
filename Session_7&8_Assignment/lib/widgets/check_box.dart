import 'package:flutter/material.dart';

Widget CheckBoxTile(String title, bool isSelected) {
  return ListTile(
    trailing: isSelected
        ? const CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xff0077B5),
          child: Icon(Icons.check),
    )
        : Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff0077B5), width: 2),
          borderRadius: BorderRadius.circular(10)),
    ),
    title: Text(title),
  );
}