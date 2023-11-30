import 'package:firday/login/widgets/my_text_field.dart';
import 'package:firday/res/constant.dart';
import 'package:firday/res/gaps.dart';
import 'package:firday/res/styles.dart';
import 'package:firday/routers/fluro_navigator.dart';
import 'package:firday/util/change_notifier_manage.dart';
import 'package:firday/util/other_utils.dart';
import 'package:firday/widgets/my_app_bar.dart';
import 'package:firday/widgets/my_button.dart';
import 'package:firday/widgets/my_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/firDay_localizations.dart';
import 'package:sp_util/sp_util.dart';

import '../login_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ChangeNotifierMixin<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _clickable = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// 显示状态栏和导航栏
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    });
    _phoneController.text = SpUtil.getString(Constant.phone).nullSafe;
  }

  @override
  Map<ChangeNotifier, List<VoidCallback>?>? changeNotifier() {
    final List<VoidCallback> callbacks = <VoidCallback>[_verify];
    return {
      _phoneController: callbacks,
      _passwordController: callbacks,
      _phoneFocusNode: null,
      _passwordFocusNode: null,
    };
  }

  _login() {
    SpUtil.putString(Constant.phone, _phoneController.text);
    // NavigatorUtils.push(context, StoreRouter.auditPage);
  }

  _verify() {
    String phone = _phoneController.text;
    String password = _passwordController.text;

    bool clickable = true;

    if (phone.isEmpty || phone.length < 11) {
      clickable = false;
    }
    if (password.isEmpty || password.length < 6) {
      clickable = false;
    }

    if (clickable != _clickable) {
      setState(() {
        _clickable = clickable;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isBack: false,
        actionName: FirDayLocalizations.of(context)!.verificationCodeLogin,
        onPressed: () {
          NavigatorUtils.push(context, LoginRouter.smsLoginPage);
        },
      ),
      body: MyScrollView(
        keyboardConfig: Utils.getKeyboardActionsConfig(context, [_phoneFocusNode, _passwordFocusNode]),
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        children: _buildBody,
      ),
    );
  }

  List<Widget> get _buildBody => <Widget>[
        Text(
          FirDayLocalizations.of(context)!.passwordLogin,
          style: TextStyles.textBold24,
        ),
        Gaps.vGap16,
        MyTextField(
          key: const Key('phone'),
          controller: _phoneController,
          focusNode: _phoneFocusNode,
          maxLength: 11,
          keyboardType: TextInputType.phone,
          hintText: FirDayLocalizations.of(context)!.inputUsernameHint,
        ),
        Gaps.vGap8,
        MyTextField(
          key: const Key('password'),
          keyName: 'password',
          controller: _passwordController,
          focusNode: _passwordFocusNode,
          isInputPwd: true,
          keyboardType: TextInputType.phone,
          hintText: FirDayLocalizations.of(context)!.inputUsernameHint,
        ),
        Gaps.vGap24,
        MyButton(
          key: const Key('login'),
          text: FirDayLocalizations.of(context)!.login,
          onPressed: _clickable ? _login : null,
        ),
        Container(
          height: 40,
          alignment: Alignment.centerRight,
          child: GestureDetector(
            child: Text(
              FirDayLocalizations.of(context)!.forgotPasswordLink,
              style: Theme.of(context).textTheme.titleSmall,
              key: const Key("forgotPassword"),
            ),
            onTap: () => {NavigatorUtils.push(context, LoginRouter.resetPasswordPage)},
          ),
        ),
        Gaps.vGap16,
        Container(
          alignment: Alignment.center,
          child: GestureDetector(
            child: Text(
              FirDayLocalizations.of(context)!.noAccountRegisterLink,
              style: TextStyle(color: Theme.of(context).primaryColor),
              key: const Key('noAccountRegister'),
            ),
            onTap: () => NavigatorUtils.push(context, LoginRouter.registerPage),
          ),
        )
      ];
}
