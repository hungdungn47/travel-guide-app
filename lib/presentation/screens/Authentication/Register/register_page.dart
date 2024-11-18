import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_guide_app/presentation/screens/Authentication/Register/register_controller.dart';
import 'package:travel_guide_app/presentation/screens/Authentication/Register/register_state.dart';
import 'package:travel_guide_app/utils/hex_color_ext.dart';
import 'package:travel_guide_app/utils/widgets/authentication_text_field.dart';

import '../../../../utils/widgets/gradient_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterController _controller;

  RegisterController _createController() {
    _controller = RegisterController();
    return _controller;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _createController(),
      child: BlocBuilder<RegisterController, RegisterState>(
        builder: (context, state) {
          return Scaffold(
            body: _buildUI(context, state),
            //bottomNavigationBar: _buildBottomUI(context, state),
          );
        },
      ),
    );
  }

  Widget _buildUI(BuildContext context, RegisterState state) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildRegisterTitle(context, state),
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
                      editingController: _controller.emailTextController,
                      validator: _controller.validateEmail,
                      labelText: 'Email',
                      icon: Icon(Icons.email_outlined,
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
                    AuthenticationTextField(
                      editingController:
                          _controller.passwordConfirmationTextController,
                      validator: _controller.validateConfirmationPassword,
                      labelText: 'Confirm password',
                      obscureText: true,
                      icon: Icon(Icons.lock_outline,
                          color: Theme.of(context).primaryColor),
                    ),
                  ])),
              _buildRegisterButton(context, state),
              _buildLoginPrompt(context, state)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context, RegisterState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        width: 180,
        height: 60,
        child: ElevatedButton(
            onPressed: _controller.register,
            style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )),
                elevation: const WidgetStatePropertyAll(5.0),
                backgroundColor:
                    WidgetStateProperty.all(HexColor.fromHex('1BB7C0'))),
            child: const Text(
              'Sign up',
              style: TextStyle(fontSize: 21),
            )),
      ),
    );
  }

  Widget _buildRegisterTitle(BuildContext context, RegisterState state) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: GradientText(
            'Sign up',
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

  Widget _buildLoginPrompt(BuildContext context, RegisterState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RichText(
        text: TextSpan(
          text: "Already have an account? ",
          style: TextStyle(color: HexColor.fromHex('147E84'), fontSize: 15),
          children: <TextSpan>[
            TextSpan(
                text: 'Login',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blueAccent),
                recognizer: TapGestureRecognizer()..onTap = _navigateLogin)
          ],
        ),
      ),
    );
  }

  void _navigateLogin() {}
}
