import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_app/presentation/screens/HotelRestaurant/hotel_controller.dart';
import 'package:travel_guide_app/utils/widgets/gradient_text.dart';

import '../../../gen/assets.gen.dart';
import '../../../utils/helper_functions.dart';
import 'hotel.dart';

class HotelPage extends StatelessWidget {
  final String destinationId;
  final TextEditingController searchController = TextEditingController();
  HotelPage({super.key, required this.destinationId});

  late final HotelController _controller = Get.put(HotelController(destinationId: destinationId));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Hotels & Restaurants", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Obx(() => _buildUI(context)),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.backgrounds.cityBackground.path),
          opacity: 0.5,
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(context),
            _buildRecommendationText(context),
            _controller.hotels.isEmpty ? _buildEmptyHotelNotification(context) : _buildHotelEntriesList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationText(BuildContext context) {
    if (_controller.hotelIsRecommending.value) {
      return GradientText(
        'Our Recommendations',
        style: const TextStyle(
          fontSize: 25,
          shadows: <Shadow>[
            Shadow(
                offset: Offset(0.0, 4.0),
                blurRadius: 15.0,
                color: Colors.lightBlueAccent),
          ],
        ),
        gradient: LinearGradient(colors: [
          Colors.blue.shade300,
          Colors.blue.shade900,
        ]),
      );
    } else {
      return Container();
    }
  }

  Widget _buildHotelEntriesList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _controller.hotels.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: GestureDetector(
              onTap: () {},
              child: _buildHotelEntry(context, _controller.hotels[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyHotelNotification(BuildContext context) {
    return Expanded(
      child: Center(
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
            Text('There is no hotels', style: Theme.of(context).textTheme.titleSmall,),
            Text('for this place!', style: Theme.of(context).textTheme.titleSmall,),
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
            maxHeight: 400
          ),
          viewOnSubmitted: (prompt) async {
            await _controller.updateHotelLists(prompt);
          },
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
            );
          },
          suggestionsBuilder:
              (BuildContext context, SearchController controller) async {
            List<String> suggestions = await _controller.getSuggestions(controller.text, destinationId);
            return List<ListTile>.generate(suggestions.length, (int index) {
              return ListTile(
                title: Text(
                  suggestions[index],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                onTap: () async {
                  controller.closeView(suggestions[index]);
                  await _controller.updateHotelLists(suggestions[index]);
                },
              );
            });
          }),
    );
  }

  Widget _buildHotelEntry(
      BuildContext context, Hotel entry) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 5.0,
                  offset: Offset(0, 6))
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 17.0),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.name,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        children: [
                          const Icon(Icons.star),
                          Text(
                            '${entry.rating}/5',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.place),
                          Expanded(
                            child: Text(
                              entry.location,
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  width: 140,
                  height: 140,
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(120.0),
                  ),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(120.0),
                      child: Image.network(
                        entry.imageUrl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
            ),
          ],
        ));
  }

  Widget _buildProcessIndicator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: _controller.hotelLoading.value ? 1.0 : 00,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
