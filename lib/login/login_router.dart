import 'package:firday/login/page/SMSLogin_page.dart';
import 'package:firday/login/page/login_page.dart';
import 'package:firday/login/page/register_page.dart';
import 'package:firday/login/page/reset_password_page.dart';
import 'package:fluro/fluro.dart';

import '../routers/i_router.dart';

class LoginRouter implements IRouterProvider {
  static String loginPage = '/login';
  static String smsLoginPage = '/login/smsLogin';
  static String resetPasswordPage = '/login/resetPassword';
  static String registerPage = '/login/register';

  @override
  void initRouter(FluroRouter router) {
    router.define(loginPage, handler: Handler(handlerFunc: (_, __) => const LoginPage()));
    router.define(smsLoginPage, handler: Handler(handlerFunc: (_, __) => const SMSLoginPage()));

    router.define(resetPasswordPage, handler: Handler(handlerFunc: (_, __) => const ResetPasswordPage()));
    router.define(registerPage, handler: Handler(handlerFunc: (_, __) => const RegisterPage()));
  }
}
