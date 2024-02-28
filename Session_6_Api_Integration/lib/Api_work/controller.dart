import 'dart:convert';
import 'jsonApi.dart';
import 'package:http/http.dart' as http;
//Controller

Future<ApiUserModelClass> fetchData() async {
  String url = "https://randomuser.me/api/?results=50";
  http.Response response = await http.get(Uri.parse(url));
  Map<String, dynamic> jsonResponse = json.decode(response.body);
  print(jsonResponse.length);
  return ApiUserModelClass.fromJson(jsonResponse);
}
