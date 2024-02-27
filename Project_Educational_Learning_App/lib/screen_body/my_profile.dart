import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning_app/screen_body/edit_profile.dart';
import 'package:learning_app/screens/education_info_screen.dart';
import 'package:learning_app/screens/login_as_student_screen.dart';
import 'package:learning_app/widgets/Text_Widget.dart';
import 'package:learning_app/widgets/button_widget.dart';
import 'package:learning_app/widgets/list_tile_widget.dart';
import '../screens/e_learning_screen.dart';
import '../screens/edit_profile_screen.dart';
import '../widgets/container_widget.dart';
import 'login_as_student.dart';

class MyProfileBody extends StatefulWidget {
   MyProfileBody({Key? key}) : super(key: key);

  @override
  State<MyProfileBody> createState() => _MyProfileBodyState();
}

class _MyProfileBodyState extends State<MyProfileBody> {
   String posts="4.2/5";
   String title="About";
   String followers="10";
   String following="50";
   bool isvisible=false;

   @override
 Function? setStateFn(){
     {setState(() {
       isvisible=!isvisible;
       if(isvisible==true){
         title="Close";
       }
       else{
         title="About";
       }
     });}}
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                  radius: 50,
                  backgroundImage:AssetImage("assets/images/profile0.jpg")
              ),
              columnWidget(followers,"Followers"),
              columnWidget(following,"Following"),
            ],
          ),
          buildSizedBox(),
          const TextWidget(text: "Kiran Sultana",fontSize: 15,fontWeight: FontWeight.bold,),
          const TextWidget(text: "kiran.sultana@gmail.com",fontSize: 12,),
          buildSizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWidget(onPress: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const EditProfileScreen()),);},
                 fontsize: 14.0,color: Colors.teal,height:height*0.04,width: width*0.3,title: "Edit Profile",),
              ButtonWidget(onPress: () {},fontsize: 12.0,titleColor: Colors.black,
                color: const Color(0xFFDBDBDB), height:height*0.04,width: width*0.3,title: "Share Profile ",),
              ButtonWidget(onPress: (){setStateFn();} ,fontsize: 12.0,titleColor: Colors.black,
                color:const Color(0xFFDBDBDB),height:height*0.04,width: width*0.3,title: title,),
            ],
          ),
          buildSizedBox20(),
          Visibility(
            visible: isvisible,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ContainerWidget(title:"University",text: "Karakoram International University",
                  color: Colors.teal,),
                ContainerWidget(title:"Mobile Number",text: "03135586233",
                    color:  Colors.amberAccent),
              ],
            ),
          ),
          buildSizedBox20(),
          Container(
             padding: const EdgeInsets.only(left: 5,right: 5,top: 20,bottom: 20),
             decoration: BoxDecoration(
                 color: const Color(0xFFD4EAEA),
                 borderRadius: BorderRadius.circular(10)
             ),
             child: Column(
              children: [
                ListTileWidget(onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context) => const EducationInfoScreen()),);;},leadingIcon: FontAwesomeIcons.university,title: "Education Information",),
                const SizedBox(height: 5,),
                ListTileWidget(onTap:(){},leadingIcon: Icons.subscriptions_outlined,title: "Subscription Pack"),
                const SizedBox(height: 5,),
                ListTileWidget(onTap:(){},leadingIcon: Icons.payment_rounded,title: "Payment History",),
                const SizedBox(height: 5,),
                ListTileWidget(onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginAsStudentScreen()),);}
                  ,leadingIcon:  FontAwesomeIcons.signOut,title: "Logout",),
              ],
             ),
           ),
        ],
      ),
    );
  }
}

Column columnWidget(String uperText, String lowerText){
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextWidget(text: uperText,fontSize:13.0,color: Colors.black,fontWeight: FontWeight.bold,),
      ConstrainedBox(constraints: const BoxConstraints(
        maxWidth: 100.0),
        child:TextWidget(text: lowerText,fontSize:13.0,color: Colors.black,))
    ],
  );
}
