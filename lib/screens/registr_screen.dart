import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_quiz_app/global_widgets/custom_text_button.dart';
import 'package:my_quiz_app/global_widgets/custom_text_field.dart';
import 'package:my_quiz_app/global_widgets/flutter_toast.dart';
import 'package:my_quiz_app/screens/quiz_select_screen.dart';
import 'package:my_quiz_app/utils/my_fonts.dart';

import '../global_widgets/custom_app_bar.dart';
import '../utils/my_colors.dart';
import '../utils/my_images.dart';

class RegistrScreen extends StatefulWidget {
  const RegistrScreen({Key? key}) : super(key: key);

  @override
  State<RegistrScreen> createState() => _RegistrScreenState();
}

class _RegistrScreenState extends State<RegistrScreen> {
  TextEditingController phoneNumberTextFieldController =
      TextEditingController();
  TextEditingController passwordTextFieldController = TextEditingController();
  TextEditingController confirmPasswordTextFieldController =
      TextEditingController();
  FocusNode phoneNumberFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  void initState() {
    ShowToast.getMyToast(message: "Let's registrate");
    super.initState();
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    passwordTextFieldController.dispose();
    confirmPasswordTextFieldController.dispose();
    phoneNumberTextFieldController.dispose();
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
      appBar: const CustomAppBar(
        title: "Register",
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
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
                  height: 45.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 22.w,
                    vertical: 10.h,
                  ),
                  child: CustomTextField(
                    focusNode: phoneNumberFocusNode,
                    onChanged: (value) {},
                    controller: phoneNumberTextFieldController,
                    hintText: "Enter your mobile phone number",
                    inputType: TextInputType.phone,
                    isPassword: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 22.w,
                    vertical: 10.h,
                  ),
                  child: CustomTextField(
                    focusNode: passwordFocusNode,
                    onChanged: (value) {},
                    controller: passwordTextFieldController,
                    hintText: "Password",
                    inputType: TextInputType.text,
                    isPassword: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 22.w,
                    vertical: 10.h,
                  ),
                  child: CustomTextField(
                    focusNode: confirmPasswordFocusNode,
                    onChanged: (value) {},
                    controller: confirmPasswordTextFieldController,
                    hintText: "Confirm Password",
                    inputType: TextInputType.text,
                    isPassword: true,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: CustomTextButton(
                    color: MyColors.cFCA82F,
                    height: 70,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuizSelectScreen(),
                        ),
                      );
                    },
                    title: "Register",
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "if you have already account click here",
                  style: MyFonts.w400.copyWith(
                    color: MyColors.cD4D4D4,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
