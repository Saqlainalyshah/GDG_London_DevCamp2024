import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constant/toastWidget.dart';
class DataBaseServices {
  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  static Future<void> addWorkerData({
    required String userType,
    required BuildContext context,
    required String phoneNumber,
    required String name,
    required String cnic,
    required String country,
    required String province,
    required String city,
    required List<String> skills,
  }) async {
    try {
      await firebaseFirestore.collection("Worker").add({
        'userType':userType,
        'phoneNumber': phoneNumber,
        'Name': name,
        'CNIC': cnic,
        'Country': country,
        'Province': province,
        'City': city,
        'Skills': skills,
      }).whenComplete(() =>
          ToastFn(context,"Great! Successfully added!",Colors.green,Icons.check_circle)
      ).catchError((e){
        ToastFn(context,"Something went wrong.Try again!",Colors.red,Icons.error);
      });
      print('Worker data added successfully');
    } catch (e) {
      print('Error adding worker data: $e');
    }
  }


}

