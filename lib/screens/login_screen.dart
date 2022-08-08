import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:my_quiz_app/global_widgets/custom_app_bar.dart';
import 'package:my_quiz_app/global_widgets/custom_text_button.dart';
import 'package:my_quiz_app/global_widgets/custom_text_field.dart';
import 'package:my_quiz_app/global_widgets/flutter_toast.dart';
import 'package:my_quiz_app/screens/sms_screen.dart';
import 'package:my_quiz_app/utils/my_colors.dart';
import 'package:my_quiz_app/utils/my_fonts.dart';
import 'package:my_quiz_app/utils/my_images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneNumberFieldController = TextEditingController();
  FocusNode phoneNumberFieldFocusNode = FocusNode();

  @override
  void dispose() {
    phoneNumberFieldController.dispose();
    phoneNumberFieldFocusNode.dispose();
    super.dispose();
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
      appBar: const CustomAppBar(title: "Login"),
      body: Column(
        children: [
          SizedBox(height: 21.h),
          Lottie.asset(MyImages.loginLottie),
          SizedBox(height: 26.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 31.w),
            child: CustomTextField(
              onChanged: (value) {
                if (value.length == 13) {
                  phoneNumberFieldFocusNode.unfocus();
                }
              },
              isPassword: false,
              inputType: TextInputType.phone,
              controller: phoneNumberFieldController,
              focusNode: phoneNumberFieldFocusNode,
              hintText: "Enter your mobile number",
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 46.w),
            child: CustomTextButton(
              color: MyColors.cFCA82F,
              height: 70,
              onPressed: () {
                if (phoneNumberFieldController.text.length == 13) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SmsScreen(),
                    ),
                  );
                } else {
                  ShowToast.getMyToast(message: "Wrong number");
                }
              },
              title: "Login",
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Text(
            "term’s and conditons apply",
            style:
                MyFonts.w400.copyWith(color: MyColors.cD4D4D4, fontSize: 15.sp),
          ),
          Text(
            "POWERD BY - sparrowdevops.com",
            style:
                MyFonts.w400.copyWith(color: MyColors.cD4D4D4, fontSize: 15.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
