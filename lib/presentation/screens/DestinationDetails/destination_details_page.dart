import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_app/presentation/controllers/destination_details_controller.dart';
import 'package:travel_guide_app/presentation/controllers/navigation_controller.dart';
import 'package:travel_guide_app/presentation/screens/HotelRestaurant/hotel.dart';
import 'package:travel_guide_app/presentation/screens/TourRecommendation/tour_recommendation_page.dart';
import 'package:travel_guide_app/utils/helper_functions.dart';

class DestinationDetailsPage extends StatelessWidget {
  DestinationDetailsPage({Key? key}) : super(key: key);

  final NavigationController navigationController = Get.find<NavigationController>();
  final DestinationDetailsController controller = Get.put(DestinationDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            IconButton(
              onPressed: () {
                HelperFunctions.navigateToScreen(screen: Hotel());
              },
              icon: Icon(Icons.food_bank_outlined, color: Colors.grey, size:40,)
            ),
            IconButton(
              onPressed: () {
                HelperFunctions.navigateToScreen(screen: Hotel());
              },
              icon: Icon(Icons.local_hotel_outlined, color: Colors.grey, size: 40,)
            ),
            Expanded(child: Container()),
            ElevatedButton(
              onPressed: () {
                HelperFunctions.navigateToScreen(
                    screen: TourRecommendationPage(),
                    arguments: { 'destination' : 'Trang An' });
              },
              child: Text('Find tours'),
            )
          ],
        ),
      ),
    );
  }
}
