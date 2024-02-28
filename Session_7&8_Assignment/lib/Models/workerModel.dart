import 'package:cloud_firestore/cloud_firestore.dart';

class WorkerModel {
  String? userType;
  String? phoneNumber;
  String? imageUrl;
  String? userName;
  String? userCNIC;
  String? country;
  String? province;
  String? city;
  String? workExperience;
  String? perDayCharges;
  List<String>? skillList;

  WorkerModel({

    this.userType,
    this.phoneNumber,
    this.imageUrl,
    this.userName,
    this.userCNIC,
    this.country,
    this.province,
    this.city,
    this.workExperience,
    this.perDayCharges,
    this.skillList,

  });

  CollectionReference db = FirebaseFirestore.instance.collection("Worker");

  Future <void> addWorker(WorkerModel addWorkerModel) async {
    Map<String, dynamic> data = {
      "userType": addWorkerModel.userType,
      "phoneNumber": addWorkerModel.phoneNumber,
      "imageUrl":addWorkerModel.imageUrl,
      "userName": addWorkerModel.userName,
      "userCNIC": addWorkerModel.userCNIC,
      "country": addWorkerModel.country,
      "province": addWorkerModel.province,
      "city": addWorkerModel.city,
      "workExperience":addWorkerModel.workExperience,
      "perDayCharges":addWorkerModel.perDayCharges,
      "skillList":addWorkerModel.skillList,
    };
    await db.add(data);
  }

  Future <void> updateWorker(String id, WorkerModel updatedWorkerModel) async {
    Map<String, dynamic> data = {
      "userType": updatedWorkerModel.userType,
      "phoneNumber": updatedWorkerModel.phoneNumber,
      "userName": updatedWorkerModel.userName,
      "userCNIC": updatedWorkerModel.userCNIC,
      "country": updatedWorkerModel.country,
      "province": updatedWorkerModel.province,
      "city": updatedWorkerModel.city,
      "workExperience":updatedWorkerModel.workExperience,
      "perDayCharges":updatedWorkerModel.perDayCharges,
      "skillList":updatedWorkerModel.skillList
    };
    await db.doc(id).update(data);
  }

  Future <void> deleteClient(String id) async {
    await db.doc(id).delete();
  }
}