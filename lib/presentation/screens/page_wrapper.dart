import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_app/presentation/controllers/navigation_controller.dart';
import 'package:travel_guide_app/presentation/screens/FavoriteDestinations/favorite_destinations_page.dart';
import 'package:travel_guide_app/presentation/screens/Home/home.dart';
import 'package:travel_guide_app/presentation/screens/HotelRestaurant/hotel_page.dart';
import 'package:travel_guide_app/presentation/screens/News/news_page.dart';
import 'package:travel_guide_app/presentation/screens/Profile/user_profile.dart';
import 'package:travel_guide_app/presentation/screens/Search/search_page.dart';
import '../components/custom_navigation_bar.dart';

class PageWrapper extends StatelessWidget {
  PageWrapper({super.key});

  final NavigationController _navigationController = Get.put(NavigationController());
  final List<Widget> pages = [
    Home(),
    FavoriteDestinationsPage(),
    NewsPage(),
    UserProfile()
  ];
  final _inactiveColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 252, 250),
      // backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Obx(() => IndexedStack(
            index: _navigationController.selectedIndex.value,
            children: pages,
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => CustomAnimatedBottomBar(
          containerHeight: 70,
          backgroundColor: Colors.white,
          selectedIndex: _navigationController.selectedIndex.value,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: _navigationController.changePage,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Colors.blue,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.favorite),
              title: Text(
                'Favorite',
              ),
              activeColor: Colors.blue,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.newspaper_outlined),
              title: Text('News'),
              activeColor: Colors.blue,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Profile'),
              activeColor: Colors.blue,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
          ],
        )
      ),
    );
  }
}
