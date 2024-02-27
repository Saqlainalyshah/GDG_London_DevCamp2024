import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/screen_body/edit_profile.dart';
import 'package:learning_app/widgets/Text_Widget.dart';
import 'package:learning_app/widgets/button_widget.dart';
import '../tutor_info/tutot_info_widegts.dart';
import '../widgets/container_widget.dart';
import 'login_as_student.dart';

class TutorViewBody extends StatefulWidget {

  String? image;
  String? name;
  String? username;
  TutorViewBody({this.image,this.name,this.username});

  @override
  State<TutorViewBody> createState() => _TutorViewBodyState();
}

class _TutorViewBodyState extends State<TutorViewBody> {
 bool isvisible=false;
  String title="About";
  String buttonTitle="Follow";
  Color textColor= Colors.white;
  bool colorVis=false;
  Color buttonColor=Colors.teal;
  setStateFn(){
   setState(() {
     isvisible=!isvisible;
     if(isvisible==true){
       title="Close";
     }
     else{
       title="About";
     }
   });}

 follow(){
    setState(() {
      colorVis=!colorVis;
      if(colorVis==true){
        buttonColor=const Color(0xFFDBDBDB);
        buttonTitle="Following";
        textColor=Colors.black;
      }else{
        buttonColor= Colors.teal;
        buttonTitle="Follow";
        textColor=Colors.white;
      }

    });

 }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
   //print(image);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.image!=null?
              myContainer("${widget.image}")
              :const CircularProgressIndicator(
                strokeWidth: 2.0,
                color:  Colors.grey,
                backgroundColor: Colors.black,
              ),
              SizedBox(width: width*(0.08),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   TextWidget(text: "${widget.name}",
                    fontSize: 17,
                    fontWeight: FontWeight.bold,),
                  buildSizedBox(),
                   TextWidget(text: "${widget.username}", fontSize: 13,)
                ],
              ),
              SizedBox(width: width*(0.1+0.03),),
              Column(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 30,),
                  buildSizedBox(),
                  const TextWidget(
                    text: "4.3/5", fontSize: 12, fontWeight: FontWeight.bold,)
                ],
              )
            ],
          ),
          buildSizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWidget(onPress:follow,fontsize: 14.0,
                color: buttonColor,height:height*0.04,width: width*0.3,titleColor:textColor,title:buttonTitle,),
              ButtonWidget(onPress: () {},fontsize: 12.0,titleColor: Colors.black,
                color: const Color(0xFFDBDBDB),height:height*0.04,width: width*0.3,title: "Message",),
              ButtonWidget(onPress:setStateFn,fontsize: 12.0,titleColor: Colors.black,
                color:const Color(0xFFDBDBDB),height:height*0.04,width: width*0.3,title: title,),
            ],
          ),buildSizedBox20(),
          Visibility(
            visible: isvisible,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ContainerWidget(title:"University",text: "Karakoram International University", color: Colors.teal,),
                ContainerWidget(title:"Mobile Number",text: "03135586233", color:  Colors.amberAccent),
              ],
            ),
          ),
          buildSizedBox20(),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: const Color(0xFFD4EAEA),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                headerRowWidget("Subject Experience", "Pay Per Class"),
                customRowWidget("Science", "\$120"),
                customRowWidget("Mathamatics", "\$140"),
                customRowWidget("English", "\$130"),
              ],
            ),
          ),
          buildSizedBox(),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: const Color(0xFFD4EAEA),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                headerRowWidget("Combined Pack", "Per Month"),
                customRowWidget("Science", "\$1200"),
                customRowWidget("Mathamatics", "\$1400"),
                customRowWidget("English", "\$1300"),
              ],
            ),
          ),
          buildSizedBox(),
          const TextWidget(text: "Select Duration",fontSize: 15, fontWeight: FontWeight.bold,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWidget(onPress: () {},fontsize: 12.0,titleColor: Colors.black,
                color: Colors.cyan[300]!,height:height*(2/50),width: width*0.3,title: "15 Days",),
              ButtonWidget(onPress: () {},fontsize: 12.0,titleColor: Colors.black,
                color: Colors.amber[300]!,height:height*(2/50),width: width*0.3,title: "20 Days",),
              ButtonWidget(onPress: () {},fontsize: 12.0,titleColor: Colors.black,
                color: Colors.teal[300]!, height:height*(2/50),width: width*0.3,title: "30 Days ",),
            ],
          )
        ],
      ),
    );
  }
}
