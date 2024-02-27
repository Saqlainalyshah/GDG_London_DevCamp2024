 import 'dart:convert';
 import 'package:learning_app/mvc/model.dart';
 import 'package:http/http.dart' as http;
Future<UserDataModelClass> fetchData() async{
  String link="https://randomuser.me/api/?results=50";
  http.Response response=await http.get(Uri.parse(link));
 Map<String, dynamic> jsonResponse=  json.decode(response.body);
 return UserDataModelClass.fromJson(jsonResponse);
 }