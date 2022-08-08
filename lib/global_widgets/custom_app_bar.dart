import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_quiz_app/utils/my_colors.dart';
import 'package:my_quiz_app/utils/my_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize{
  const CustomAppBar({Key? key, required this.title,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: Text(title,style: MyFonts.w400.copyWith(fontSize: 24.sp),),
      backgroundColor: MyColors.white,
    );
  }

  final String title;
  
  @override
  Widget get child => throw UnimplementedError();
  
  @override
  Size get preferredSize => Size(double.infinity, 56.h);
}
