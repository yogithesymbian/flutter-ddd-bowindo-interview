import 'package:auto_route/auto_route.dart';
import 'package:flutter_wonderwoman_projectscoid/application/error_bloc.dart';
import 'package:flutter_wonderwoman_projectscoid/application/loader_bloc.dart';
import 'package:flutter_wonderwoman_projectscoid/application/theme_bloc.dart';
import 'package:flutter_wonderwoman_projectscoid/domain/model/app_error.dart';
import 'package:flutter_wonderwoman_projectscoid/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

class App extends ConsumerStatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeBlocProvider);

    ref.listen<int>(loaderBlocProvider, (previous, next) {
      if (next > 0) {
        if (!EasyLoading.isShow) {
          EasyLoading.show(
            maskType: EasyLoadingMaskType.clear,
          );
        }
      } else {
        EasyLoading.dismiss();
      }
    });

    ref.listen<List<AppError>>(errorBlocProvider, (previous, next) {
      if (next.isNotEmpty) {
        AppError error = next.first;
        switch (error.type) {
          case AppErrorType.highPriority:
            EasyLoading.showToast(
              error.message ?? '',
              toastPosition: EasyLoadingToastPosition.bottom,
            );
            break;
          case AppErrorType.lowPriority:
            if (error.message == null) {
              return;
            }
            EasyLoading.showToast(
              error.message ?? '',
              toastPosition: EasyLoadingToastPosition.bottom,
            );
            break;
          case AppErrorType.general:
            EasyLoading.showToast(
              error.message ?? '',
              toastPosition: EasyLoadingToastPosition.bottom,
            );
            break;
        }
        ref.read(errorBlocProvider.notifier).remove();
      }
    });

    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        theme: theme.data,
        darkTheme: ThemeState.dark().data,
        themeMode: theme.mode,
        debugShowCheckedModeBanner: true,
        routerDelegate: AutoRouterDelegate(
          _appRouter,
          navigatorObservers: () => [
            //
          ],
        ),
        routeInformationParser: _appRouter.defaultRouteParser(),
        builder: EasyLoading.init(),
      );
    });
  }
}
