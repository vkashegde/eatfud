import 'dart:async';

import 'package:eatfud/utils/colors.dart';
import 'package:eatfud/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController =
      StreamController<ErrorAnimationType>();
  int resendOTPCounter = 60;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      decreaseOTPCounter();
    });
  }

  decreaseOTPCounter() async {
    if (resendOTPCounter > 0) {
      setState(() {
        resendOTPCounter -= 1;
      });
      await Future.delayed(const Duration(seconds: 1), () {
        decreaseOTPCounter();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        children: [
          Positioned(
            left: 10.w,
            bottom: 3.h,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: greyShade3,
                    elevation: 2,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(1.h)),
                onPressed: () {},
                child: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  size: 3.h,
                  color: black,
                )),
          ),
          Positioned(
            right: 10.w,
            bottom: 3.h,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: greyShade3,
                    elevation: 2,
                    shape: StadiumBorder(),
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h)),
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "Next",
                      style: AppTextStyles.body14,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    FaIcon(
                      FontAwesomeIcons.arrowRight,
                      size: 3.h,
                      color: black,
                    ),
                  ],
                )),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        children: [
          SizedBox(height: 2.h),
          Text(
            "Enter the 4-digit code sent to you at 3847547899",
            style: AppTextStyles.body16,
          ),
          SizedBox(height: 3.h),
          PinCodeTextField(
            appContext: context,
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            textStyle: AppTextStyles.body14,
            pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: Colors.white,
                inactiveColor: greyShade3,
                inactiveFillColor: greyShade3,
                selectedFillColor: white,
                selectedColor: black,
                activeColor: black),
            animationDuration: Duration(milliseconds: 300),
            backgroundColor: transparent,
            enableActiveFill: true,
            errorAnimationController: errorController,
            controller: otpController,
            onCompleted: (v) {
              print("Completed");
            },
            onChanged: (value) {},
            beforeTextPaste: (text) {
              return true;
            },
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: greyShade3,
                  borderRadius: BorderRadius.circular(50.sp),
                ),
                child: Text(
                  "I havent recieved a code (0:${resendOTPCounter})",
                  style: AppTextStyles.small10
                      .copyWith(color: resendOTPCounter > 0 ? black38 : black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
