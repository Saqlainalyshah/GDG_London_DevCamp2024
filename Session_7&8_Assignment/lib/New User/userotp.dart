import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fypkonnectjob/Services/Firebase%20auth.dart';
import 'package:fypkonnectjob/constant/toastWidget.dart';
import 'package:fypkonnectjob/widgets/containerBlue.dart';
import 'package:fypkonnectjob/widgets/custom_appBar.dart';
import '../constant/constvalue.dart';
import '../constant/textfieldbox.dart';
import '../widgets/Text_Widget.dart';
import '../widgets/button_widget.dart';

class UserOtp extends StatefulWidget {
  String verificationId;
  String phoneNumber;
   UserOtp({super.key,
     required this.verificationId,
     required this.phoneNumber,
  });

  @override
  State<UserOtp> createState() => _UserOtpState();
}

class _UserOtpState extends State<UserOtp> {
  final TextEditingController _otpCon1=TextEditingController();
  final TextEditingController _otpCon2=TextEditingController();
  final TextEditingController _otpCon3=TextEditingController();
  final TextEditingController _otpCon4=TextEditingController();
  final TextEditingController _otpCon5=TextEditingController();
  final TextEditingController _otpCon6=TextEditingController();
  String otpCode="";
  bool checkingFeilds=false;
  bool loading=false;

  @override

  void dispose() {
    // TODO: implement dispose
    _otpCon1.dispose();
    _otpCon2.dispose();
    _otpCon3.dispose();
    _otpCon4.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
  }
  clearController(){
    _otpCon1.clear();
    _otpCon2.clear();
    _otpCon3.clear();
    _otpCon4.clear();
    _otpCon5.clear();
    _otpCon6.clear();
  }
  checkControllers(){
    if(_otpCon1.text.length>0 && _otpCon2.text.length>0 && _otpCon2.text.length>0
        && _otpCon3.text.length>0 && _otpCon4.text.length>0 && _otpCon5.text.length>0 &&_otpCon6.text.length >0){
    setState(() {
      checkingFeilds=true;
    });
    }else{
      setState(() {
        checkingFeilds=false;
      });
    }
  }
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double height=mediaQuery.size.height * 0.3;
    double width=mediaQuery.size.width * 0.9;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:  const CustomAppBar(title: "Signup",),
      body: Center(
        child: BlueContainer(
          height: mediaQuery.size.height*0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(text:"A 6-digit code has been sent to your number",fontSize: 14,),
              SizedBox10,
               Center(child: TextWidget(text:"${widget.phoneNumber}",fontSize: 14,fontWeight: FontWeight.bold,)),
              SizedBox10,
              Row(
                children: [
                  TextFieldBox(controller: _otpCon1,obscuretxt: false,),
                  SizedBox(width: mediaQuery.size.width * 0.02),
                  TextFieldBox(controller: _otpCon2,obscuretxt: false,),
                  SizedBox(width: mediaQuery.size.width * 0.02),
                  TextFieldBox(controller: _otpCon3,obscuretxt: false,),
                  SizedBox(width: mediaQuery.size.width * 0.02),
                  TextFieldBox(controller: _otpCon4,obscuretxt: false,),
                  SizedBox(width: mediaQuery.size.width * 0.02),
                  TextFieldBox(controller: _otpCon5,obscuretxt: false,),
                  SizedBox(width: mediaQuery.size.width * 0.02),
                  TextFieldBox(controller: _otpCon6,obscuretxt: false,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextWidget(text: "Didn't you receive any code?",fontSize: 14,),
                  SizedBox(width: mediaQuery.size.width * 0.01),
                  const TextWidget(text: "Resend new code",color:Color(0xff1976D2),fontSize: 14,fontWeight: FontWeight.bold,)
                ],
              ),
              SizedBox10,
              ButtonWidget(onPress: () async {
                otpCode = _otpCon1.text.toString() + _otpCon2.text.toString() +
                    _otpCon3.text.toString() + _otpCon4.text.toString() +
                    _otpCon5.text.toString() + _otpCon6.text.toString();
               checkControllers();
               if(checkingFeilds==true){
                 clearController();
                 //Firebase request
                 FirebaseAuthServices.verifyingPhoneNumber(
                   verificationId: widget.verificationId,
                   otpCode: otpCode,
                   context: context,
                   phoneNumber: widget.phoneNumber,
                   setLoading: (isLoading) {
                     setState(() {
                       loading = isLoading;
                     });},);
               }else{
                 ToastFn(context, "Please enter OTP code!", Colors.red, Icons.error);
               }
              },
                title: "Verify",isloading: loading,)
            ],
          ),
        ),
      )

    );
  }
}
