import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eldaheeh/shared/components/components.dart';

import '../../../../business_logic/0LearnApp_Cubit/3LogIn/Login_Cubit.dart';
import '../../../../business_logic/0LearnApp_Cubit/3LogIn/Login_State.dart';
import '../../../../shared/network/local/cache_helper.dart';
import '../../../../shared/styles/colors.dart';
import '../1ShowData/1HomeExam.dart';

class SocialLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (context, state) {
          if (state is SocialLoginErrorState) {
            // showToast(
            //   text: state.error,
            //   state: ToastStates.ERROR,
            // );
          }
          if (state is SocialLoginSuccessState) {
            print("Email" + state.email.toString());
            CacheHelper.saveData(
              key: 'email',
              value: state.email,
            ).then((value) {
              navigateAndFinish(
                context,
                HomeExam_Screen(UserEmail: state.email),
              );
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                // backgroundColor: ColorManager.defaultColor,
                ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'تسجيل دخول',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    // color: ColorManager.defaultBlack,
                                    fontSize: 30,
                                  ),
                        ),
                        Text(
                          'ادخل الان لحل المزيد من الامتحانات',
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                  // color: Colors.grey,
                                  ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 15),
                          cursorColor: ColorManager.defaultRedColor2,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email address';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Email Address',
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.red,
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 15),
                          cursorColor: ColorManager.defaultRedColor2,
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your Password ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: ColorManager.defaultRedColor2,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                SocialLoginCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              icon: Icon(
                                SocialLoginCubit.get(context).suffix,
                              ),
                              color: ColorManager.defaultRedColor2,
                            ),
                            border: const OutlineInputBorder(),
                          ),
                          obscureText: SocialLoginCubit.get(context).isPassword,
                          onFieldSubmitted: (value) {
                            if (formKey.currentState!.validate()) {
                              // SocialLoginCubit.get(context).userLogin(
                              //   email: emailController.text,
                              //   password: passwordController.text,
                              // );
                            }
                          },
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialLoginLoadingState,
                          builder: (context) => Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Container(
                                width: 110,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    20.0,
                                  ),
                                  color: ColorManager.defaultRedColor2,
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      SocialLoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                      // navigateTo(
                                      //     context,
                                      //     HomeExam_Screen(
                                      //       UserEmail: "Saad10@gmail.com",
                                      //     ));
                                    }
                                  },
                                  child: Text(
                                    'تسجيل الدخول',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          fallback: (context) => Center(
                              child: CircularProgressIndicator(
                            color: ColorManager.defaultRedColor2,
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
