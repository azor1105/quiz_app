import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:my_quiz_app/global_widgets/true_false_result_table.dart';
import 'package:my_quiz_app/utils/my_colors.dart';
import 'package:my_quiz_app/utils/my_fonts.dart';
import 'package:my_quiz_app/utils/my_images.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    Key? key,
    required this.trueSelectedAnswers,
    required this.selectedAnswers,
  }) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();

  final num trueSelectedAnswers;
  final List<bool> selectedAnswers;
}

class _ResultScreenState extends State<ResultScreen> {
  late String lottie;
  late String presentText;
  @override
  void initState() {
    if (widget.trueSelectedAnswers >= 90) {
      presentText = "Hah u r profi bro";
      lottie = MyImages.congratulation;
    } else if (widget.trueSelectedAnswers >= 60 &&
        widget.trueSelectedAnswers < 90) {
      lottie = MyImages.good;
      presentText = "Good job bro";
    } else {
      lottie = MyImages.bad;
      presentText = "Hmm try to be good";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.c6066D0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: MyColors.c6066D0,
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          "Result",
          style: MyFonts.w500.copyWith(
            color: MyColors.white,
            fontSize: 25.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Lottie.asset(
              lottie,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),
          Text(
            "$presentText: %${widget.trueSelectedAnswers}",
            style: MyFonts.w600.copyWith(fontSize: 25.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: widget.selectedAnswers.length,
              itemBuilder: (context, index) => TrueFalseResultTable(
                numberVariant: "${index+1}",
                success: widget.selectedAnswers[index],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
