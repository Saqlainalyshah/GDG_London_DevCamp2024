import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fypkonnectjob/screens/homeworker.dart';
import '../New User/usernumber.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigationFn();
  }
  decideRoute() async {
    // Check if a user is currently authenticated using Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;
    print("User: $user");

    if (user != null) {
      print("exist");
      try {
        // Fetch user data from Firestore using the user's UID
        var snapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        print("snapshot exists: ${snapshot.exists}");

        // Check if user data exists in Firestore
        if (snapshot.exists) {
          // Navigate to HomeScreen if user data exists
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const JobHomeScreen()),
          );
        } else {
          // Navigate to UserNumberClass if user data does not exist
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => UserNumberClass()),
          );
        }
      } catch (error) {
        // Handle errors that may occur during Firebase and Firestore operations
        print("Error fetching user data: $error");
        // Handle error, show error message, or navigate to an error screen.
      }
    }else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserNumberClass()),
      );

    }
  }


  navigationFn() {
    Future.delayed(const Duration(seconds: 3), () {
      decideRoute();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("assets/images/konnectJob.jpg"),
          ),
        ],
      ),
    );
  }
}
