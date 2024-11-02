import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_guide_app/presentation/components/search_bar.dart';
import 'package:travel_guide_app/presentation/screens/DestinationDetails/destination_details_page.dart';
import 'package:travel_guide_app/presentation/screens/Search/search_page.dart';
import 'package:travel_guide_app/utils/helper_functions.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Travel app'
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                child: CustomSearchBar(),
              ),
            ),
            Text(
              'Trang An ',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () => Get.to(DestinationDetailsPage()),
              child: Text('Detail'),
            )
          ],
        )
      )
    );
  }
}
