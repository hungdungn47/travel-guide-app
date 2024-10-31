import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_app/presentation/screens/DestinationDetails/destination_details_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Travel app'
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tràng An'
            ),
            ElevatedButton(
              onPressed: () => Get.to(DestinationDetailsPage()),
              child: Text('Detail'),
            )
          ],
        )
      )
    );
  }
}
