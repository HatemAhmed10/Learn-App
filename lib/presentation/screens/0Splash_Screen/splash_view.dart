import 'dart:async';
import 'package:flutter/material.dart';
import '../../../shared/components/components.dart';
import '../../../shared/styles/assets_manager.dart';
import '../../../shared/styles/colors.dart';

class SplashView extends StatefulWidget {
  Widget startWidget;

  SplashView({
    required this.startWidget,
  });

  // const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState(startWidget: startWidget);
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  Widget? startWidget;

  _SplashViewState({
    required this.startWidget,
  });

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() {
    navigateAndFinish(context, startWidget);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorManager.defaultBlackColor3,
      body: Center(
          child: Container(
              child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Image(image: AssetImage(ImageAssets.EldaheehLogo)),
          SizedBox(
            height: 70,
          ),
          Text(
            "معا للتفوق",
            style: TextStyle(
              color: ColorManager.defaultRedColor2,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ))),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
