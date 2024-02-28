import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'controller.dart';
import 'jsonApi.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    fetchData();

    super.initState();
  }
  @override



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Call App"),
        centerTitle: true,
      ),
      body: FutureBuilder<ApiUserModelClass>(
        future: fetchData(),
        builder: (context, AsyncSnapshot<ApiUserModelClass> snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.waiting)
          {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                color:  Colors.grey,
                backgroundColor: Colors.black,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            final userData = snapshot.data!;
            return ListView.builder(
              itemCount: userData.attributes?.length,
              itemBuilder: (context, index) {
                final user = userData.attributes![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("${user.image?.large}"),
                  ),
                  title: Text("${user.name?.fName} ${user.name?.lName}"),
                  subtitle: Text("${user.email}"),
                  trailing: GestureDetector(
                    child: Container(
                      width: 100,height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.blue
                      ),
                      child:  Center(child:  Text("Follow",style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}