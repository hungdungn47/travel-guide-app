import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_app/presentation/controllers/destination_controller.dart';
import 'package:travel_guide_app/presentation/screens/TourRecommendation/tour_component.dart';

class TourRecommendationPage extends StatelessWidget {
  TourRecommendationPage({Key? key}) : super(key: key);

  final DestinationController destinationController = Get.find<DestinationController>();

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
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                  child: TourComponent(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
