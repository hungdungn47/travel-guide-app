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
      appBar: AppBar(
        centerTitle: true,
        title: Text('Search'),
      ),
      body: Obx(
        () => Column(
          children: [
            _buildSearchBar(context),
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

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      child: SearchAnchor(
          isFullScreen: false,
          headerTextStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
          viewElevation: 5.0,
          viewConstraints: const BoxConstraints(
            minHeight: 100,
            maxHeight: 300,
          ),
          builder: (context, controller) {
            return SearchBar(
              controller: controller,
              hintText: 'Find your next destination',
              hintStyle: WidgetStateProperty.all(
                const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              elevation: const WidgetStatePropertyAll(5.0),
              onSubmitted: (prompt) async {
                await _controller.getDestinationsByKeyword(prompt);
              },
              textStyle: WidgetStateProperty.all(
                const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(Icons.search),
              ),
              trailing: <Widget>[
                IconButton(
                  icon: const Icon(Icons.filter_alt_outlined),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return BottomModalMenu(
                            controller: _controller,
                          );
                        },
                        showDragHandle: true);
                  },
                ),
              ],
            );
          },
          suggestionsBuilder:
              (BuildContext context, SearchController controller) async {
            List<String> suggestions =
                await _controller.getKeyword(controller.text);
            return List<ListTile>.generate(suggestions.length, (int index) {
              return ListTile(
                title: Text(
                  suggestions[index],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                onTap: () async {
                  controller.closeView(suggestions[index]);
                  await _controller
                      .getDestinationsByKeyword(suggestions[index]);
                },
              );
            });
          }),
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
            screen: DestinationDetailsPage(destinationId: "1"));
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

class BottomModalMenu extends StatefulWidget {
  BottomModalMenu({super.key, required this.controller});

  SearchPageController controller;

  @override
  State<BottomModalMenu> createState() => _BottomModalMenuState();
}

class _BottomModalMenuState extends State<BottomModalMenu> {
  bool isCulture = false;
  bool isLeisure = false;
  bool isAdventure = false;
  String city = 'Hanoi';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Filter',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'City/Province:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownBox(
                title: city,
                options: ['Hanoi', 'HCMC', 'Da Nang', 'Hue'],
                onSelected: (value) {
                  setState(() {
                    city = value;
                  });
                },
              ),
              Text(
                'Type of Travel:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Expanded(child: Text('Cultrue & History')),
                      Checkbox(
                          value: isCulture,
                          onChanged: (bool? value) {
                            setState(() {
                              isCulture = value!;
                            });
                          }),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Expanded(child: Text('Leisure & Relaxation')),
                    Checkbox(
                        value: isLeisure,
                        onChanged: (bool? value) {
                          setState(() {
                            isLeisure = value!;
                          });
                        }),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Expanded(child: Text('Adventure')),
                      Checkbox(
                          value: isAdventure,
                          onChanged: (bool? value) {
                            setState(() {
                              isAdventure = value!;
                            });
                          }),
                    ],
                  )),
              ElevatedButton(
                onPressed: () {
                  widget.controller.fetchSearchResults();
                },
                child: Text('Apply'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownBox extends StatefulWidget {
  final String title;
  final List<String> options;
  final Function(String) onSelected;

  const DropdownBox({
    Key? key,
    required this.title,
    required this.options,
    required this.onSelected,
  }) : super(key: key);

  @override
  _DropdownBoxState createState() => _DropdownBoxState();
}

class _DropdownBoxState extends State<DropdownBox> {
  String? selectedValue;

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
                  itemCount: widget.options.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(widget.options[index]),
                      onTap: () {
                        setState(() {
                          selectedValue = widget.options[index];
                        });
                        widget.onSelected(widget.options[index]);
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
              Text(selectedValue ?? widget.title),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}
