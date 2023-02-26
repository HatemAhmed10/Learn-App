// import 'package:firebase_auth/firebase_auth.dart';
import 'package:eldaheeh/shared/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eldaheeh/business_logic/0LearnApp_Cubit/3LogIn/Login_State.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates> {
  SocialLoginCubit() : super(SocialLoginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);

  String UserEmail = "";

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(SocialLoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      UserEmail = value.user!.email!;
      showToast(text: "تم الدخول", state: ToastStates.SUCCESS);
      // print(value.user!.email);
      // print(value.user!.uid);
      emit(SocialLoginSuccessState(UserEmail));
    }).catchError((error) {
      showToast(
          text: "خطا في اسم المستخدم او كلمه المرور", state: ToastStates.ERROR);

      emit(SocialLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SocialChangePasswordVisibilityState());
  }
}
