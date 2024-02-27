import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Text_Widget.dart';

class ContainerWidget extends StatelessWidget {
  ContainerWidget({Key?key,this.title='',this.text='',this.color=Colors.teal}) : super(key: key);
final String title;
final String text;
 Color color;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: color,
      elevation: 15.0,
      child: Container(
        constraints: BoxConstraints(
          maxWidth:width*(0.4+0.04).toDouble(),
          maxHeight:height*0.09.toDouble(),
          minWidth:width*(0.4+0.04).toDouble(),
          minHeight:height*0.09.toDouble(),
        ),
       // height: height*0.09.toDouble(), width:width*(0.4+0.04).toDouble(),
        padding: const EdgeInsets.only(left: 10.0,top: 15.0,right: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(text: title,fontSize: 12,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,),
              TextWidget(text: text,fontSize: 12,fontStyle:FontStyle.italic,color: Colors.white,),
            ],
          ),
      ),
    );
  }
}
