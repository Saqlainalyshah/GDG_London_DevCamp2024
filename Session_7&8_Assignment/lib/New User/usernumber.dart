import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fypkonnectjob/New%20User/userotp.dart';
import 'package:fypkonnectjob/constant/phoneTextField.dart';
import 'package:fypkonnectjob/widgets/containerBlue.dart';
import 'package:fypkonnectjob/widgets/custom_appBar.dart';
import '../Services/Firebase auth.dart';
import '../constant/constvalue.dart';
import '../constant/toastWidget.dart';
import '../widgets/Text_Widget.dart';
import '../widgets/button_widget.dart';
class UserNumberClass extends StatefulWidget {
   UserNumberClass({super.key});

  @override
  State<UserNumberClass> createState() => _UserNumberClassState();
}
class _UserNumberClassState extends State<UserNumberClass> {
  String verificationId="";
  bool loading=false;
  final auth=FirebaseAuth.instance;

  final TextEditingController _numCon=TextEditingController();
  String phoneNumber="";
  String completePhoneNumber= "";
  Country selectedCountry= Country(
    phoneCode:"92", countryCode: "PK",
    e164Sc: 0, geographic: true,
    level: 1, name:"Pakistan" ,
    example: "Pakistan", displayName:"Pakistan" ,
    displayNameNoCountryCode:"PK" , e164Key: " ",
  );

  @override
  void initState() {
    super.initState();
    loading=false;
  }

  clearController(){
    _numCon.clear();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar:  const CustomAppBar(title: "Signup",),
      body:SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: mediaQuery.size.height*0.05,),
              const TextWidget(text: 'السَّلاَمُ عَلَيْكُمْ ',fontSize: 30,fontWeight: FontWeight.bold,),
              const TextWidget(text: 'A lil bit about yourself',fontSize: 15,),
              SizedBox(height: mediaQuery.size.height*0.1,),
              BlueContainer(
                height: mediaQuery.size.height*0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox10,
                    SizedBox10,
                    const TextWidget(text: "Let's get started! ",fontSize: 20,fontWeight: FontWeight.bold,),
                    SizedBox10,
                    const TextWidget(text: "Please Enter Your Mobile Number ",fontSize: 15,),
                    SizedBox10,
                    SizedBox10,
                    PhoneTextField(
                        controller: _numCon,
                        onChanged: (value){
                                 phoneNumber=value;
                                 setState(() {
                                   completePhoneNumber="+${selectedCountry.phoneCode}${phoneNumber}";
                                       });
                                    },
                                 ),
                    ButtonWidget(onPress: () async{
                     if( _numCon.text.length==10){
                       setState(() {
                         loading=true;
                       });
                       clearController();
                       FirebaseAuthServices.sendVerificationCode(
                           phoneNumber: completePhoneNumber,
                           verificationId: verificationId,
                           context: context,
                           screen: UserOtp(verificationId: verificationId,phoneNumber: completePhoneNumber,),
                           setLoading: (isLoading) {
                             setState(() {
                               loading = isLoading;
                             });
                           },
                       );
                     }else{

                       ToastFn(context,"Please enter phone number!",Colors.red,Icons.error);
                     }
                    },title: "Continue",isloading: loading,),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
