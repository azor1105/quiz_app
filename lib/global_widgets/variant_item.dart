import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_quiz_app/utils/my_colors.dart';
import 'package:my_quiz_app/utils/my_fonts.dart';
import 'package:my_quiz_app/utils/my_images.dart';

class VariantItemTable extends StatelessWidget {
  const VariantItemTable({
    Key? key,
    required this.isSelected,
    required this.variantTitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: MyColors.white,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              variantTitle,
              style: MyFonts.w400,
            ),
            const Expanded(child: SizedBox(),),
            isSelected ? SvgPicture.asset(MyImages.tick, width: 40.w,height: 40.h,) : const SizedBox(),
          ],
        ),
      ),
    );
  }

  final bool isSelected;
  final String variantTitle;
  final VoidCallback onTap;
}
