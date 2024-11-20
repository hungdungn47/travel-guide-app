import 'package:travel_guide_app/presentation/components/loading.dart';
import 'package:travel_guide_app/presentation/components/slider.dart';
import 'package:travel_guide_app/presentation/controllers/destination_details_controller.dart';
import 'package:travel_guide_app/presentation/controllers/navigation_controller.dart';
import 'package:travel_guide_app/presentation/screens/HotelRestaurant/hotel_page.dart';
import 'package:travel_guide_app/presentation/screens/TourRecommendation/tour_recommendation_page.dart';
import 'package:travel_guide_app/utils/index.dart';

import '../../../models/index.dart';

class DestinationDetailsPage extends StatelessWidget {
  final String destinationId;

  DestinationDetailsPage({Key? key, required this.destinationId})
      : super(key: key);

  final NavigationController navigationController =
      Get.find<NavigationController>();
  final DestinationDetailsController controller =
      Get.put(DestinationDetailsController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.fetchData(destinationId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 238, 252, 250),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 238, 252, 250),
              elevation: 0,
              centerTitle: true,
              title: const Text('Destination'),
            ),
            body: const LoadingAnimation(),
          );
        } else if (snapshot.hasError) {
          return const Scaffold(
            body: Center(child: Text('Error loading data')),
          );
        } else {
          Destination destination = controller.destination.value!;
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 238, 252, 250),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 238, 252, 250),
              elevation: 0,
              centerTitle: true,
              title: Text(destination.name),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSliderWidget(
                        imgList: getImageInfoFromDestination(destination)),
                    buildDescription(
                        context, 'Giới thiệu', destination.description),
                    buildDescription(
                        context, 'Giá trị văn hóa', destination.culturalValue),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: buildBottomNavBar(context, destination.name),
          );
        }
      },
    );
  }

  List<DestinationImageOverview> getImageInfoFromDestination(
      Destination destination) {
    return destination.imageUrl
        .map((imageUrl) => DestinationImageOverview(imageUrl: imageUrl))
        .toList();
  }

  Widget buildDescription(
      BuildContext context, String title, String description) {
    return Container(
      margin: const EdgeInsets.only(top: 32, bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            description,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }

  Widget buildBottomNavBar(BuildContext context, String destinationName) {
    return Container(
      // decoration: const BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(72),
      //     topRight: Radius.circular(72),
      //   ),
      // ),
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      child: BottomAppBar(
        height: 68,
        padding: EdgeInsets.all(0),
        color: Colors.white,
        // Make BottomAppBar transparent so the Container's decoration is visible
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                // HelperFunctions.navigateToScreen(screen: Hotel());
                controller.isFavorite.value = !controller.isFavorite.value;
              },
              icon: Obx(
                () => Icon(Icons.favorite,
                    color: controller.isFavorite.value
                        ? Colors.red.withOpacity(0.6)
                        : Colors.grey.withOpacity(0.6),
                    size: 36),
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                // HelperFunctions.navigateToScreen(screen: HotelPage(destinationId: destinationId));
                HelperFunctions.navigateToHotelScreen(destinationId: destinationId);
              },
              icon: Icon(Icons.food_bank_outlined,
                  color: Colors.grey.withOpacity(0.6), size: 36),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                // HelperFunctions.navigateToScreen(screen: HotelPage(destinationId: destinationId));
                HelperFunctions.navigateToHotelScreen(destinationId: destinationId);
              },
              icon: Icon(Icons.local_hotel_outlined,
                  color: Colors.grey.withOpacity(0.6), size: 40),
            ),
            const SizedBox(width: 16),
            Expanded(child: Container()),
            ElevatedButton(
              onPressed: () {
                // HelperFunctions.navigateToScreen(
                //   screen: TourRecommendationPage(),
                //   arguments: {'destination': 'Trang An'},
                // );
                HelperFunctions.navigateToTourPage(destinationName);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150, 68),
                backgroundColor: Color(0xFF1BB7C0),
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(20),
                    ),
              ),
              child: const Text(
                'Find tours',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
