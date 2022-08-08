import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_quiz_app/utils/my_colors.dart';
import 'package:my_quiz_app/utils/my_fonts.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.color,
    required this.height,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: MyFonts.w400.copyWith(
              color: MyColors.white,
              fontSize: 23.sp,
            ),
          ),
        ),
      ),
    );
  }

  final double height;
  final Color color;
  final VoidCallback onPressed;
  final String title;
}
