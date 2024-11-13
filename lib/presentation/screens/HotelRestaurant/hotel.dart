import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_app/presentation/controllers/destination_controller.dart';

class Hotel extends StatelessWidget {
  Hotel({super.key});

  final DestinationController destinationController = Get.find<DestinationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hotel'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Hotels in ${destinationController.destinationName.value}'),
        )
      ),
    );
  }
}
