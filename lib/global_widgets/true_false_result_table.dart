import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_quiz_app/utils/my_colors.dart';
import 'package:my_quiz_app/utils/my_fonts.dart';
import 'package:my_quiz_app/utils/my_images.dart';

class TrueFalseResultTable extends StatelessWidget {
  const TrueFalseResultTable({
    Key? key,
    required this.numberVariant,
    required this.success,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: MyColors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: 4,
            offset: const Offset(1, 3),
            color: Colors.grey.shade300,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Question: $numberVariant",
            style: MyFonts.w400,
          ),
          success
              ? Image.asset(
                  MyImages.success,
                  width: 40,
                  height: 40,
                )
              : Image.asset(
                  MyImages.mistake,
                  width: 40,
                  height: 40,
                ),
        ],
      ),
    );
  }

  final String numberVariant;
  final bool success;
}
