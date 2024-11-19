import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_transition_mixin.dart';
import 'package:travel_guide_app/main.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: const Text(
                    'Filter',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onTap: () => {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return BottomModalMenu();
                        },
                        showDragHandle: true),
                  },
                ),
              ],
            ),
          ),
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
                  for (int i = 0; i < 10; i++) DestinationCard(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DestinationCard extends StatefulWidget {
  const DestinationCard({Key? key}) : super(key: key);

  @override
  State<DestinationCard> createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    'Trang An',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star),
                      Text('4.9 / 5'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      Expanded(
                        child: Text(
                          "Ninh Binh, Viet Nam",
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
                image: AssetImage('assets/images/trangan.jpg'),
                fit: BoxFit.cover),
          )
        ],
      ),
    );
  }
}

class BottomModalMenu extends StatefulWidget {
  const BottomModalMenu({Key? key}) : super(key: key);

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
    return Container(
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
          ],
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
