import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fypkonnectjob/New%20User/userType.dart';
import '../New User/userotp.dart';
import '../constant/toastWidget.dart';
import '../functions/navigator.dart';

class FirebaseAuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> sendVerificationCode({
    required String phoneNumber,
    required String verificationId,
    required BuildContext context,
    required Widget screen,
    required Function(bool) setLoading, // Callback to update loading state
  }) async {
    // Set loading state to true
    setLoading(true);

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (_) {
          debugPrint("Verification Completed");
        },
        verificationFailed: (e) {
          // Set loading state to false on failure
          setLoading(false);
          ToastFn(context, "Oop's Verification Failed ${e}", Colors.red, Icons.error_outline_rounded);
          debugPrint(e.toString());
        },
        codeSent: (String verificationId, int? tokenCode) {
          // Set loading state to false after success
          setLoading(false);
          ToastFn(context, "Successfully sent the otp", Colors.green, Icons.check_circle);
          Future.delayed(const Duration(seconds: 3), () {
            navigatorFunction(context, UserOtp(verificationId: verificationId, phoneNumber: phoneNumber));
          });
        },
        codeAutoRetrievalTimeout: (e) {
          debugPrint(e.toString());
        },
      );
    } catch (error) {
      // Set loading state to false on any error
      setLoading(false);
      // Handle the error as needed
    }
  }

  static Future<void> verifyingPhoneNumber({
    required String verificationId,
    required String otpCode,
    required BuildContext context,
    required String phoneNumber,
    required Function(bool) setLoading,
    }) async{
    final auth = FirebaseAuth.instance;
    setLoading(true);
    try {
      print("try block");
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpCode,
      );
      await auth.signInWithCredential(credential).whenComplete((){
        debugPrint("Successfully completed!");
        setLoading(false);
      }).catchError((e){
        setLoading(false);
        print("Error during sign-in: $e");
        ToastFn(context, "Please enter correct OTP", Colors.red, Icons.error);
      });
      ToastFn(context, "Successfull", Colors.green, Icons.check_circle);
      Future.delayed(const Duration(seconds: 3),(){
        navigatorFunction(context,  JoinAs(
          phoneNumber: phoneNumber,
       // userType: phoneNumber,
        ));
      });
      // navigatorFunction(context, const UserPinSet());
    } catch (e) {
      print("Something went wrong");
    }

    }
}
