import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_app/presentation/screens/Authentication/Login/login_controller.dart';
import 'package:travel_guide_app/utils/hex_color_ext.dart';
import 'package:travel_guide_app/utils/widgets/authentication_text_field.dart';
import 'package:travel_guide_app/gen/assets.gen.dart';

import '../../../../utils/helper_functions.dart';
import '../../../../utils/widgets/gradient_text.dart';
import '../ForgetPassword/forget_password_page.dart';
import '../Register/register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: _buildUI(context)),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildLoginTitle(context),
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
                        validator: _controller.validatePassword,
                        labelText: 'Password',
                        obscureText: true,
                        icon: Icon(Icons.lock_outline,
                            color: Theme.of(context).primaryColor),
                      ),
                    ])),
                _buildForgetPasswordText(context),
                _buildLoginButton(context),
                Text(
                  'Or sign in with',
                  style: TextStyle(
                      color: HexColor.fromHex('194170'), fontSize: 15),
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
                _buildRegisterPrompt(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgetPasswordText(BuildContext context) {
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

  Widget _buildLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        width: 180,
        height: 60,
        child: ElevatedButton(
            onPressed: () async {
              await _controller.login();
            },
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

  Widget _buildLoginTitle(BuildContext context) {
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
                    color: Colors.grey.shade300,
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    offset: const Offset(8, 6))
              ]),
        ));
  }

  Widget _buildRegisterPrompt(BuildContext context) {
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
    print("UwU");
    HelperFunctions.navigateToScreen(screen: RegisterPage());
  }
}
