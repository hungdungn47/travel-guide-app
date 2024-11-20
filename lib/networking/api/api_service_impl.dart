import 'package:travel_guide_app/models/Data.dart';
import 'package:travel_guide_app/models/Destination.dart';
import 'package:travel_guide_app/models/Festival.dart';
import 'package:travel_guide_app/networking/api/api_service.dart';
import 'package:travel_guide_app/networking/index.dart';
import 'package:travel_guide_app/presentation/screens/HotelRestaurant/hotel.dart';

import '../../models/Tour.dart';

class ApiServiceImpl implements ApiService {
  static final ApiServiceImpl _instance = ApiServiceImpl._internal();

  ApiServiceImpl._internal();

  static ApiServiceImpl get instance => _instance;

  Future<List<Festival>> getFestivalDestination([String? province]) async {
    return fetchFestival();
  }

  Future<List<Destination>> getRecommendationDestination(
      [String? province]) async {
    return fetchData();
  }

  Future<List<Destination>> getFavoriteDestinations() async {
    const initialFavoriteDestinationsName = ['Hue', 'Tràng An', 'Hạ Long Bay'];
    List<Destination> favoriteDestinations = await fetchData();
    favoriteDestinations.removeWhere((destination) => !(initialFavoriteDestinationsName.contains(destination.name)));
    return favoriteDestinations;
  }

  Future<List<Tour>> getTours() async {
    return fetchToursData();
  }

  List<Tour> fetchToursData() {
    return Data.toursData;
  }

  Future<List<Destination>> fetchData() async {
    print('Start fetching');
    final response = await HttpClient.get(endPoint: 'api/v1/destinations/getAll');
    print('Done fetching');
    if (response == null) {
      print('No data found.');
    }
    final results = response?['results'] as List<dynamic>?;
    List<Destination> data = [];
    for(int i = 0; i < results!.length; i++) {
      if(i<=2) {
        continue;
      }
      final destinationJson = results[i];
      if (destinationJson == null) {
        print('No destination found.');
        continue;
      }
      final destination = Destination.fromJson(destinationJson);
      data.add(destination);
    }

    return data;
  }

  Future<List<Festival>> fetchFestival() async {
    final response = await HttpClient.get(endPoint: 'api/v1/festivals');
    if (response == null) {
      print('No data found.');
    }
    final results = response?['results'] as List<dynamic>?;
    List<Festival> data = [];
    for(int i = 0; i < results!.length; i++) {
      if(i<=2) {
        continue;
      }
      final destinationJson = results[i];
      if (destinationJson == null) {
        print('No destination found.');
        continue;
      }
      final destination = Festival.fromJson(destinationJson);
      data.add(destination);
    }

    return data;
  }

  Future<List<Hotel>> fetchHotels(String destinationId) async {
    final response = await HttpClient.get(endPoint: 'api/v1/hotels/getAll', queryParams: {
      "destinationId": destinationId
    });
    if (response == null) {
      print('No data found.');
    }
    final results = response?['results'] as List<dynamic>?;
    List<Hotel> data = [];
    for(int i = 0; i < results!.length; i++) {
      final hotelJson = results[i];
      if (hotelJson == null) {
        print('No hotels found.');
        continue;
      }
      final hotel = Hotel.fromJson(hotelJson);
      data.add(hotel);
    }

    return data;
  }

  @override
  Future<Destination?> getDestinationById(String id) async {
    final response = await HttpClient.get(
        endPoint: 'api/v1/destinations',
        queryParams: {
          "id": id,
        }
    );
    if(response == null) {
      print("No data found");
      return null;
    }
    final results = response?['results'] as dynamic;
    final des = Destination.fromJson(results);
    return des;
  }
}