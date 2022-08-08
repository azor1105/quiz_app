import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_quiz_app/global_widgets/quiz_item.dart';
import 'package:my_quiz_app/repository/get_fake_question_data.dart';
import 'package:my_quiz_app/models/question_item.dart';
import 'package:my_quiz_app/screens/quiz_screen.dart';
import '../utils/my_colors.dart';
import '../utils/my_images.dart';

class QuizSelectScreen extends StatefulWidget {
  const QuizSelectScreen({Key? key}) : super(key: key);

  @override
  State<QuizSelectScreen> createState() => _QuizSelectScreenState();
}

class _QuizSelectScreenState extends State<QuizSelectScreen> {
  List<QuestionItem> englishA1A2Test = GetFakeQuestionData.englishA1A2();
  List<QuestionItem> sportTest = GetFakeQuestionData.sportSet();
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
        title: Image.asset(
          MyImages.logo2,
          height: 60.h,
          width: 120.w,
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
              vertical: 15,
            ),
            child: Image.asset(
              MyImages.wallet,
              width: 50,
              color: MyColors.white,
            ),
          ),
        ],
      ),
      backgroundColor: MyColors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            QuizItemTable(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      dataQuestion: englishA1A2Test,
                      appBarTitle: "English A1-A2",
                    ),
                  ),
                );
              },
              level: "A1, A2",
              gradientColors: MyColors.redBar,
              direction: 1,
              imagePath: MyImages.book,
              subject: "English",
              questionsCount: englishA1A2Test.length,
            ),
            SizedBox(height: 15.h,),
            QuizItemTable(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      dataQuestion: sportTest,
                      appBarTitle: "Sport",
                    ),
                  ),
                );
              },
              level: "Simple",
              gradientColors: MyColors.redBar,
              direction: 2,
              imagePath: MyImages.book,
              subject: "PI",
              questionsCount: sportTest.length,
            ),
          ],
        ),
      ),
    );
  }
}
