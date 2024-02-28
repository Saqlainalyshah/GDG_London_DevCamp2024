import 'dart:io';

import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fypkonnectjob/Models/clientModel.dart';
import 'package:fypkonnectjob/New%20User/workerSkills.dart';
import 'package:fypkonnectjob/constant/toastWidget.dart';
import 'package:fypkonnectjob/functions/navigator.dart';
import 'package:fypkonnectjob/screens/homeworker.dart';
import 'package:fypkonnectjob/widgets/containerBlue.dart';
import 'package:image_picker/image_picker.dart';
import '../constant/constvalue.dart';
import '../widgets/button_widget.dart';
import '../widgets/custom_appBar.dart';
import '../widgets/text_field_widget.dart';

class UserDetails extends StatefulWidget {
   UserDetails({super.key,
    required this.phoneNumber,
     required this.userType,
  });
  String phoneNumber;
  String userType;
  @override
  State<UserDetails> createState() => _UserDetailsState();
}
//Name and cnic controller
final TextEditingController _nameCon=TextEditingController();
final TextEditingController _cnicCon=TextEditingController();
class _UserDetailsState extends State<UserDetails> {

  bool loading=false;
  String name="";
  String cnicNumber="";
  String image="";
  String? selectedExp;
  ///csc picker

  String country="";
  String province="";
  String city="";
  String imageURL='';
  @override
  void initState() {
    super.initState();
    clearController();
  }
  clearController(){
    _nameCon.clear();
    _cnicCon.clear();
  }



  getValues(){
    name=_nameCon.text.toString();
    cnicNumber=_cnicCon.text.toString();
    country=country;
    province=province;
    city=city;
  }

  File? _image;

  final picker = ImagePicker();

  Future imagePicker() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      ToastFn(context, "Failed to select image", Colors.red, Icons.error);
    }
  }

  Future uploadImage(File _image,String country,String province,String city,String name,String cnicNumber) async {
    try {
      String imageID = name+widget.phoneNumber+DateTime.now().microsecond.toString();
      Reference reference =
      FirebaseStorage.instance.ref().child('images').child("$imageID");

      UploadTask uploadTask = reference.putFile(_image);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

      // Get the download URL after the image is uploaded
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
        print(downloadURL);
        setState(() {
          imageURL=downloadURL;
        });
      // Store the download URL in Firestore
       if(widget.userType=="Client"){
         ClientModel().addClient(ClientModel(
             userType: widget.userType,
             phoneNumber: widget.phoneNumber,
             imageUrl: imageURL,
             userName: name,
             userCNIC: cnicNumber,
             country: country,
             province: province,
             city: city));
         ToastFn(context, "Information successfully stored!", Colors.green, Icons.check);
         Future.delayed(const Duration(seconds: 2), () {
           navigatorFunction(context, JobHomeScreen());
         });
       } else{
         navigatorFunction(context, SelectSkills(
           phoneNumber: widget.phoneNumber,
           userType: widget.userType,
           imageURL: imageURL,
           name: name,
           cnicNumber: cnicNumber,
           country: country,
           province: province,
           city: city,
         ));
       }

    } catch (e) {
      ToastFn(context, "Failed to upload image", Colors.red, Icons.error);
    }
  }

  //post image



  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  const CustomAppBar(title: "Signup",),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.grey[200],
                  child: _image != null
                      ? ClipOval(
                          child: Image.file(
                            _image!,
                            height: 190,
                            width: 190,
                            fit: BoxFit.cover,
                    ),
                  )
                      : const Icon(
                    Icons.person,
                    size: 170,
                  ),
                ),
              ),
              Positioned(
                  left: mediaQuery.size.width*(0.6-0.06),
                  bottom: mediaQuery.size.width*(0.01),
                  child: GestureDetector(
                    onTap: () async{
                      imagePicker();
                    },
                    child: Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(30),
                          color:const Color(0xff0077B5),
                        ),
                        child: Icon(Icons.edit_note_sharp,color: Colors.white,size: 25,)),
                  ))

            ],),
            SizedBox10,SizedBox10,
            Center(
              child: BlueContainer(
                height: mediaQuery.size.height*0.6,
                child: Column(
                  children: [
                    SizedBox10,
                    TextFieldWidget(
                    onChanged: ( value){
                      setState(() {
                        name=_nameCon.text;
                      });
                    }
                    ,controller: _nameCon,hintText: "Name"),
                    SizedBox10,
                    TextFieldWidget(isCNIC: true,
                        onChanged: ( value){
                          setState(() {
                            cnicNumber=_cnicCon.text;
                          });
                        }
                    ,controller: _cnicCon,hintText: "CNIC Number"),
                    SizedBox10,
                    CSCPicker(
                      onCountryChanged: (value) {
                        setState(() {
                          country=value;
                          debugPrint(country);
                        });
                      },
                      ///triggers once state selected in dropdown
                      onStateChanged: (value) {
                        setState(() {
                          province=value.toString();
                          debugPrint(province);
                        });
                      },
                      ///triggers once city selected in dropdown
                      onCityChanged: (value) {
                        setState(() {
                          city=value.toString();
                          debugPrint(city);
                        });
                      },
                      layout: Layout.vertical,
                      ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                      flagState: CountryFlag.DISABLE,
                      ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                      dropdownDecoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                            width: 6.0,
                          )),
                      ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                      disabledDropdownDecoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                            width: 6.0,
                          )),
                      selectedItemStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                      ///DropdownDialog Item style [OPTIONAL PARAMETER]
                      dropdownItemStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      ///Dialog box radius [OPTIONAL PARAMETER]
                      dropdownDialogRadius: 10.0,
                      ///Search bar radius [OPTIONAL PARAMETER]
                      searchBarRadius: 10.0,
                    ),
                    SizedBox10,
                    ButtonWidget(onPress: () {
                      if(_nameCon.text.length>0 &&_cnicCon.text.length>14 && _image!=null){
                        clearController();
                        setState(() {
                          loading=true;
                        });
                         uploadImage(_image!,country,province,city,name,cnicNumber).whenComplete((){
                           setState(() {
                             _image=null;
                             loading=false;
                           });
                         });
                      }else{
                      ToastFn(context, "Something went wrong! Try again", Colors.red, Icons.error);
                      }
                  },isloading: loading ,title: "Continue",)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
