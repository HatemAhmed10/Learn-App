import 'dart:math';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eldaheeh/presentation/screens/0LearnApp/1ShowData/done_tasks/Student_Degree_Screen.dart';
import 'package:eldaheeh/shared/styles/colors.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/position/gf_position.dart';

import '../../../../../business_logic/0LearnApp_Cubit/1Exam_Cubit/Exam_Cubit.dart';
import '../../../../../business_logic/0LearnApp_Cubit/1Exam_Cubit/Exam_State.dart';
import '../../../../../shared/components/components.dart';
import '../../../../../shared/styles/assets_manager.dart';

class DoneTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamCubit, HomeStates>(
      builder: (context, state) {
        ExamCubit cubit = ExamCubit.get(context);

        // var tasks = ExamCubit.get(context).DoneExames;
        return ConditionalBuilder(
          condition: cubit.DoneExames.length > 0,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: InkWell(
                    onTap: () {
                      navigateTo(
                          context,
                          ShowStudentScreen(
                            AllData: cubit.DoneExames[index],
                            UserEmail: cubit.Email,
                          ));
                    },
                    child: GFCard(
                      color: cubit.isDark == true ? Colors.grey : Colors.white,
                      boxFit: BoxFit.cover,
                      titlePosition: GFPosition.start,
                      image: Image.asset(
                        ImageAssets.EldaheehLogo,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      showImage: true,
                      title: GFListTile(
                        avatar: GFAvatar(
                          size: 25,
                          backgroundColor: ColorManager.defaultRedColor2,
                          child: cubit.MyIcons[Random().nextInt(10)],
                        ),
                        titleText: cubit.DoneExames[index].title.toString(),
                        subTitleText: cubit.DoneExames[index].desc.toString(),
                      ),
                    ),
                    // child: Card(
                    //   color: Colors.white70,
                    //   child: ListTile(
                    //     title: Text(
                    //       tasks[index].title.toString(),
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.w700,
                    //       ),
                    //     ),
                    //     subtitle: Row(
                    //       children: [
                    //         Expanded(
                    //             flex: 1,
                    //             child: cubit.MyIcons[Random().nextInt(10)]),
                    //         Expanded(
                    //             flex: 10,
                    //             child: Text(
                    //                 cubit.DoneExames[index].desc.toString())),
                    //       ],
                    //     ),
                    //     leading: cubit.MyIcons[Random().nextInt(10)],
                    //     // iconColor: ColorManager.defaultColor,
                    //   ),
                    // ),
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
                height: 2.0,
                color: ColorManager.defaultRedColor2,
              ),
            ),
            itemCount: cubit.DoneExames.length,
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
                  "لم تحل اي امتحان حتي الان",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
