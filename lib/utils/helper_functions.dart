import 'package:travel_guide_app/presentation/screens/DestinationDetails/destination_details_page.dart';
import 'package:travel_guide_app/presentation/screens/Home/home.dart';
import 'package:travel_guide_app/presentation/screens/HotelRestaurant/hotel_page.dart';
import 'package:travel_guide_app/presentation/screens/Search/search_page.dart';
import 'package:travel_guide_app/presentation/screens/TourRecommendation/tour_recommendation_page.dart';
import 'package:travel_guide_app/presentation/screens/page_wrapper.dart';

import '../presentation/screens/Authentication/ForgetPassword/forget_password_page.dart';
import '../presentation/screens/Authentication/Login/login_page.dart';
import 'index.dart';

class HelperFunctions {
  static void navigateToScreen({required Widget screen, Object? arguments}) {
    if (arguments != null) {
      Get.to(screen, arguments: arguments);
    } else {
      Get.to(screen);
    }
  }

  static void navigateToHotelScreen({required String destinationId}) {
    HelperFunctions.navigateToScreen(
        screen: HotelPage(
      destinationId: destinationId,
    ));
  }

  static void navigateToLoginPage() {
    HelperFunctions.navigateToScreen(
        screen: LoginPage());
  }

  static void navigateToDestinationDetail({required String destinationId}) {
    HelperFunctions.navigateToScreen(
        screen: DestinationDetailsPage(destinationId: destinationId));
  }

  static void navigateToSearchPage() {
    HelperFunctions.navigateToScreen(screen: SearchPage());
  }

  static void navigateToHomePage() {
    HelperFunctions.navigateToScreen(screen: PageWrapper());
  }

  static void navigateToTourPage(String destinationName) {
    HelperFunctions.navigateToScreen(
      screen: TourRecommendationPage(),
      arguments: {'destination': destinationName},
    );
  }

  static void navigateToChangePasswordPage() {
    HelperFunctions.navigateToScreen(screen: ForgetPasswordPage());
  }

  static void showMessage(String message, int type) {
    showSimpleNotification(
      background: type == 1
          ? const Color(0xFF5CB85C)
          : const Color(0xFFEF5350),
      Row(
        children: [
          type == 1
              ? const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.close_sharp,
                  color: Colors.white,
                ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      duration: Duration(seconds: 3),
      position: NotificationPosition.bottom,
    );
  }
}
