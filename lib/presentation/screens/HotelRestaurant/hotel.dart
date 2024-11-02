import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Hotel extends StatelessWidget {
  const Hotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hotel')
      ),
    );
  }
}
