import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_quiz_app/global_widgets/custom_app_bar.dart';
import 'package:my_quiz_app/global_widgets/custom_text_button.dart';
import 'package:my_quiz_app/global_widgets/flutter_toast.dart';
import 'package:my_quiz_app/screens/registr_screen.dart';
import 'package:my_quiz_app/utils/my_fonts.dart';
import 'package:my_quiz_app/utils/my_images.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../utils/my_colors.dart';

class SmsScreen extends StatefulWidget {
  const SmsScreen({Key? key}) : super(key: key);

  @override
  State<SmsScreen> createState() => _SmsScreenState();
}

class _SmsScreenState extends State<SmsScreen> {
  TextEditingController smsController = TextEditingController();

  @override
  void dispose() {
    smsController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    ShowToast.getMyToast(message: "Enter sms code");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: MyColors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.white,
      appBar: const CustomAppBar(
        title: "Otp",
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Image.asset(
              MyImages.logo,
              height: 60.h,
              width: 120.w,
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              "Enter your 6 digit otp here",
              style: MyFonts.w400.copyWith(
                color: MyColors.cD4D4D4,
                fontSize: 25.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 82.w),
              child: PinFieldAutoFill(
                controller: smsController,
                decoration: UnderlineDecoration(
                  textStyle: MyFonts.w500,
                  colorBuilder: const FixedColorBuilder(MyColors.black),
                ),
                onCodeSubmitted: (value) {},
                onCodeChanged: (value) {},
              ),
            ),
            SizedBox(
              height: 46.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: CustomTextButton(
                color: MyColors.cFCA82F,
                height: 70,
                onPressed: () {
                  if (smsController.text.length == 6) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute( 
                        builder: (context) => const RegistrScreen(),
                      ),
                    );
                  } else {
                    ShowToast.getMyToast(message: "Invalid sms");
                  }
                },
                title: "Login",
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "login with social media",
              style: MyFonts.w500
                  .copyWith(color: MyColors.cD4D4D4, fontSize: 25.sp),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Image.asset(
              MyImages.passwordDecorationImg,
              height: 194.h,
              width: 194.w,
            ),
          ],
        ),
      ),
    );
  }
}
