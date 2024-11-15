import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travel_guide_app/presentation/controllers/favorite_destinations_controller.dart';
import 'package:get/get.dart';

import '../../components/loading_animation.dart';

class FavoriteDestinationsPage extends StatelessWidget {
  FavoriteDestinationsPage({Key? key}) : super(key: key);
  final FavoriteDestinationsController _controller = Get.put(FavoriteDestinationsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite destinations'),
        centerTitle: true,
      ),
      body: FutureBuilder<void>(
        future: _controller.fetchDestinations(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: LoadingAnimation());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.connectionState == ConnectionState.done) {
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
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                destination.imageUrls[0],
                                height: 450,
                                width: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(destination.name, style: Theme.of(context).textTheme.headlineLarge,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/location_icon.png', height: 20, width: 20),
                              const SizedBox(width: 8),
                              Text(destination.location, style: Theme.of(context).textTheme.titleMedium)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Details')
                              ),
                              const SizedBox(width: 10),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                                    textStyle: TextStyle(fontSize: 20),
                                    foregroundColor: Colors.red, // Sets the text color
                                    side: BorderSide(
                                      color: Colors.red, // Sets the border color
                                      width: 2, // Sets the border width
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text('Unlike')
                              )
                            ],
                          ),
                        ],
                      )
                  );
                });
              }).toList(),
            );
          } else {
            return const Center(child: Text('No destinations available.'));
          }
        }
      ),
    );
  }
}
