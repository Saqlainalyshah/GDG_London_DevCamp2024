import 'package:cloud_firestore/cloud_firestore.dart';

class ClientModel {
  ClientModel({
    this.userType,
    this.phoneNumber,
    this.imageUrl,
    this.userName,
    this.userCNIC,
    this.country,
    this.province,
    this.city,
  });

  String? userType;
  String? phoneNumber;
  String? imageUrl;
  String? userName;
  String? userCNIC;
  String? country;
  String? province;
  String? city;



  CollectionReference db = FirebaseFirestore.instance.collection("Client");

  Future <void> addClient(ClientModel addClientModel) async {
    Map<String, dynamic> data = {
      "userType": addClientModel.userType,
      "phoneNumber": addClientModel.phoneNumber,
      "imageUrl":addClientModel.imageUrl,
      "userName": addClientModel.userName,
      "userCNIC": addClientModel.userCNIC,
      "country": addClientModel.country,
      "province": addClientModel.province,
      "city": addClientModel.city,
    };
    await db.add(data);
  }

  Future <void> updatedClient(String id, ClientModel updateClientModel) async {
    Map<String, dynamic> data = {
      "userType": updateClientModel.userType,
      "phoneNumber": updateClientModel.phoneNumber,
      "userName": updateClientModel.userName,
      "userCNIC": updateClientModel.userCNIC,
      "country": updateClientModel.country,
      "province": updateClientModel.province,
      "city": updateClientModel.city,
    };
    await db.doc(id).update(data);
  }

  Future <void> deleteClient(String id) async {
    await db.doc(id).delete();
  }
}