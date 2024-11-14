import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_app/presentation/components/loading.dart';
import 'package:travel_guide_app/presentation/components/slider.dart';
import 'package:travel_guide_app/presentation/screens/Authentication/login_page.dart';
import 'package:travel_guide_app/presentation/screens/DestinationDetails/destination_details_page.dart';
import 'package:travel_guide_app/presentation/screens/Home/home.dart';
import 'package:travel_guide_app/presentation/screens/HotelRestaurant/hotel.dart';
import 'package:travel_guide_app/presentation/screens/page_wrapper.dart';
import 'package:travel_guide_app/utils/sl.dart';
import 'package:travel_guide_app/utils/theme.dart';
import 'networking/api/index.dart';

void main() {
  setup();
  runApp(const MyApp());
}

void setup() {
  sl.registerSingleton<ApiService>(ApiServiceImpl.instance);
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/loading', page: () => const LoadingAnimation()),
      ],
      home: PageWrapper(),
    );
  }
}
