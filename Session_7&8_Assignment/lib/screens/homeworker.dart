import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fypkonnectjob/tabsWidget/tabsWidget.dart';
import 'package:fypkonnectjob/widgets/jobContainer.dart';
import '../tabsWidget/create_job.dart';
import '../tabsWidget/google_map.dart';
import '../widgets/largeButton.dart';

class JobHomeScreen extends StatefulWidget {
  const JobHomeScreen({super.key});

  @override
  State<JobHomeScreen> createState() => _JobHomeScreenState();
}

class _JobHomeScreenState extends State<JobHomeScreen> {

  int _index=0;

  final tabsWidget=[
    Home(),
    CreateJob(),
    GoogleMapServices(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Job find',style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: tabsWidget[_index],
     bottomNavigationBar: BottomNavigationBar(
       iconSize: 25.0,
       currentIndex: _index,
       selectedItemColor: Colors.blueAccent,
       selectedFontSize: 14,
       selectedIconTheme: const IconThemeData(
          color: Colors.blueAccent,
       ),
       items: const [
         BottomNavigationBarItem(
           icon: Icon(
             Icons.home,color:  Colors.black,) ,
           label: "Home",),
         BottomNavigationBarItem(
           icon: Icon(Icons.add,
           color:  Colors.black,),
           label: "Create",),
         BottomNavigationBarItem(
             icon: Icon(Icons.location_on_sharp,
               color: Colors.black,)
             ,label: "Map"),
       ],
       onTap: (index){
         setState(() {
           _index=index;
         });
       },
     ),
    );
  }
}
