import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_quiz_app/utils/my_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.onChanged,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.isPassword,
    required this.inputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 20.sp),
      obscureText: isPassword,
      keyboardType: inputType,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        hintStyle: TextStyle(color: MyColors.cD4D4D4, fontSize: 20.sp),
      ),
    );
  }

  final bool isPassword;
  final void Function(String)? onChanged;
  final TextInputType inputType;
  final FocusNode focusNode;
  final TextEditingController controller;
  final String hintText;
}
