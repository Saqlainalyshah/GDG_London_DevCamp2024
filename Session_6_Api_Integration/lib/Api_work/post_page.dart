import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'jsonApi.dart';

class PostPage extends StatefulWidget {
   PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
   final TextEditingController nameC=TextEditingController();
   final TextEditingController jobC=TextEditingController();
   UserModel? usermodel;
   @override
  Widget build(BuildContext context) {
    clearCon(){
      nameC.clear();
      jobC.clear();
    }
    //String url = "https://randomuser.me/api";
    Future<UserModel?> postData(String Name, String Job) async {
      UserModel? user;
      final url = "https://reqres.in/api/users";
        http.Response response = await http.post(Uri.parse(url),
            body: {
          "name": Name,
          "job": Job,
        });
        var jsonRes= await json.decode(response.body);
         user=UserModel.fromJson(jsonRes);
        return user;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Api"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 100.0),
        child: Column(
          children: [
            TextField(
              controller: nameC,
              decoration: const InputDecoration(
                hintText: "First Name",
                contentPadding: EdgeInsets.all(5.0),
              ),
            ),
            const  SizedBox(height: 10.0,),
            TextField(

              controller: jobC,
              decoration: const InputDecoration(
                hintText: "Last Name",
                contentPadding: EdgeInsets.all(5.0),
              ),
            ),
            GestureDetector(
              onTap: () async{
                    UserModel? user =await postData(nameC.text,jobC.text);
                   // print(user?.name);
                    setState(() {
                      usermodel= user;
                    });
              },
              child: Container(
                margin: const EdgeInsets.all(20.0),
                width: 200,height: 50,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Center(child: Text("Post Data",style: TextStyle(fontSize: 20),),),
              ),
            ),

           usermodel==null?CircularProgressIndicator(): Text("${usermodel?.name} is successfully created at time ${usermodel?.createAt}",style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
