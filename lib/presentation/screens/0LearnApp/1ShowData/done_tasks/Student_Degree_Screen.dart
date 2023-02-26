import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../business_logic/0LearnApp_Cubit/1Exam_Cubit/Exam_Cubit.dart';
import '../../../../../business_logic/0LearnApp_Cubit/1Exam_Cubit/Exam_State.dart';
import '../../../../../data/models/3AddPost_Model/Posts_Model.dart';
import '../../../../../shared/styles/colors.dart';

class ShowStudentScreen extends StatelessWidget {
  // List? StudentDegree;
  PostModel? AllData;
  String? UserEmail;

  ShowStudentScreen({required this.AllData, required this.UserEmail});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExamCubit()..ArangmentStudentDegree(data: AllData!.Users),
      child: BlocBuilder<ExamCubit, HomeStates>(
        builder: (context, state) {
          ExamCubit cubit = ExamCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              // backgroundColor: ColorManager.defaultColor,
              title: Center(
                  child: Text(
                "ترتيب الطلاب",
                style: TextStyle(
                  color: ColorManager.defaultBlack,
                  fontSize: 30,
                ),
              )),
            ),
            body: ConditionalBuilder(
              condition: cubit.ArangmentUsers!.length > 0,
              builder: (context) => ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: InkWell(
                        onTap: () {
                          print(UserEmail.toString());
                        },
                        child: Card(
                          color: Colors.white70,
                          child: ListTile(
                            tileColor: cubit.ArangmentUsers![index]["name"]
                                        .toString() ==
                                    UserEmail.toString()
                                ? ColorManager.defaultRedColor2
                                : ColorManager.defaultwhiteColor3,
                            title: Text(
                              cubit.ArangmentUsers![index]["name"].toString(),
                              // cubit.ArangmentUsers.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Icon(Icons.how_to_reg_sharp)),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Text(
                                    "  ${cubit.ArangmentUsers![index]["degree"].toString()} ",
                                    style: TextStyle(
                                      color: ColorManager.defaultBlack,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            leading: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                color: ColorManager.defaultBlack,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            iconColor: ColorManager.defaultBlack,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 20.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                ),
                // itemCount: cubit.Users!.length,
                itemCount: cubit.ArangmentUsers!.length,
              ),
              fallback: (context) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.menu,
                      size: 100.0,
                      color: Colors.grey,
                    ),
                    Text(
                      'No Student',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
