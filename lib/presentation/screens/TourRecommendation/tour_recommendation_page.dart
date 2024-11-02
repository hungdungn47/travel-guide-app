import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TourRecommendationPage extends StatelessWidget {
  const TourRecommendationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tour recommendation'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('${Get.arguments['destination']}')
        ),
      ),
    );
  }
}
