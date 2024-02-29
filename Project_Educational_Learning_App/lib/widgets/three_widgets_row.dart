import 'package:flutter/material.dart';
import 'package:learning_app/widgets/Text_Widget.dart';

class ThreeWidgetsRow extends StatelessWidget {
  const ThreeWidgetsRow({
    Key? key,
    this.leading,
    this.title = '',
  }) : super(key: key);

  final IconData? leading;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                leading,
                size: 25,
                color: Colors.teal,
              ),
              TextWidget(
                text: title,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
              const Icon(
                Icons.navigate_next,
                color: Colors.black,
                size: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
