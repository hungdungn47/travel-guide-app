import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_app/presentation/screens/Authentication/login_page.dart';
import 'package:travel_guide_app/presentation/screens/Home/home.dart';
import 'package:travel_guide_app/presentation/screens/HotelRestaurant/hotel.dart';
import 'package:travel_guide_app/presentation/screens/page_wrapper.dart';
import 'package:travel_guide_app/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/home', page: () => PageWrapper())
      ],
      home: PageWrapper(),
    );
  }
}