import 'package:flutter/material.dart';
import 'package:learning_app/widgets/Text_Widget.dart';

class ListTileWidget extends StatelessWidget {
   ListTileWidget({
    Key? key,
    this.leadingIcon,
    this.title='',
     required this.onTap,
  }) : super(key: key);
   Function onTap;
   IconData? leadingIcon;
   final String title;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: ListTile(
        onTap: (){onTap();},
        leading: Icon(leadingIcon,size: 25,color:Colors.black54),
        title: TextWidget(text: title, fontSize: 14,fontWeight: FontWeight.bold,),
        trailing:  const Icon(Icons.navigate_next,size: 25,),
      ),
    );
  }
}
