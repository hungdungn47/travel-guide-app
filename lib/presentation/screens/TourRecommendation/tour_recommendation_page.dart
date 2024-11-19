import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_app/presentation/controllers/destination_controller.dart';
import 'package:travel_guide_app/presentation/controllers/tours_controller.dart';
import 'package:travel_guide_app/presentation/screens/TourRecommendation/tour_component.dart';
import 'package:travel_guide_app/presentation/screens/TourRecommendation/tour_details.dart';
import 'package:travel_guide_app/utils/helper_functions.dart';

import '../../components/loading.dart';

class TourRecommendationPage extends StatelessWidget {
  TourRecommendationPage({Key? key}) : super(key: key);

  final ToursController _controller = Get.put(ToursController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tour recommendation'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onTapOutside: (event) {
                print('onTapOutside');
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.filter_alt_outlined, size: 30,),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  hintText: 'Filter',
                  hintStyle: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<void>(
              future: _controller.fetchTours(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: LoadingAnimation());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _controller.tours.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                        child: GestureDetector(
                            onTap: () {
                              HelperFunctions.navigateToScreen(screen: TourDetails(tour: _controller.tours[index]));
                            },
                            child: TourComponent(tour: _controller.tours[index]),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No tours available.'));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
