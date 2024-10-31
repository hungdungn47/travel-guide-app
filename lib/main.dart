import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_app/presentation/screens/Home/home.dart';
import 'package:travel_guide_app/presentation/screens/HotelRestaurant/hotel_restaurant.dart';
import 'package:travel_guide_app/presentation/screens/page_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.white,
        scaffoldBackgroundColor: Color(0xffF9FFFE),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xffF9FFFE),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color(0xff008CFF)
        ),
        useMaterial3: true,
      ),
      home: PageWrapper(),
    );
  }
}