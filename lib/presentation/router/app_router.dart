import 'package:auto_route/auto_route.dart';
import 'package:flutter_wonderwoman_projectscoid/presentation/screens/authentication/login_screen.dart';
import 'package:flutter_wonderwoman_projectscoid/presentation/screens/employee/employee_screen.dart';
import 'package:flutter_wonderwoman_projectscoid/presentation/screens/onboarding/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: LoginScreen),
    AutoRoute(page: EmployeeScreen),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
