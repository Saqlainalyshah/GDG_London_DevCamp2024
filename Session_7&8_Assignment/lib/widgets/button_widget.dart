import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Text_Widget.dart';
class ButtonWidget extends StatelessWidget {
   ButtonWidget({Key? key,
    this.isloading=false,
    this.title='',
    this.fontsize=18.0,
    this.width=double.infinity,
    this.height=55.0,
    this.color=const Color(0xff0077B5),
    this.titleColor=Colors.white,
    required this.onPress}) : super(key: key);

  bool isloading;
  final String title;
  final double fontsize;
  final double height;
  final double width;
  final Color titleColor;
  final Color color;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){onPress!();},
      highlightColor: const Color(0xff0077B5),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color
          ),
          child: Center(child: isloading? const CircularProgressIndicator(
            color: Colors.white,)
              :TextWidget(text: title,color: titleColor,
            fontSize: fontsize,fontWeight: FontWeight.bold,)),
        ),
    );
  }
}
