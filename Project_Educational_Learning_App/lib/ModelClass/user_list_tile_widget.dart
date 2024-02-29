// Review: Remove unused code
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:learning_app/ModelClass/model_class.dart';
// import 'package:learning_app/mvc/controller.dart';
// import 'package:learning_app/mvc/model.dart';
// import 'package:learning_app/widgets/Text_Widget.dart';
// import '../screens/tutor_screen.dart';
//
// class UserListTileWidget extends StatelessWidget {
//   const UserListTileWidget({Key? key}) : super(key: key);
//
//
//   Future<UserModelClass> getData() async{
//     UserModelClass? userLists;
//     await Future.delayed(
//       const Duration(seconds: 3),
//     );
//     return userLists!;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double Width = MediaQuery.of(context).size.width;
//     double Height = MediaQuery.of(context).size.height;
//     return FutureBuilder<UserDataModelClass>(
//       future: fetchData(),
//       builder: (context, AsyncSnapshot<UserDataModelClass> snapshot){
//         if (snapshot.connectionState == ConnectionState.waiting)
//         {
//           return const Center(
//             child: CircularProgressIndicator(
//               strokeWidth: 2.0,
//               color:  Colors.grey,
//               backgroundColor: Colors.black,
//             ),
//           );
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text("Error: ${snapshot.error}"),
//           );
//         }
//         final userData = snapshot.data!;
//         print(userData.userAttributes?.length);
//       return ListView.builder(
//         scrollDirection: Axis.vertical,
//         itemCount: userData.userAttributes!.length,
//         itemBuilder: (context, index) {
//           final user = userData.userAttributes![index];
//           print(user);
//           return GestureDetector(
//             onTap: (){
//               Navigator.push(context,MaterialPageRoute(builder: (_){
//                 return TutorViewScreen();
//               }));
//             },
//             child: Card(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: Width*(2/8),
//                       height: Height*(0.1),
//                       decoration: BoxDecoration(
//                         borderRadius: const BorderRadius.only( topLeft: Radius.circular(15),
//                             bottomRight: Radius.circular(15),),
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: AssetImage("${user.userPicsModelClass?.madium}"),),
//                       ),
//                     ),
//                     Container(
//                       width: Width*(3/8),
//                      height: Height*(2/19),
//                      padding: const EdgeInsets.only(top: 20),
//                      margin: const EdgeInsets.only(left: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           TextWidget(text: "${user.nameModelClass?.firstName}", fontSize: 13,fontWeight: FontWeight.bold,),
//                           const SizedBox(height: 5,),
//                           TextWidget(text: "${user.userNameModelClass?.userName}",),
//                         ],
//                       ),
//                     ),
//                      Container(
//                       height: 30,width: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5.0),
//                         color: Colors.amber,
//                       ),
//                       child:const Center(child: Text("Follow"))
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       );}
//     );
//   }
// }
