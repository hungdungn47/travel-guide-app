import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_guide_app/presentation/screens/Authentication/ForgetPassword/forget_password_page.dart';
import 'package:travel_guide_app/presentation/screens/Authentication/Login/login_controller.dart';
import 'package:travel_guide_app/presentation/screens/Authentication/Login/login_state.dart';
import 'package:travel_guide_app/presentation/screens/Authentication/Register/register_page.dart';
import 'package:travel_guide_app/utils/helper_functions.dart';
import 'package:travel_guide_app/utils/hex_color_ext.dart';
import 'package:travel_guide_app/utils/widgets/authentication_text_field.dart';
import 'package:travel_guide_app/gen/assets.gen.dart';

import '../../../../utils/widgets/gradient_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController _controller;

  LoginController _createController() {
    _controller = LoginController();
    return _controller;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _createController(),
      child: BlocBuilder<LoginController, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: _buildUI(context, state),
            //bottomNavigationBar: _buildBottomUI(context, state),
          );
        },
      ),
    );
  }

  Widget _buildUI(BuildContext context, LoginState state) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLoginTitle(context, state),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _controller.formKey,
                  child: Column(children: [
                AuthenticationTextField(
                  editingController: _controller.usernameTextController,
                  validator: _controller.validateUsername,
                  labelText: 'Username',
                  icon: Icon(Icons.person_outline,
                      color: Theme.of(context).primaryColor),
                ),
                AuthenticationTextField(
                  editingController: _controller.passwordTextController,
                  validator:_controller.validatePassword,
                  labelText: 'Password',
                  obscureText: true,
                  icon: Icon(Icons.lock_outline,
                      color: Theme.of(context).primaryColor),
                ),
              ])),
              _buildForgetPasswordText(context, state),
              _buildLoginButton(context, state),
              Text(
                'Or sign in with',
                style:
                    TextStyle(color: HexColor.fromHex('194170'), fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialButton(context,
                        onTap: () {}, assetPath: Assets.icons.google.path),
                    _buildSocialButton(context,
                        onTap: () {}, assetPath: Assets.icons.facebook.path),
                    _buildSocialButton(context,
                        onTap: () {}, assetPath: Assets.icons.twitter.path),
                    _buildSocialButton(context,
                        onTap: () {}, assetPath: Assets.icons.linkedin.path)
                  ],
                ),
              ),
              _buildRegisterPrompt(context, state)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForgetPasswordText(BuildContext context, LoginState state) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RichText(
          text: TextSpan(
              text: 'Forget your password?',
              style: const TextStyle(fontSize: 15, color: Colors.blueAccent),
              recognizer: TapGestureRecognizer()
                ..onTap = _navigateForgetPassword),
        ),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context, LoginState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        width: 180,
        height: 60,
        child: ElevatedButton(
            onPressed: _controller.login,
            style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )),
                elevation: const WidgetStatePropertyAll(5.0),
                backgroundColor:
                    WidgetStateProperty.all(HexColor.fromHex('1BB7C0'))),
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 21),
            )),
      ),
    );
  }

  Widget _buildLoginTitle(BuildContext context, LoginState state) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: GradientText(
            'Login',
            style: const TextStyle(
              fontSize: 45,
              shadows: <Shadow>[
                Shadow(
                    offset: Offset(0.0, 4.0),
                    blurRadius: 15.0,
                    color: Colors.lightBlueAccent),
              ],
            ),
            gradient: LinearGradient(colors: [
              Colors.blue.shade200,
              Colors.blue.shade900,
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(BuildContext context,
      {required GestureTapCallback onTap, required String assetPath}) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(assetPath), fit: BoxFit.contain),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 10.0,
                    offset: const Offset(0, 6))
              ]),
        ));
  }

  Widget _buildRegisterPrompt(BuildContext context, LoginState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RichText(
        text: TextSpan(
          text: "Don't have an account? ",
          style: TextStyle(color: HexColor.fromHex('147E84'), fontSize: 15),
          children: <TextSpan>[
            TextSpan(
                text: 'Register now!',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blueAccent),
                recognizer: TapGestureRecognizer()..onTap = _navigateRegister)
          ],
        ),
      ),
    );
  }

  void _navigateForgetPassword() {
    HelperFunctions.navigateToScreen(screen: const ForgetPasswordPage());
  }

  void _navigateRegister() {
    HelperFunctions.navigateToScreen(screen: const RegisterPage());
  }
}
