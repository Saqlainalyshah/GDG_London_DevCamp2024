import 'package:flutter/material.dart';
import 'package:learning_app/ModelClass/model_class.dart';
import 'package:learning_app/mvc/controller.dart';
import 'package:learning_app/mvc/model.dart';
import 'package:learning_app/widgets/Text_Widget.dart';
import '../screens/tutor_screen.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  Future<UserModelClass> getData() async {
    UserModelClass? userLists;
    await Future.delayed(
      const Duration(seconds: 3),
    );
    return userLists!;
  }

  @override
  Widget build(BuildContext context) {
    // Review: variable names and functions names should start with small case letter
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder<UserDataModelClass>(
        future: fetchData(),
        builder: (context, AsyncSnapshot<UserDataModelClass> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                color: Colors.grey,
                backgroundColor: Colors.black,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }
          final userData = snapshot.data!;
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: userData.userAttributes!.length,
            itemBuilder: (context, index) {
              final user = userData.userAttributes![index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return TutorViewScreen(
                          image: "${user.userPicsModelClass?.large}",
                          name:
                              "${user.nameModelClass?.firstName} ${user.nameModelClass?.lastName}",
                          username: "${user.userNameModelClass?.userName}",
                        );
                      },
                    ),
                  ); // Review: Give trailing comma to improve readability
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: Row(
                      children: [
                        // The user is not null, so we do not need check this condition
                        user != null
                            ? Container(
                                width: width * (2 / 8),
                                height: height * (0.1),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "${user.userPicsModelClass?.large}"),
                                  ),
                                ),
                              )
                            : const CircularProgressIndicator(
                                strokeWidth: 2.0,
                                color: Colors.grey,
                                backgroundColor: Colors.black,
                              ),
                        Container(
                          width: width * (3 / 8),
                          height: height * (2 / 19),
                          padding: const EdgeInsets.only(top: 20),
                          margin: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "${user.nameModelClass?.firstName}",
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextWidget(
                                text: "${user.userNameModelClass?.userName}",
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.amber,
                            ),
                            child: const Center(child: Text("Follow"))),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
