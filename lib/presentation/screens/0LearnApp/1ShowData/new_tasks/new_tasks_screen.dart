import 'dart:math';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eldaheeh/shared/styles/colors.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../business_logic/0LearnApp_Cubit/1Exam_Cubit/Exam_Cubit.dart';
import '../../../../../business_logic/0LearnApp_Cubit/1Exam_Cubit/Exam_State.dart';
import '../../../../../shared/components/components.dart';
import '../../../../../shared/styles/assets_manager.dart';
import '../../3SolveExam/solve_Screen.dart';
import 'package:getwidget/getwidget.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamCubit, HomeStates>(
      builder: (context, state) {
        ExamCubit cubit = ExamCubit.get(context);
        // var tasks = ExamCubit.get(context).NewExames;

        return ConditionalBuilder(
          condition: cubit.NewExames.length > 0,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: InkWell(
                    onTap: () {
                      navigateTo(
                          context,
                          Solve_Screen(
                            IdOfExam: cubit.NewExames[index].Id.toString(),
                            TitleOfExam:
                                cubit.NewExames[index].title.toString(),
                            StudentEmail: cubit.Email,
                            AllData: cubit.NewExames[index],
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
                        titleText: cubit.NewExames[index].title.toString(),
                        subTitleText: cubit.NewExames[index].desc.toString(),
                      ),
                      // content:
                      //     Text("Some quick example text to build on the card"),

                      // buttonBar: GFButtonBar(
                      //   children: <Widget>[
                      //     // GFAvatar(
                      //     //   backgroundColor: GFColors.DANGER,
                      //     //   child: Icon(
                      //     //     Icons.transit_enterexit,
                      //     //     color: Colors.white,
                      //     //   ),
                      //     // ),
                      //     // GFAvatar(
                      //     //   backgroundColor: GFColors.DARK,
                      //     //   child: Icon(
                      //     //     Icons.home,
                      //     //     color: Colors.white,
                      //     //   ),
                      //     // ),
                      //     // GFAvatar(
                      //     //   backgroundColor: GFColors.DANGER,
                      //     //   child: Icon(
                      //     //     Icons.help,
                      //     //     color: Colors.white,
                      //     //   ),
                      //     // ),
                      //   ],
                      // ),
                      //   // color: Colors.white70,
                      //   child: ListTile(
                      //     title: Column(
                      //       children: [
                      //         Text(
                      //           cubit.NewExames[index].title.toString(),
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 20,
                      //             fontWeight: FontWeight.w700,
                      //           ),
                      //         ),
                      //         Image(image: AssetImage(ImageAssets.LearnLogo2)),
                      //       ],
                      //     ),
                      //     subtitle: Row(
                      //       children: [
                      //         Expanded(
                      //             flex: 1,
                      //             child: cubit.MyIcons[Random().nextInt(10)]),
                      //         SizedBox(
                      //           width: 10,
                      //         ),
                      //         Expanded(
                      //             flex: 10,
                      //             child: Text(
                      //                 "${cubit.NewExames[index].desc.toString()}")),
                      //       ],
                      //     ),

                      //     leading: cubit.MyIcons[Random().nextInt(10)],
                      //     iconColor: ColorManager.defaultColor,
                      //   ),
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
                height: 2.0,
                color: ColorManager.defaultRedColor2,
              ),
            ),
            itemCount: cubit.NewExames.length,
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
                  'لا يوجد امتحانات الان',
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
