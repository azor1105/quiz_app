import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_quiz_app/global_widgets/custom_text_button.dart';
import 'package:my_quiz_app/global_widgets/expandable_question_container.dart';
import 'package:my_quiz_app/global_widgets/flutter_toast.dart';
import 'package:my_quiz_app/global_widgets/variant_item.dart';
import 'package:my_quiz_app/models/question_item.dart';
import 'package:my_quiz_app/screens/result_screen.dart';
import 'package:my_quiz_app/utils/my_fonts.dart';

import '../utils/my_colors.dart';
import '../utils/my_images.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    Key? key,
    required this.dataQuestion,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
  final List<QuestionItem> dataQuestion;
  final String appBarTitle;
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  String variantChoose = "";
  List<bool> choosedVariants = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leadingWidth: 50,
        backgroundColor: MyColors.c6066D0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset(
            MyImages.user,
            color: MyColors.white,
          ),
        ),
        title: Text(
          widget.appBarTitle,
          style: MyFonts.w500.copyWith(
            color: MyColors.white,
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: MyColors.c6066D0,
          statusBarIconBrightness: Brightness.light,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 12,
            ),
            child: Image.asset(
              MyImages.wallet,
              width: 50,
              color: MyColors.white,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35.h,
          ),
          ExpandableQuestionContainer(
            dataLength: widget.dataQuestion.length,
            questionNumber: currentQuestionIndex + 1,
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 33.w),
            child: Text(
              "Question - ${currentQuestionIndex + 1}",
              style: MyFonts.w400.copyWith(
                color: MyColors.c6066D0,
                fontSize: 30.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 33.w),
            child: Text(
              widget.dataQuestion[currentQuestionIndex].question,
              style: MyFonts.w400.copyWith(
                fontSize: 22.sp,
              ),
              maxLines: 3,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Expanded(
            flex: 4,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 33.w, right: 25.w),
                  child: Column(
                    children: [
                      VariantItemTable(
                        isSelected: variantChoose == "A",
                        variantTitle:
                            widget.dataQuestion[currentQuestionIndex].variant1,
                        onTap: () {
                          variantChoose = "A";
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      VariantItemTable(
                        isSelected: variantChoose == "B",
                        variantTitle:
                            widget.dataQuestion[currentQuestionIndex].variant2,
                        onTap: () {
                          variantChoose = "B";
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      VariantItemTable(
                        isSelected: variantChoose == "C",
                        variantTitle:
                            widget.dataQuestion[currentQuestionIndex].variant3,
                        onTap: () {
                          variantChoose = "C";
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      VariantItemTable(
                        isSelected: variantChoose == "D",
                        variantTitle:
                            widget.dataQuestion[currentQuestionIndex].variant4,
                        onTap: () {
                          variantChoose = "D";
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 28.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 68.w),
            child: CustomTextButton(
              color: MyColors.c6066D0,
              height: 70.h,
              onPressed: () {
                if (variantChoose != "") {
                  if (variantChoose ==
                      widget.dataQuestion[currentQuestionIndex].trueAnswer) {
                    choosedVariants.add(true);
                  } else {
                    choosedVariants.add(false);
                  }
                  if (currentQuestionIndex < widget.dataQuestion.length) {
                    currentQuestionIndex++;
                    variantChoose = "";
                    if (currentQuestionIndex == widget.dataQuestion.length) {
                      int trueAnswers = 0;
                      for (var element in choosedVariants) {if(element)trueAnswers++;}
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            trueSelectedAnswers: (trueAnswers / widget.dataQuestion.length) * 100,
                            selectedAnswers: choosedVariants,
                          ),
                        ),
                      );
                    } else {
                      setState(() {});
                    }
                  }
                } else {
                  ShowToast.getMyToast(message: "Please choose the variant");
                }
              },
              title: "NEXT QUESTIONS",
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
