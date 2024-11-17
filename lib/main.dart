import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_app/presentation/screens/Authentication/Login/login_page.dart';
import 'package:travel_guide_app/presentation/screens/page_wrapper.dart';
import 'package:travel_guide_app/utils/sl.dart';
import 'package:travel_guide_app/utils/theme.dart';

import './networking/index.dart';

void main() {
  setup();
  runApp(const MyApp());
}

void setup() async {
  sl.registerSingleton<ApiService>(ApiServiceImpl.instance);
  var test = await HttpClient.post(endPoint: 'api/v1/authenticate', body: {
    "username": "test1",
    "password": "123456"
  });

  print(test);
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
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/home', page: () => PageWrapper())
      ],
      home: PageWrapper(),
    );
  }
}
