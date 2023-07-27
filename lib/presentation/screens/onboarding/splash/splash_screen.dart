import 'package:after_layout/after_layout.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_wonderwoman_projectscoid/presentation/router/app_router.dart';
import 'package:flutter_wonderwoman_projectscoid/presentation/widgets/background_gradient_with_frame.dart';
import 'package:flutter_wonderwoman_projectscoid/utils/config/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_wonderwoman_projectscoid/utils/storage/storage.dart';
import 'package:flutter_wonderwoman_projectscoid/utils/user_preference.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/splash_screen';
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with AfterLayoutMixin<SplashScreen> {
  final duration = Duration(milliseconds: timeDilation.ceil() * 3250);
  Future checkFirstSeen() async {
    bool seen = await UserPreference().checkFirstSeen();
    final secureStorage = SecureStorage();
    final isLogin = await secureStorage.readSecureData(Env.kBearer);

    await Future.delayed(duration);

    if (seen) {
      if (isLogin != null) {
        // Navigator.of(context).pushNamedAndRemoveUntil(
        //     MainScreen.id, (Route<dynamic> route) => false);
      } else {
        context.router.popAndPush(const LoginRoute());
      }
    } else {
      // UserPreference().setCheckFirstSeen();
      // context.router.replace(const OnBoardingRoute());
      context.router.popAndPush(const LoginRoute()); // onBoardingScreen
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          BackgroundGradientWithFrame(size: size),
          Positioned(
            right: 0,
            left: 0,
            bottom: 2.h,
            child: Center(
              child: Column(
                children: const [
                  Text(
                    "yogithesymbian",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
