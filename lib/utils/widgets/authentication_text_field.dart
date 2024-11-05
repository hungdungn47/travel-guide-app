import 'package:flutter/material.dart';

class AuthenticationTextField extends StatefulWidget {
  const AuthenticationTextField(
      {super.key,
      required this.editingController,
      this.obscureText,
      this.icon,
      this.labelText,
      this.hintText,
      this.validator});

  final String? labelText;
  final String? hintText;
  final TextEditingController editingController;
  final Icon? icon;
  final String? Function(String?)? validator;
  final bool? obscureText;

  @override
  State<AuthenticationTextField> createState() =>
      _AuthenticationTextFieldState();
}

class _AuthenticationTextFieldState extends State<AuthenticationTextField> {
  bool? _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggle() {
    setState(() {
      if (_obscureText != null) {
        _obscureText = !_obscureText!;
      }
    });
  }

  Widget? _getHiddenIcon() {
    if (_obscureText != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _obscureText!
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: _toggle,
        ),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 20.0,
              offset: const Offset(3, 3))
        ]),
        child: TextFormField(
          style: const TextStyle(fontWeight: FontWeight.w400),
          controller: widget.editingController,
          validator: widget.validator,
          obscureText: _obscureText ?? false,
          maxLines: 1,
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: const TextStyle(fontWeight: FontWeight.w400),
            hintText: widget.hintText,
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: widget.icon,
            ),
            suffixIcon: _getHiddenIcon(),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            contentPadding: const EdgeInsets.all(15.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black38, width: 1.5),
              borderRadius: BorderRadius.circular(30),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Colors.blueAccent, width: 1.5),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
