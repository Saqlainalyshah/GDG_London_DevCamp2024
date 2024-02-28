import 'package:cloud_firestore/cloud_firestore.dart';

class JobModel {
  String? jobTitle;
  String? jobDescription;
  String? category;
  String? budget;
  String? workDuration;

  JobModel({
    this.jobTitle,
    this.jobDescription,
    this.category,
    this.budget,
    this.workDuration,

  });

  CollectionReference db = FirebaseFirestore.instance.collection("Jobs");

  Future <void> addJob(JobModel addJobModel) async {
    Map<String, dynamic> data = {
      "jobTitle": addJobModel.jobTitle,
      "jobDescription": addJobModel.jobDescription,
      "category":addJobModel.category,
      "budget": addJobModel.budget,
      "workDuration": addJobModel.workDuration,
    };
    await db.add(data);
  }

  Future <void> updatedJob(String id, JobModel updateJobModel) async {
    Map<String, dynamic> data = {
      "jobTitle": updateJobModel.jobTitle,
      "jobDescription": updateJobModel.jobDescription,
      "category":updateJobModel.category,
      "budget": updateJobModel.budget,
      "workDuration": updateJobModel.workDuration,
    };
    await db.doc(id).update(data);
  }

  Future <void> deleteClient(String id) async {
    await db.doc(id).delete();
  }
}