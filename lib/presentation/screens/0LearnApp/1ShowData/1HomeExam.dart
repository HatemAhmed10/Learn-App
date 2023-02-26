import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eldaheeh/shared/styles/colors.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../business_logic/0LearnApp_Cubit/1Exam_Cubit/Exam_Cubit.dart';
import '../../../../business_logic/0LearnApp_Cubit/1Exam_Cubit/Exam_State.dart';
import '../../../../business_logic/0LearnApp_Cubit/3LogIn/Login_Cubit.dart';
import '../../../../main.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/network/local/cache_helper.dart';
import '../../../../shared/styles/assets_manager.dart';
import '../0LogIn_Screen/Login_Screen.dart';

class HomeExam_Screen extends StatelessWidget {
  String? UserEmail;
  HomeExam_Screen({required this.UserEmail});
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    bool dark = false;

    return BlocProvider(
      create: (context) => ExamCubit()
        ..changeIndex(index: 0, StudEmail: UserEmail.toString())
        ..GetAllPosts(StudentEmail: UserEmail.toString())
        ..GetStudentInformation(StudentEmail: UserEmail.toString()),
      child: BlocBuilder<ExamCubit, HomeStates>(
        builder: (context, state) {
          ExamCubit cubit = ExamCubit.get(context);
          if (cubit.isDark != null) {
            dark = cubit.isDark!;
          }
          return Scaffold(
            drawer: Drawer(
                elevation: 120,
                child: ListView(
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: cubit.isDark == true
                            ? ColorManager.defaultBlack
                            : ColorManager.defaultwhiteColor3,
                        // color: ColorManager.defaultColor,
                      ),
                      child: Image.asset(
                        ImageAssets.EldaheehLogo,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CircleAvatar(
                      backgroundColor: ColorManager.defaultwhiteColor3,
                      // backgroundImage: null ,
                      radius: 50,
                      child: Image(image: AssetImage(ImageAssets.ManLogo)),
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "${cubit.socialUserModel.name.toString()} ",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            cubit.socialUserModel.email.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            cubit.socialUserModel.phone.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "للتواصل ",
                            style: TextStyle(
                                fontSize: 25,
                                color: ColorManager.defaultRedColor2),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Text(
                                  "01150671844",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: ColorManager.defaultBlack),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "ميسره رضا",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: ColorManager.defaultBlack),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Text(
                                  "01157560149",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: ColorManager.defaultBlack),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "محمد الهم",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: ColorManager.defaultBlack),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Text(
                                  "01155588595",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: ColorManager.defaultBlack),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "محمود جمال ",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: ColorManager.defaultBlack),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            appBar: AppBar(
              // backgroundColor: ColorManager.defaultBlackColor3,
              toolbarHeight: 83,
              title: Center(
                child: Column(
                  children: [
                    Text(
                      // cubit.Email.toString(),
                      "الدحيح",
                      style: TextStyle(
                        // color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "معا للتفوق",
                      style: TextStyle(
                          // color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 10),
                    ),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 20, left: 10, top: 10, bottom: 10),
                  child: CircleAvatar(
                    child: Text(
                      "LS",
                      style: TextStyle(
                          color: ColorManager.defaultRedColor2,
                          fontWeight: FontWeight.w900),
                    ),
                    backgroundColor: ColorManager.defaultwhiteColor3,
                  ),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: ColorManager.defaultRedColor2,
                    iconTheme:
                        IconThemeData(color: ColorManager.defaultRedColor2),
                    textTheme: TextTheme()
                        .apply(bodyColor: ColorManager.defaultRedColor2),
                  ),
                  child: PopupMenuButton<int>(
                    color: ColorManager.defaultwhiteColor3,
                    onSelected: (item) => onSelected(context, item),
                    itemBuilder: (context) => [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              "الوضع اليلي ",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.defaultRedColor2,
                              ),
                            )),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Switch(
                                  value: dark,
                                  onChanged: (val) {
                                    print(val.toString());
                                    cubit.changeAppMode(fromShared: val);
                                    main();
                                    Navigator.pop(context);
                                  }),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuDivider(),
                      PopupMenuItem<int>(
                        value: 1,
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              "تسجيل خروج",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.defaultRedColor2,
                              ),
                            )),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Icon(Icons.logout),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDatabaseLoadingState,
              // condition: 2 > 1,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) => Center(
                  child: CircularProgressIndicator(
                color: ColorManager.defaultRedColor2,
              )),
            ),
            bottomNavigationBar: CurvedNavigationBar(
              color: cubit.isDark == true
                  ? HexColor('333739')
                  : ColorManager.defaultRedColor2,
              // color: ColorManager.defaultRedColor2,
              backgroundColor: ColorManager.defaultwhiteColor3,
              buttonBackgroundColor: ColorManager.defaultwhiteColor3,
              key: _bottomNavigationKey,
              items: <Widget>[
                Column(
                  children: [
                    Icon(
                      Icons.menu,
                    ),
                    Text("New"),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                    ),
                    Text("Done"),
                  ],
                ),
              ],
              onTap: (index) {
                cubit.changeIndex(
                    index: index, StudEmail: UserEmail.toString());
              },
              // // backgroundColor: ColorManager.defaultColor,
              // // fixedColor: Colors.white,
              // type: BottomNavigationBarType.fixed,
              // currentIndex: cubit.currentIndex,
              // onTap: (index) {
              //   cubit.changeIndex(
              //       index: index, StudEmail: UserEmail.toString());
              // },
              // items: [
              //   BottomNavigationBarItem(
              //     icon: Icon(
              //       Icons.menu,
              //     ),
              //     label: 'الامتحانات',
              //   ),
              //   BottomNavigationBarItem(
              //     icon: Icon(
              //       Icons.check_circle_outline,
              //     ),
              //     label: 'Done',
              //   ),
              // ],
            ),
          );
        },
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        break;
      case 1:
        CacheHelper.removeData(
          key: 'email',
        ).then((value) {
          navigateAndFinish(
            context,
            SocialLoginScreen(),
          );
        });
    }
  }
}
