// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: SplashScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    EmployeeRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EmployeeScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        RouteConfig(
          LoginRoute.name,
          path: '/login-screen',
        ),
        RouteConfig(
          EmployeeRoute.name,
          path: '/employee-screen',
        ),
      ];
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login-screen',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [EmployeeScreen]
class EmployeeRoute extends PageRouteInfo<void> {
  const EmployeeRoute()
      : super(
          EmployeeRoute.name,
          path: '/employee-screen',
        );

  static const String name = 'EmployeeRoute';
}
