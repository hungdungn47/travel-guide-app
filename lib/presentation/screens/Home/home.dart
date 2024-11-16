import 'package:travel_guide_app/models/index.dart';
import 'package:travel_guide_app/presentation/components/search_bar.dart';
import 'package:travel_guide_app/presentation/components/slider.dart';
import 'package:travel_guide_app/presentation/controllers/home_controller.dart';
import 'package:travel_guide_app/presentation/screens/Search/search_page.dart';

import '../../../utils/index.dart';
import '../../components/loading.dart';
import '../DestinationDetails/destination_details_page.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final HomeController _controller = Get.put(HomeController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 252, 250),
      body: FutureBuilder<void>(
        future: _controller.fetchDestinations(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: LoadingAnimation());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTopBar(context),
                  buildUI(context),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No destinations available.'));
          }
        },
      ),
    );
  }

  Widget buildTopBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      child: Row(
        children: [
          const Text(
            'Travel\n App',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: '',
                letterSpacing: 1.1),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 20,
                    color: Color(0xFF1BB7C0),
                  ),
                  SizedBox(width: 8, height: 0),
                  Text(
                    'Việt Nam',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8, height: 0),
                  // Icon(
                  //   Icons.arrow_drop_down_sharp,
                  //   size: 24,
                  //   color: Color(0xFF1BB7C0),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUI(BuildContext context,) {
    return Container(
      child: Column(
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
          const SizedBox(height: 4),
          Obx(() => buildHomeSlider(context)),
          const SizedBox(height: 4),
          Obx(() => buildScrollImage(context)),
          // buildScrollImage(context),
        ],
      ),
    );
  }

  Widget buildHomeSlider(BuildContext context) {
    List<Destination> destinations = _controller.destinationOverview;
    List<DestinationImageOverview> imagesUrl = getImageUrlFromDestinationList(destinations);
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(context, 'Festival'),
          const SizedBox(height: 8),
          CarouselSliderWidget(imgList: imagesUrl),
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context, String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Color(0xFF000000),
          fontSize: 20,
          fontWeight: FontWeight.bold),
    );
  }

  Widget buildScrollImage(BuildContext context) {
    List<Destination> destinations = _controller.destinationRecommendation;
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildTitle(context, "Recommendation"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: destinations
                  .map((d) => buildScrollImageItem(context,d.imageUrls[0], d.name, d.id))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildScrollImageItem(BuildContext context,String imgUrl, String description, int id) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DestinationDetailsPage(destinationId: id)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 16, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
                width: 320,
                height: 200,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(
                color: Color(0xFF000000),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DestinationImageOverview> getImageUrlFromDestinationList(List<Destination> destinations) {
    return destinations.map((d) => DestinationImageOverview(id: d.id, imageUrl: d.imageUrls[0])).toList();
  }
}

