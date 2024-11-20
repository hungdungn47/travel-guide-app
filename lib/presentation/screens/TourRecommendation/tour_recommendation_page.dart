import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    print('Tour for ${Get.arguments['destination']}');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tour recommendation'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return BottomModalMenu();
                      },
                      showDragHandle: true);
                },
                child: Container(
                  margin: const EdgeInsets.all(12.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(style: BorderStyle.solid, width: 0.3, color: Colors.black),
                  ),
                  child: Row(
                    children: [
                      Text('Filter', style: Theme.of(context).textTheme.titleSmall,),
                      const Icon(Icons.filter_alt_outlined, size: 30,)
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<void>(
              future: _controller.fetchToursOfDestination(Get.arguments['destination']),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: LoadingAnimation());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.connectionState == ConnectionState.done) {
                    if(_controller.showingTours.isNotEmpty) {
                      return Obx(() => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: _controller.showingTours.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                            child: GestureDetector(
                              onTap: () {
                                HelperFunctions.navigateToScreen(screen: TourDetails(tour: _controller.showingTours[index]));
                              },
                              child: TourComponent(tour: _controller.showingTours[index]),
                            ),
                          );
                        },
                      ));
                    } else {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/empty_icon.png',
                              height: 200,
                              width: 300,
                            ),
                            const SizedBox(height: 50),
                            Text('There is no recommendation', style: Theme.of(context).textTheme.titleSmall,),
                            Text('for this place!', style: Theme.of(context).textTheme.titleSmall,),
                          ],
                        ),
                      );
                    }
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

class BottomModalMenu extends StatelessWidget {
  final ToursController controller = Get.find<ToursController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filter',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Price range:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildCheckboxRow('50 - 150 \$', '50-150'),
            _buildCheckboxRow('150 - 250 \$', '150-250'),
            _buildCheckboxRow('250 - 450 \$', '250-450'),
            _buildCheckboxRow('450 \$ or more', '450+'),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxRow(String label, String range) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Obx(() => Checkbox(
            value: controller.selectedRange.value == range,
            onChanged: (bool? value) {
              if (value == true) {
                controller.updatePriceRange(range);
              } else {
                controller.updatePriceRange('');
              }
            },
          )),
        ],
      ),
    );
  }
}
