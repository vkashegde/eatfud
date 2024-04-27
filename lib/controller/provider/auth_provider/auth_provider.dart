import 'package:flutter/material.dart';

class MobileAuthProvider extends ChangeNotifier {
  String? verificationId;
  String? mobileNo;
  updateVerificationID(String verifID) {
    print("MOB>> verif ID ${verifID}");
    verificationId = verifID;
    notifyListeners();
  }

  updateMobileNumber(String num) {
    mobileNo = num;
    notifyListeners();
  }
}
