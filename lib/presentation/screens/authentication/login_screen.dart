import 'package:auto_route/auto_route.dart';
import 'package:flutter_wonderwoman_projectscoid/application/auth_bloc.dart';
import 'package:flutter_wonderwoman_projectscoid/presentation/router/app_router.dart';
import 'package:flutter_wonderwoman_projectscoid/presentation/widgets/button/elevated_cpn.dart';
import 'package:flutter_wonderwoman_projectscoid/presentation/widgets/text_field/textfield.dart';
import 'package:flutter_wonderwoman_projectscoid/presentation/widgets/text_field/textfield_pass.dart';
import 'package:flutter_wonderwoman_projectscoid/presentation/widgets/widget_support.dart';
import 'package:flutter_wonderwoman_projectscoid/utils/colors.dart';
import 'package:flutter_wonderwoman_projectscoid/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  void _onChanged(dynamic val) => debugPrint(val.toString());
  TextEditingController emailCtl = TextEditingController();
  FocusNode emailFn = FocusNode();
  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();

  @override
  void dispose() {
    emailCtl.dispose();
    passwordCtl.dispose();
    passwordFn.dispose();
    emailFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authBlocProvider, (previous, next) async {
      if (next.isLoggedIn == true) {
        final userId = await ref.read(authBlocProvider.notifier).loadUserID();
        _onChanged('i am on LoginScreen $userId');
        context.router.push(const EmployeeRoute());
      }
    });
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 76, left: 24, right: 24, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFieldCpn(
                      controller: emailCtl,
                      focusNode: emailFn,
                      focusNext: passwordFn,
                      labelText: "Username",
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: TextFieldPassCpn(
                        controller: passwordCtl,
                        focusNode: passwordFn,
                        labelText: 'Password',
                        customIsNext: false,
                      ),
                    ),
                    ElevatedCpn(
                      function: () {
                        FocusScope.of(context).unfocus();
                        ref.read(authBlocProvider.notifier).signIn(
                              emailCtl.text.toString(),
                              passwordCtl.text.toString(),
                            );
                      },
                      bgColor: blueCrayola,
                      textButton: 'Masuk',
                      textStyle: h5(
                        color: Theme.of(context).color12,
                        fontWeight: '700',
                      ),
                    ),
                    AppWidget.divider2(),
                    const Text('https://github.com/yogithesymbian'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
