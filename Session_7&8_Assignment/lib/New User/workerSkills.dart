import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fypkonnectjob/Models/workerModel.dart';
import 'package:fypkonnectjob/constant/toastWidget.dart';
import 'package:fypkonnectjob/functions/navigator.dart';
import 'package:fypkonnectjob/screens/homeworker.dart';
import 'package:fypkonnectjob/widgets/containerBlue.dart';
import '../Models/workerCategory.dart';
import '../constant/constvalue.dart';
import '../widgets/Text_Widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/check_box.dart';
import '../widgets/custom_appBar.dart';
import '../widgets/text_field_widget.dart';

class SelectSkills extends StatefulWidget {
  const SelectSkills({super.key,
    required this.phoneNumber,
    required this.userType,
     required this.imageURL,
     required this.name,
     required this.cnicNumber,
    required this.country,
    required this.province,
    required this.city
  });

  final String phoneNumber;
  final String userType;
  final String imageURL;
  final String name;
  final  String cnicNumber;
  final String country;
  final String province;
  final String city;
  @override
  State<SelectSkills> createState() => _SelectSkillsState();
}
final TextEditingController _hourBasePayment=TextEditingController();

class _SelectSkillsState extends State<SelectSkills> {
  List<String> cateIndex = [];
  List<String> hireCateIndex = [];
  String? selectedExp;
  void addCateToList(String idx, bool isHire) {
    isHire
        ? hireCateIndex.contains(idx)
        ? hireCateIndex.remove(idx)
        : hireCateIndex.add(idx)
        : cateIndex.contains(idx)
        ? cateIndex.remove(idx)
        : cateIndex.add(idx);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint(widget.phoneNumber);
    debugPrint(widget.userType);
    debugPrint(widget.imageURL);
    debugPrint(widget.name);
    debugPrint(widget.cnicNumber);
    debugPrint(widget.country);
    debugPrint(widget.province);
    debugPrint(widget.city);

  }
  bool loading=false;
  String? _selectedItem;
  // List of items for the dropdown
  List<String> items = ['1 year', '2 years', '3 years ', '4 years', '5 years','6 years','7 years','8 years','9 years','10 years','10+ years'];

Future uploadData() async{
  WorkerModel().addWorker(WorkerModel(
    phoneNumber: widget.phoneNumber,
    userType: widget.userType,
    imageUrl: widget.imageURL,
    userName: widget.name,
    userCNIC: widget.cnicNumber,
    country: widget.country,
    province: widget.province,
    city: widget.city,
    workExperience: _selectedItem,
    perDayCharges: _hourBasePayment.text,
    skillList: cateIndex
  ));
}
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return  Scaffold(
       backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: "Signup",),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlueContainer(
              height: mediaQuery.size.height*(0.3-0.06),
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    value: _selectedItem,
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    menuMaxHeight: 200,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue;

                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                      labelText: "Select Experience",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox10,
                  TextFieldWidget(controller: _hourBasePayment,hintText: "Enter your 8 hour payment",textInputType: TextInputType.number,),
                ],
              ),
            ),
            SizedBox10,SizedBox10,
            const TextWidget(text: "Choose Category",fontSize: 15,fontWeight: FontWeight.bold,),
            Container(
              margin:  const EdgeInsets.symmetric(horizontal: 5),
              padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 10.0),
              child: Column(
                children: [
                  SizedBox10,
                  BlueContainer(
                    height: mediaQuery.size.height*0.4,
                    color: const Color(0xffEDF1FC),
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: WorkerCategory.workerCategories.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => addCateToList(
                                WorkerCategory.workerCategories[index].titile,
                                false),
                            child: CheckBoxTile(
                                WorkerCategory.workerCategories[index].titile,
                                cateIndex.contains(WorkerCategory
                                    .workerCategories[index].titile)),
                          );
                        }),
                  ),
                  SizedBox10,
                  ButtonWidget(onPress: (){
                    debugPrint(cateIndex.length.toString());
                    setState(() {
                      loading =true;
                    });
                    uploadData().whenComplete(() {
                      setState(() {
                        loading=false;
                      });
                      ToastFn(context, "Successfully stored!", Colors.green, Icons.check_circle);
                      Future.delayed(const Duration(seconds: 3), () {
                        navigatorFunction(context, JobHomeScreen());
                      });
                    });
                    },title: "Next",)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
