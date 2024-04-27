import 'package:eatfud/constant/constant.dart';
import 'package:eatfud/controller/provider/auth_provider/auth_provider.dart';
import 'package:eatfud/view/authScreens/mobile_login_screen.dart';
import 'package:eatfud/view/authScreens/otp_screen.dart';
import 'package:eatfud/view/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:eatfud/view/splash/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MobileAuthServices {
  static bool checkAuthentication(BuildContext context) {
    User? user = auth.currentUser;

    if (user == null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MobileLoginScreen()),
          (route) => false);
      return false;
    }

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavBar()),
        (route) => false);

    return true;
  }

  static recieveOTP(
      {required BuildContext context, required String mobileNo}) async {
    print("MOB>>>>> ${mobileNo}");
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${mobileNo}",
      verificationCompleted: (PhoneAuthCredential credential) {
        print(credential.toString());
      },
      verificationFailed: (FirebaseAuthException exception) {
        print(exception.toString());
        throw Exception(exception);
      },
      codeSent: (String verificationID, int? resendToken) {
        context.read<MobileAuthProvider>().updateVerificationID(verificationID);
        Navigator.push(
            context,
            PageTransition(
                child: const OTPScreen(),
                type: PageTransitionType.rightToLeft));
      },
      codeAutoRetrievalTimeout: (String verificationID) {},
    );
  }

  static verifyOTP({required BuildContext context, required String otp}) async {
    print("MOB>> verifyOTP ${otp}");
    try {
      print(
          "MOB>>> here 0 ${context.read<MobileAuthProvider>().verificationId} ");
      print(
          "MOB>>> here 0 0 ${context.read<MobileAuthProvider>().verificationId} ");
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: context.read<MobileAuthProvider>().verificationId!,
          smsCode: otp);
      print("MOB>>> here");
      await auth.signInWithCredential(credential);
      print("MOB>>> here 2");
      Navigator.push(
          context,
          PageTransition(
              child: SplashScreen(), type: PageTransitionType.rightToLeft));
    } catch (e) {
      print("MOB>>> error ${e.toString()}");
      //throw Exception(e);
    }
  }
}
