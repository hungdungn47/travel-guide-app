import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_transition_mixin.dart';
import 'package:travel_guide_app/main.dart';
import 'package:travel_guide_app/models/Destination.dart';
import 'package:travel_guide_app/presentation/controllers/search_controller.dart';
import 'package:travel_guide_app/presentation/screens/DestinationDetails/destination_details_page.dart';
import 'package:travel_guide_app/utils/helper_functions.dart';

import '../../components/search_bar.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final SearchPageController _controller = Get.put(SearchPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 252, 250),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 238, 252, 250),
        centerTitle: true,
        title: Text('Search'),
      ),
      body: Obx(
        () => Column(
          children: [
            CustomSearchBar(searchPageController: _controller,),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Display search results
                    for (var destination in _controller.searchResults)
                      DestinationCard(destination: destination),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DestinationCard extends StatefulWidget {
  const DestinationCard({Key? key, required this.destination})
      : super(key: key);

  final Destination destination;

  @override
  State<DestinationCard> createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to the actual destination details page (State management)
        HelperFunctions.navigateToScreen(
            screen: DestinationDetailsPage(destinationId: widget.destination.id));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.blue.shade50,
        shadowColor: Theme.of(context).shadowColor,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.destination.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.star),
                        Text(widget.destination.rating.toString() + "/5"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        Expanded(
                          child: Text(
                            widget.destination.location,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Icon(Icons.favorite_border)
                    GestureDetector(
                      child: (isFavorite)
                          ? Icon(Icons.favorite, color: Colors.red)
                          : Icon(Icons.favorite_border),
                      onTap: () => {
                        setState(() {
                          isFavorite = !isFavorite;
                        }),
                        if (isFavorite)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Added to favorite'),
                                duration: Duration(seconds: 1),
                              ),
                            )
                          }
                      },
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              width: 150,
              child: Image(
                  image: NetworkImage(widget.destination.imageUrl[0]),
                  fit: BoxFit.cover),
            )
          ],
        ),
      ),
    );
  }
}

class BottomModalMenu extends StatelessWidget {
  final SearchPageController controller = Get.find<SearchPageController>();

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
              'City',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            DropdownBox(
                options: ['Ninh Binh', 'Kien Giang', 'Lao Cai', 'Hue', 'Quang Nam', 'Any city'],),
            const SizedBox(height: 8),
            const Text(
              'Type of destination',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildCheckboxRow('CULTURAL'),
            _buildCheckboxRow('NATURAL')
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxRow(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Obx(() => Checkbox(
            value: controller.selectedDestinationType.value == label,
            onChanged: (bool? value) {
              if (value == true) {
                controller.changeDestinationType(label);
              } else {
                controller.changeDestinationType('');
              }
            },
          )),
        ],
      ),
    );
  }
}


class DropdownBox extends StatelessWidget {
  final List<String> options;

  DropdownBox({
    Key? key,
    required this.options
  }) : super(key: key);

  final SearchPageController controller = Get.find<SearchPageController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: Material(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(options[index]),
                      onTap: () {
                        controller.changeCity(options[index]);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Text(controller.selectedCity.value != '' ? controller.selectedCity.value : 'Any city')),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}
