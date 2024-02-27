import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_app/screens/e_learning_screen.dart';
import 'package:learning_app/widgets/Text_Widget.dart';
import 'package:rive/rive.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_widget.dart';
import 'edit_profile.dart';

class LoginAsStudentBody extends StatefulWidget {
   LoginAsStudentBody({Key? key}) : super(key: key);

  @override
  State<LoginAsStudentBody> createState() => _LoginAsStudentBodyState();
}

class _LoginAsStudentBodyState extends State<LoginAsStudentBody> {
   TextEditingController emailCon =TextEditingController();
   TextEditingController passCon =TextEditingController();
  String emailError=" ",passError=" ";
   var rivelink="assets/rive/rive.riv";
   late SMIBool ideal;
    SMITrigger? failtriger,successtriger;
    SMIBool? isChecking,eyesclose;
    SMINumber? looknum;
   Artboard? artboard;
 late StateMachineController? stateMachineController;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initArtboard();
  }
   initArtboard(){
   rootBundle.load(rivelink).then((value) {
     final file=RiveFile.import(value);
     final art= file.mainArtboard;
     stateMachineController=StateMachineController.fromArtboard(art, "Login Machine");
     if(stateMachineController!=null){
       art.addController(stateMachineController!);
       for(var element in stateMachineController!.inputs){
         print(element.name);
         if(element.name=="isChecking"){
           isChecking= element as SMIBool;
         }else if(element.name=="isHandsUp"){
           eyesclose=element as SMIBool;
         } else if(element.name=="numLook"){
           looknum=element as SMINumber;

         }else if(element.name=="trigSuccess"){
           successtriger=element as SMITrigger;

         }else if(element.name=="trigFail"){
           failtriger= element as SMITrigger;
         }else{
           ideal= element as SMIBool;}
       }
       setState(() {
         artboard=art;
       });
     }
     });
   }
   checking(){
     isChecking?.change(true);
     eyesclose?.change(false);
     looknum?.change(0);
   }
   handsUp(){
    isChecking?.change(false);
    eyesclose?.change(true);
   }
   moveEyes(value){
     looknum?.change(value.length.toDouble());
   }
   idealTeddy(){
     isChecking?.change(false);
     eyesclose?.change(false);
   }
   ifPasswordTrue(){
     if(emailCon.text=="saqlainaly@gmail.com" && passCon.text=="12345")
     {
         successtriger?.fire();
       print("Success");
       Future.delayed(Duration(seconds: 5), () {
         Navigator.push(context, MaterialPageRoute(builder: (context){
           return ELearningScreen();
         }));});
     }
   }
   ifEmpty(){
     if(emailCon.text.length<1 && passCon.text.length<1){
       emailError="Required";
       passError="Required";
       failtriger?.fire();
     }else if(emailCon.text.length<1 && passCon.text.length>0){
       emailError="Required";
       passError=" ";
       failtriger?.fire();
     }else if(emailCon.text.length>0 && passCon.text.length<1){
       emailError=" ";
       passError="Required";
       failtriger?.fire();
     }
     else{
       emailError=" ";
       passError=" ";
     }
   }
   ifWrong(){
    if(emailCon.text.length>0 && passCon.text.length>0){
      if(emailCon.text!="saqlainaly@gmail.com" && passCon.text!="12345")
      {
        failtriger?.fire();
        emailError="Email is incorrect";
        passError="Password is incorrect";
      }else if(emailCon.text=="saqlainaly@gmail.com" && passCon.text!="12345"){
        emailError="";
        passError="Password is incorrect";
        failtriger?.fire();
      }else if(emailCon.text!="saqlainaly@gmail.com" && passCon.text=="12345"){
        emailError="Email is incorrect";
        passError=" ";
        failtriger?.fire();
      }
      else {
        emailError="";
        passError="";
      }
    }
   }
   login(){
     idealTeddy();
   setState(() {
       ifEmpty();
       ifWrong();
       ifPasswordTrue();
   });
   }
   @override
  Widget build(BuildContext context) {
     double Height=MediaQuery.of(context).size.height;
     double Width=MediaQuery.of(context).size.width;
    return Column(
      children: [
        CircleAvatar(
          radius: 120,
          child: ClipOval(
            child: artboard!=null?
                 Rive(
              artboard: artboard!,
              fit: BoxFit.cover,
            )
                : CircularProgressIndicator(),
          ),
        ),buildSizedBox20(),
       Container(
         padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
         color: Color(0xffEDF1FC),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.end,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             TextFieldWidget(
               errorText: emailError,
               controller: emailCon,
               hintText: "Email Address",
               leadingIcon: Icons.email_outlined,size: 25,
               onTap: checking,
               onChanged: (value)=>moveEyes(value)),
             TextFieldWidget(
               result: true,controller: passCon,color:Colors.white,
               hintText: "Password",leadingIcon: Icons.lock_person,
               size: 25,trailingIcon: Icons.visibility_off,
               errorText: passError,
               onTap: handsUp,
               ),
             buildSizedBox(),
             GestureDetector(
               onTap:(){},
               child: const TextWidget(text: "Forgot Password",color: Colors.deepOrange,fontSize: 13,fontWeight: FontWeight.bold,),
             ),
             buildSizedBox(),
             ButtonWidget(title: "Login",onPress:(){login();},),
             buildSizedBox(),buildSizedBox20(),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 const TextWidget(text: "Don't have an account?",fontSize: 15,),
                 GestureDetector(
                   onTap: (){},
                   child: const TextWidget(text: " Register here",fontSize: 15,fontWeight: FontWeight.bold,color: Colors.deepOrange,),
                 ),
               ],
             ),
           ],
         ),
       )
      ],
    );
  }
}
SizedBox buildSizedBox20() => const SizedBox(height: 20,);