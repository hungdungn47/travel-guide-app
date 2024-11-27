import 'package:travel_guide_app/presentation/screens/DestinationDetails/destination_details_page.dart';

import '../../models/index.dart';
import '../../utils/index.dart';

class CarouselControllerX extends GetxController {
  var currentIndex = 0.obs;
}

class CarouselSliderWidget extends StatelessWidget {
  final List<DestinationImageOverview> imgList;

  CarouselSliderWidget({super.key, required this.imgList});

  final CarouselControllerX carouselController = Get.put(CarouselControllerX());

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: true,
              onPageChanged: (index, reason) {
                carouselController.currentIndex.value = index;
              },
            ),
            items: imgList.map((item) => buildImageSlider(context, item)).toList(),
          ),
          Positioned(
            bottom: -20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Obx(() => Container(
                      width: carouselController.currentIndex.value == index
                          ? 8.0
                          : 6.0,
                      height: carouselController.currentIndex.value == index
                          ? 8.0
                          : 6.0,
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: carouselController.currentIndex.value == index
                            ? Colors.greenAccent.withOpacity(0.8)
                            : Colors.grey.withOpacity(0.5),
                      ),
                    ));
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImageSlider(BuildContext context, DestinationImageOverview data) {
    return GestureDetector(
      onTap: () {
        if (data.id != null) {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => DestinationDetailsPage(destinationId: data.id!)),
          // );
          HelperFunctions.navigateToScreen(screen: DestinationDetailsPage(destinationId: data.id!,));
        }
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(data.imageUrl, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 12,),
          data.name != null ? Text(
            data.name ?? '',
            style: context.textTheme.bodyLarge?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ) : SizedBox(),
        ],
      ),
    );
  }
}
