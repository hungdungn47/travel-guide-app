import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travel_guide_app/models/index.dart';
import 'package:travel_guide_app/presentation/controllers/destination_controller.dart';
import 'package:travel_guide_app/presentation/controllers/favorite_destinations_controller.dart';
import 'package:get/get.dart';
import 'package:travel_guide_app/presentation/screens/DestinationDetails/destination_details_page.dart';
import 'package:travel_guide_app/utils/helper_functions.dart';

import '../../components/loading_animation.dart';

class FavoriteDestinationsPage extends StatelessWidget {
  FavoriteDestinationsPage({Key? key}) : super(key: key);
  final FavoriteDestinationsController _controller = Get.put(FavoriteDestinationsController());
  final DestinationController destinationController = Get.put(DestinationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Favorite destinations'),
        centerTitle: true,
        actions: [
          Obx(() => IconButton(
            onPressed: () {
              _controller.toggleViewMode();
            },
            icon: Icon(
                _controller.isViewModeCarousel.value ? Icons.view_list : Icons.view_carousel
            ),
          ))
        ],
      ),
      body: FutureBuilder<void>(
        future: _controller.fetchDestinations(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: LoadingAnimation());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Obx(() {
              if(_controller.isViewModeCarousel.value) {
                    return favoriteDestinationCarouselView(context);
              } else {
                return favoriteDestinationsListView(context);
              }
            });
          } else {
            return const Center(child: Text('No destinations available.'));
          }
        }
      ),
    );
  }

  Widget favoriteDestinationsListView(BuildContext context) {
    return Column(
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
            itemCount: _controller.favoriteDestinations.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                child: GestureDetector(
                  onTap: () {
                    HelperFunctions.navigateToScreen(screen: DestinationDetailsPage(destinationId: _controller.favoriteDestinations[index].id));
                  },
                  child: destinationListTile(context, _controller.favoriteDestinations[index]),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget destinationListTile(BuildContext context, Destination destination) {
    return Container(
      height: 125,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      destination.name,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18, // Slightly reduce font size for better responsiveness
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis, // Prevents text overflow
                      maxLines: 1, // Limits the text to a single line
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/location_icon.png',
                        height: 16,
                        width: 16,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          destination.location,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis, // Prevents text overflow
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 140,
            height: 125,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                destination.imageUrls[0],
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) =>
                    Center(child: Icon(Icons.broken_image, size: 50, color: Colors.grey)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget favoriteDestinationCarouselView(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          height: MediaQuery.of(context).size.height
      ),
      items: _controller.favoriteDestinations.map((destination) {
        return Builder(builder: (BuildContext context) {
          return Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        HelperFunctions.navigateToScreen(screen: DestinationDetailsPage(destinationId: destination.id,));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          destination.imageUrls[0],
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(destination.name, style: Theme.of(context).textTheme.headlineLarge,),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/location_icon.png', height: 20, width: 20),
                      const SizedBox(width: 8),
                      Text(destination.location, style: Theme.of(context).textTheme.titleMedium)
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            // destinationController.changeDestination(destination.name);
                            HelperFunctions.navigateToScreen(screen: DestinationDetailsPage(destinationId: destination.id,));
                          },
                          child: Text('Details')
                      ),
                      const SizedBox(width: 10),
                      // OutlinedButton(
                      //     style: OutlinedButton.styleFrom(
                      //       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                      //       textStyle: TextStyle(fontSize: 20),
                      //       foregroundColor: Colors.red, // Sets the text color
                      //       side: const BorderSide(
                      //         color: Colors.red,
                      //         width: 2, // Sets the border width
                      //       ),
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(8),
                      //       ),
                      //     ),
                      //     onPressed: () {},
                      //     child: Text('Unlike')
                      // )
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red.withOpacity(0.6),
                            size: 40,
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              )
          );
        });
      }).toList(),
    );
  }
}
