import 'package:flutter/material.dart';
import 'package:travel_guide_app/utils/widgets/authentication_text_field.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Enter your email here, and we will send you instructions via email',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0,),
            AuthenticationTextField(
              editingController: _emailTextController,
              labelText: 'Email',
              icon: Icon(Icons.email_outlined,
                  color: Theme.of(context).primaryColor),
            )
          ],
        ),
      )),
    );
  }
}
