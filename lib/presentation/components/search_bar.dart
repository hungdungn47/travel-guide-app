import 'package:flutter/material.dart';

import '../controllers/search_controller.dart';
import '../screens/Search/search_page.dart';

class CustomSearchBar extends StatelessWidget {
  final SearchPageController searchPageController;

  const CustomSearchBar({super.key, required this.searchPageController});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'search_box',
      child: Material(
          child: Container(
            color: Color.fromARGB(255, 238, 252, 250),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: SearchAnchor(
            headerTextStyle: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
            isFullScreen: false,
            viewElevation: 5.0,
            viewConstraints: const BoxConstraints(
              minHeight: 100,
              maxHeight: 250,
            ),
            viewOnSubmitted:  (prompt) async {
              await searchPageController.getDestinationsByKeyword(prompt);
            },
            builder: (context, controller) {
              return SearchBar(
                hintText: 'Find your next destination',
                hintStyle: WidgetStateProperty.all(
                  const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                elevation: const WidgetStatePropertyAll(5.0),
                textStyle: WidgetStateProperty.all(
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                onTap: () {
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
                            return BottomModalMenu();
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
                  await searchPageController.getKeyword(controller.text);
              return List<ListTile>.generate(suggestions.length, (int index) {
                return ListTile(
                  title: Text(
                    suggestions[index],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  onTap: () async {
                    controller.closeView(suggestions[index]);
                    await searchPageController
                        .getDestinationsByKeyword(suggestions[index]);
                  },
                );
              });
            }),
      )),
    );
  }
}
