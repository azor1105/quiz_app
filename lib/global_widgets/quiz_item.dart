import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_quiz_app/utils/my_colors.dart';
import 'package:my_quiz_app/utils/my_fonts.dart';

class QuizItemTable extends StatelessWidget {
  const QuizItemTable({
    Key? key,
    required this.onTap,
    required this.gradientColors,
    required this.direction,
    required this.imagePath,
    required this.subject,
    required this.questionsCount,
    required this.level,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: gradientColors,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 12.h,
                    ),
                    child: Column(
                      crossAxisAlignment: direction == 1
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.end,
                      children: [
                        Text(
                          subject,
                          style: MyFonts.w500.copyWith(
                            color: MyColors.white,
                            fontSize: 34.sp,
                          ),
                        ),
                        Text(
                          "Level: $level",
                          style: MyFonts.w500.copyWith(
                            color: MyColors.white,
                            fontSize: 25.sp,
                          ),
                        ),
                        Text(
                          "Questions: $questionsCount",
                          style: MyFonts.w500.copyWith(
                            color: MyColors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          direction == 1
              ? Positioned(
                  top: 0,
                  right: 15,
                  child: Image.asset(
                    imagePath,
                    width: 100.w,
                    height: 100.h,
                  ),
                )
              : Positioned(
                  top: 0,
                  left: 15,
                  child: Image.asset(
                    imagePath,
                    width: 100.w,
                    height: 100.h,
                  ),
                ),
        ],
      ),
    );
  }

  final String level;
  final int direction;
  final String imagePath;
  final String subject;
  final int questionsCount;
  final List<Color> gradientColors;
  final VoidCallback onTap;
}
