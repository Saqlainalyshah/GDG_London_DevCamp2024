import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/widgets/Text_Widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key,
    this.title='',
    this.fontsize=18.0,
    this.width=double.infinity,
    this.height=50.0,
    this.color=Colors.amber,
    this.titleColor=Colors.white,
    required this.onPress}) : super(key: key);
  final String title;
  final double fontsize;
  final double height;
  final double width;
  final Color titleColor;
  final Color color;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onPress();},
      child: Padding(
        padding: EdgeInsets.only(top: 5),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color
            ),
            child: Center(child: TextWidget(text: title,color: titleColor,
              fontSize: fontsize,fontWeight: FontWeight.bold,)),
          ),
      ),
    );
  }
}
