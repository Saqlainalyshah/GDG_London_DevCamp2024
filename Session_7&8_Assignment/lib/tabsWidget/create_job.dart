import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fypkonnectjob/Models/jobModel.dart';
import 'package:fypkonnectjob/constant/constvalue.dart';
import 'package:fypkonnectjob/constant/toastWidget.dart';
import 'package:fypkonnectjob/widgets/button_widget.dart';
import 'package:fypkonnectjob/widgets/containerBlue.dart';

import '../widgets/Text_Widget.dart';
import '../widgets/dropdown_widegt.dart';
import '../widgets/text_field_widget.dart';

class CreateJob extends StatefulWidget {
  const CreateJob({super.key});

  @override
  State<CreateJob> createState() => _CreateJobState();
}
 TextEditingController titleCon=TextEditingController();
TextEditingController descriptionCon=TextEditingController();
TextEditingController budgetCon=TextEditingController();
TextEditingController workDcon=TextEditingController();
 bool loading=false;
String selectedValue='';
List<String> categories=[
  "Select Category",
   "Cleaning",
   "Sweeping",
  "Digging",
  "Concrete mixing",
 "Carpenter",
 "Blacksmith",
   "Painter",
   "Plumber",
   "Electrician",
  "Marble Work",
];

Future uploadData() async{
  JobModel().addJob(JobModel(
      jobTitle:titleCon.text,
      jobDescription:descriptionCon.text,
      category: selectedValue,
      budget: selectedValue ,
      workDuration: workDcon.text
  ));
}
clearController(){
  titleCon.clear();
  descriptionCon.clear();
  budgetCon.clear();
  workDcon.clear();
}
class _CreateJobState extends State<CreateJob> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double height=mediaQuery.size.height * 0.3;
    double width=mediaQuery.size.width * 0.9;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: BlueContainer(
            height: mediaQuery.size.height*0.9,
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                const TextWidget(text: "Let's create a job opportunity! ",fontSize: 17,fontWeight: FontWeight.bold,),
                SizedBox10,
                TextFieldWidget(controller: titleCon,hintText: 'Enter the title of job',),
                SizedBox10,
                TextFormField(
              controller: descriptionCon,
              onChanged: (onChanged){},
              maxLines: 10, // Allows for multiline input
              decoration:  const InputDecoration(
                hintText: 'Enter your description here',
                errorText: "",
                contentPadding: EdgeInsets.all(12.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent
                  ),
                ),
                filled: true,
                fillColor: Colors.white, // Set your desired background color
              ),
            ),
                CustomDropdownButton(selectedValue: categories[0], dropdownItems: categories,
                  onChanged: (value){
                  setState(() {
                    setState(() {
                      selectedValue=value;
                      print(selectedValue);
                    });
                  });
                  },
                ),
                SizedBox10,
                TextFieldWidget(controller: budgetCon,textInputType: TextInputType.number,hintText: 'Enter Budget',),
                SizedBox10,
                TextFieldWidget(controller: workDcon,hintText: 'Work Duration',),
                SizedBox10,
                ButtonWidget(onPress: (){

                  if(titleCon.text.length>0 && descriptionCon.text.length>0
                  && selectedValue.length>0 && budgetCon.text.length>0 && workDcon.text.length>0){
                    setState(() {
                      loading=true;
                    });
                    uploadData().whenComplete(() {
                      clearController();
                      setState(() {
                        loading=false;
                      });
                      ToastFn(context, 'Post is successfully created!', Colors.green, Icons.check_circle);
                    }).catchError((){
                      ToastFn(context, 'Something went wrong! Try again!', Colors.red, Icons.error);

                        setState(() {
                          loading=false;
                        });
                    });
                  }else{
                    ToastFn(context, 'please fill the form!', Colors.red, Icons.error);
                  }
                },title: 'Create',),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
