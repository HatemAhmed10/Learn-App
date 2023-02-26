import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eldaheeh/data/models/3AddPost_Model/Posts_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../business_logic/0LearnApp_Cubit/1Exam_Cubit/Exam_Cubit.dart';
import '../../../../business_logic/0LearnApp_Cubit/1Exam_Cubit/Exam_State.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/styles/colors.dart';
import '../1ShowData/1HomeExam.dart';

class Solve_Screen extends StatelessWidget {
  String? IdOfExam;
  String? TitleOfExam;
  String? StudentEmail;
  PostModel? AllData;

  Solve_Screen(
      {required this.IdOfExam,
      required this.TitleOfExam,
      required this.StudentEmail,
      required this.AllData});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExamCubit()
        ..changeIndex(index: 0, StudEmail: StudentEmail.toString())
        ..GetExame(IdPosts: IdOfExam.toString()),
      child: BlocBuilder<ExamCubit, HomeStates>(
        builder: (context, state) {
          ExamCubit cubit = ExamCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 83,
              title: Text(
                TitleOfExam.toString(),
                // style: TextStyle(color: ColorManager.defaultColor),
              ),
              actions: [
                Icon(
                  Icons.info_rounded,
                  // color: ColorManager.defaultColor,
                ),
                SizedBox(
                  width: 20,
                ),
              ],
              // foregroundColor: ColorManager.defaultColor,
              centerTitle: true,
              // backgroundColor: Colors.white,
            ),
            body: ConditionalBuilder(
              condition: state is! GetExamLoadingState,
              // condition: 2 > 1,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          // color: Colors.red,
                          width: double.infinity,
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    "Question ${cubit.Qindex + 1}/${cubit.Question.length}",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 190, 172, 9),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 10, bottom: 15),
                                  child: Text(
                                    cubit.Question[cubit.Qindex].toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // color: Colors.yellow,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Container(
                                  color: cubit.FAnswer == "A"
                                      ? ColorManager.defaultRedColor2
                                      : ColorManager.white,
                                  child: RadioListTile(
                                      activeColor: Colors.white,
                                      selected: cubit.FAnswer == "A",
                                      isThreeLine: false,
                                      title: Text(
                                        cubit.Answer[cubit.Qindex]
                                                ["Q${cubit.Qindex + 1}"][0]
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      value: "A",
                                      groupValue: cubit.FAnswer,
                                      onChanged: (value) {
                                        cubit.ChoiseAnswer(value.toString());
                                      }),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Container(
                                  color: cubit.FAnswer == "B"
                                      ? ColorManager.defaultRedColor2
                                      : ColorManager.white,
                                  child: RadioListTile(
                                      activeColor: Colors.white,
                                      selected: cubit.FAnswer == "B",
                                      isThreeLine: false,
                                      title: Text(
                                        cubit.Answer[cubit.Qindex]
                                                ["Q${cubit.Qindex + 1}"][1]
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      value: "B",
                                      groupValue: cubit.FAnswer,
                                      onChanged: (value) {
                                        cubit.ChoiseAnswer(value.toString());
                                      }),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Container(
                                  color: cubit.FAnswer == "C"
                                      ? ColorManager.defaultRedColor2
                                      : ColorManager.white,
                                  child: RadioListTile(
                                      activeColor: Colors.white,
                                      selected: cubit.FAnswer == "C",
                                      isThreeLine: false,
                                      title: Text(
                                        cubit.Answer[cubit.Qindex]
                                                ["Q${cubit.Qindex + 1}"][2]
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      value: "C",
                                      groupValue: cubit.FAnswer,
                                      onChanged: (value) {
                                        cubit.ChoiseAnswer(value.toString());
                                      }),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                      cubit.Answer == null
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                width: double.infinity,
                                height: 60,
                                alignment: Alignment.center,
                                color: cubit.FAnswer == null
                                    ? cubit.isDark == true
                                        ? HexColor('333739')
                                        : Colors.white
                                    : ColorManager.defaultRedColor2,
                                child: MaterialButton(
                                    minWidth: double.infinity,
                                    height: double.infinity,
                                    child: Text(
                                      "التالي",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (cubit.FAnswer == null) {
                                        showToast(
                                            text: "اختار الاجابه",
                                            state: ToastStates.ERROR);
                                      } else {
                                        if (cubit.Qindex + 1 ==
                                            cubit.Question.length) {
                                          cubit.ChangeIndexOFQuestion();
                                          cubit.ComberBetwentowAnswer();
                                          cubit.UpdateUsersInExames(
                                              postModel: AllData!,
                                              StudentEmail:
                                                  StudentEmail.toString(),
                                              Degree: cubit.degree,
                                              PostID: IdOfExam.toString());
                                          navigateAndFinish(
                                              context,
                                              HomeExam_Screen(
                                                UserEmail:
                                                    StudentEmail.toString(),
                                              ));

                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              backgroundColor:
                                                  ColorManager.defaultRedColor2,
                                              title: Center(
                                                  child: Text(
                                                'نتيجه الاختبار',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              )),
                                              titlePadding: EdgeInsets.only(
                                                  left: 70,
                                                  right: 70,
                                                  bottom: 20,
                                                  top: 10),
                                              content: Container(
                                                color: ColorManager
                                                    .defaultRedColor2,
                                                height: 300,
                                                width: 200,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "لقد حصلت علي ${cubit.degree} من ${cubit.CorrectAnswer.length}",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                              child: Text(
                                                            "الاجابات",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          )),
                                                          Expanded(
                                                              child: Text(
                                                            "اجباتك",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ))
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            height: 300,
                                                            width: 100,
                                                            child: ListView
                                                                .builder(
                                                              itemBuilder: (BuildContext
                                                                          context,
                                                                      int index) =>
                                                                  Container(
                                                                child: Text(
                                                                  "${(index + 1).toString()}) \t${cubit.CorrectAnswer[index]} -->",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                              ),
                                                              itemCount: cubit
                                                                  .CorrectAnswer
                                                                  .length,
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 10,
                                                            height: 500,
                                                            color: ColorManager
                                                                .defaultBlack,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Container(
                                                            height: 300,
                                                            width: 100,
                                                            child: ListView
                                                                .builder(
                                                              itemBuilder: (BuildContext
                                                                          context,
                                                                      int
                                                                          index) =>
                                                                  cubit.CorrectAnswer[
                                                                              index] ==
                                                                          cubit.AllFInalAnswer[
                                                                              index]
                                                                      ? Container(
                                                                          color:
                                                                              ColorManager.defaultRedColor2,
                                                                          child:
                                                                              Text(
                                                                            cubit.AllFInalAnswer[index],
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.w700,
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : Container(
                                                                          color:
                                                                              Colors.black,
                                                                          child:
                                                                              Text(
                                                                            cubit.AllFInalAnswer[index],
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.w700,
                                                                            ),
                                                                          ),
                                                                        ),
                                                              itemCount: cubit
                                                                  .CorrectAnswer
                                                                  .length,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context, 'OK');
                                                  },
                                                  child: Text(
                                                    'OK',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          cubit.ChangeIndexOFQuestion();
                                        }
                                      }
                                    }),
                              ),
                            ),
                    ],
                  ),
                ),
              ),

              fallback: (context) => Center(
                  child: CircularProgressIndicator(
                color: ColorManager.defaultRedColor2,
              )),
            ),
          );
        },
      ),
    );
  }
}
