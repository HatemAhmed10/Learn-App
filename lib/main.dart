import 'package:eldaheeh/presentation/screens/0LearnApp/1ShowData/1HomeExam.dart';
import 'package:eldaheeh/shared/components/components.dart';
import 'package:eldaheeh/shared/network/local/cache_helper.dart';
import 'package:eldaheeh/shared/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:eldaheeh/presentation/screens/0LearnApp/0LogIn_Screen/Login_Screen.dart';
import 'package:eldaheeh/presentation/screens/0Splash_Screen/splash_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('on background message');
  print(message.data.toString());

  showToast(
    text: 'on background message',
    state: ToastStates.SUCCESS,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Widget widget;

  var StudentEmail = CacheHelper.getData(key: 'email');
  bool? isDark = CacheHelper.getData(key: 'isDark');
  if (isDark == null) {
    isDark = false;
  }

  if (StudentEmail == null) {
    widget = SocialLoginScreen();
  } else {
    widget = HomeExam_Screen(
      UserEmail: StudentEmail,
    );
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // // foreground fcm
  FirebaseMessaging.onMessage.listen((event) {
    print('on message');
    print(event.data.toString());

    showToast(
      text: 'on message',
      state: ToastStates.SUCCESS,
    );
  });

  // // when click on notification to open app
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print('on message opened app');
    print(event.data.toString());

    showToast(
      text: 'on message opened app',
      state: ToastStates.SUCCESS,
    );
  });

  // // background fcm
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  runApp(MyApp(
    startWidget: widget,
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  bool isDark;

  MyApp({
    required this.startWidget,
    required this.isDark,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      // home: Solve_Screen(TitleOfExam: "Mathmetic 1"));
      home: SplashView(
        startWidget: startWidget,
      ),
    );
  }
}
