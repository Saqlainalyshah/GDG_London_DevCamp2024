import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fypkonnectjob/New%20User/userDetails.dart';
import 'package:fypkonnectjob/constant/constvalue.dart';
import 'package:fypkonnectjob/functions/navigator.dart';
import 'package:fypkonnectjob/widgets/custom_appBar.dart';
import '../widgets/button_widget.dart';
import '../widgets/containerBlue.dart';

class JoinAs extends StatefulWidget {
  const JoinAs({super.key,
  required this.phoneNumber
  });
 final String phoneNumber;
  @override
  State<JoinAs> createState() => _JoinAsState();
}

class _JoinAsState extends State<JoinAs> {
   String userType="";

   bool buttonVisible=false;
   Color b1Color=const Color(0xFFDBDBDB);
   Color b1TitleColor=Colors.black;
   Color b2Color=const Color(0xFFDBDBDB);
   Color b2TitleColor=Colors.black;

   @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return   Scaffold(
      appBar: const CustomAppBar(title: "Join as",),
      body: Center(
        child: BlueContainer(
          height: mediaQuery.size.height*(0.2+0.03),
          child: Column(
            children: [
              ButtonWidget(onPress: (){
                setState(() {
                  userType="Client";
                  navigatorFunction(context, UserDetails(
                    phoneNumber: widget.phoneNumber,
                    userType: userType,
                  ));
                });
              },title: "Hire a worker",),
              SizedBox10,
              ButtonWidget(onPress: (){
                setState(() {
                  userType="Worker";
                  navigatorFunction(context, UserDetails(
                      phoneNumber: widget.phoneNumber,
                      userType: userType,
                  ));
                });
              },title: "Find a job",),

            ],
          ),
        ),
      ),
    );
  }
}
