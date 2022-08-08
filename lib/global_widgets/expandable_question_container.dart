import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/my_colors.dart';
import '../utils/my_fonts.dart';

class ExpandableQuestionContainer extends StatelessWidget {
  const ExpandableQuestionContainer({
    Key? key,
    required this.dataLength,
    required this.questionNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      margin: EdgeInsets.symmetric(horizontal: 33.w),
      padding: EdgeInsets.all(13.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(1, 3),
            color: Colors.grey.shade300,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: MyColors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    offset: const Offset(1, 3),
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: questionNumber,
                    child: Container(
                      decoration: BoxDecoration(
                        color: MyColors.cFCA82F,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: dataLength - questionNumber,
                    child: const SizedBox(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            "$questionNumber/$dataLength",
            style: MyFonts.w400.copyWith(fontSize: 15.sp),
          ),
        ],
      ),
    );
  }

  final int questionNumber;
  final int dataLength;
}
