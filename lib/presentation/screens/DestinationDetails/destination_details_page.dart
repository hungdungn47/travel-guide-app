import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_app/presentation/controllers/destination_details_controller.dart';
import 'package:travel_guide_app/presentation/controllers/navigation_controller.dart';

class DestinationDetailsPage extends StatelessWidget {
  DestinationDetailsPage({Key? key}) : super(key: key);

  final NavigationController navigationController = Get.find<NavigationController>();
  final DestinationDetailsController controller = Get.put(DestinationDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(controller.currentDestination.value),
      ),
      body: SafeArea(
        child: Center(
          child: Obx(() => Text(controller.currentDestination.value)),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.food_bank_outlined, color: Colors.grey, size:50,)),
            IconButton(onPressed: () {}, icon: Icon(Icons.hotel, color: Colors.grey, size: 50,)),
            Expanded(child: Container()),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff008CFF)
              ),
              child: TextButton(
                onPressed: () {
                  navigationController.changePage(3);
                  Get.back();
                },
                child: Text('Find tours', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),)
              )
            )
          ],
        ),
      ),
    );
  }
}
