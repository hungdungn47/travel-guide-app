import 'package:travel_guide_app/models/Data.dart';
import 'package:travel_guide_app/models/Destination.dart';
import 'package:travel_guide_app/models/Festival.dart';
import 'package:travel_guide_app/models/User.dart';
import 'package:travel_guide_app/networking/api/api_service.dart';
import 'package:travel_guide_app/networking/index.dart';
import 'package:travel_guide_app/presentation/screens/HotelRestaurant/hotel.dart';
import '../../models/Tour.dart';
import '../../utils/index.dart';

class ApiServiceImpl implements ApiService {
  static final ApiServiceImpl _instance = ApiServiceImpl._internal();

  final LocalStorage _localStorage = LocalStorage();

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
    return fetchData();
  }

  Future<List<Tour>> getTours() async {
    print('Getting all tours in api service');
    return fetchToursData();
  }

  List<Tour> fetchToursData() {
    return toursData();
  }

  Future<List<Destination>> fetchData() async {
    print('Start fetching');
    final response = await HttpClient.get(
        endPoint: 'api/v1/destinations/getAll');
    print('Done fetching');
    if (response == null) {
      print('No data found.');
    }
    final results = response?['results'] as List<dynamic>?;
    List<Destination> data = [];
    for (int i = 0; i < results!.length; i++) {
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

Future<List<Destination>> fetchDataByKeyword(String keyword) async {
  final response = await HttpClient.get(
      endPoint: 'api/v1/destinations/getByKeyword', queryParams: {
    "keyword": keyword
  });
  if (response == null) {
    print('No data found.');
  }
  final results = response?['results'] as List<dynamic>?;
  List<Destination> data = [];
  for (int i = 0; i < results!.length; i++) {
    final destinationJson = results[i];
    if (destinationJson == null) {
      print('No destinations found.');
      continue;
    }
    final hotel = Destination.fromJson(destinationJson);
    data.add(hotel);
  }

  return data;
  }

  Future<List<String>> fetchKeyword(String prompt) async {
    print(prompt);
    final response = await HttpClient.get(endPoint: 'api/v1/destinations/getRecommendations', queryParams: {
      "keyword": prompt,
    });
    if (response == null) {
      print('No data found.');
    }

    final results = response?['results'] as List<dynamic>;

    List<String> recommendations = [];

    for (int i = 0; i < results.length; i++) {
      recommendations.add(results[i]);
    }


    return recommendations;
  }

  Future<List<String>> fetchKeywordHotel(String prompt, String destinationId) async {
    print(prompt);
    final response = await HttpClient.get(endPoint: 'api/v1/hotels/getRecommendations', queryParams: {
      "keyword": prompt,
      "destinationId": destinationId
    });
    if (response == null) {
      print('No data found.');
    }

    final results = response?['results'] as List<dynamic>;

    List<String> recommendations = [];

    for (int i = 0; i < results.length; i++) {
      recommendations.add(results[i]);
    }


    return recommendations;
  }

  Future<List<Destination>> filterData({String? type, String? city, String? ratingRange}) async {
    Map<String, String> queryParams = {};
    if(type != null) {
      queryParams["type"] = type;
    }

    if(city != null) {
      queryParams["city"] = city;
    }

    if(ratingRange != null) {
      queryParams["ratingRange"] = ratingRange;
    }

    final response = await HttpClient.get(endPoint: 'api/v1/destinations/filter', queryParams: queryParams);
    if (response == null) {
      print('No data found.');
    }
    final results = response?['results'] as List<dynamic>?;
    List<Destination> data = [];
    for(int i = 0; i < results!.length; i++) {
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

  Future<void> apiEditUsername(String firstName, String lastName) async {
    print(firstName + lastName);
    await HttpClient.put(endPoint: 'api/customer/v1/edit', body: {
      "firstName": firstName,
      "lastName": lastName
    }
    );
  }

  Future<String> fetchUsername() async {
    final response = await HttpClient.get(endPoint: 'api/customer/v1');
    if (response == null) {
      print('No data found.');
    }
    final results = response?['results'] as dynamic;
    User user = User.fromJson(results);
    print("UwU");
    print(user.firstName + user.lastName);
    return user.firstName + user.lastName;
  }

  Future<List<Festival>> fetchFestival() async {
    final response = await HttpClient.get(endPoint: 'api/v1/festivals');
    if (response == null) {
      print('No data found.');
    }
    final results = response?['results'] as List<dynamic>?;
    List<Festival> data = [];
    for (int i = 0; i < results!.length; i++) {
      if (i <= 2) {
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
    final response = await HttpClient.get(
        endPoint: 'api/v1/hotels/getAll', queryParams: {
      "destinationId": destinationId
    });
    if (response == null) {
      print('No data found.');
    }
    final results = response?['results'] as List<dynamic>?;
    List<Hotel> data = [];
    for (int i = 0; i < results!.length; i++) {
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
    if (response == null) {
      print("No data found");
      return null;
    }
    final results = response?['results'] as dynamic;
    final des = Destination.fromJson(results);
    return des;
  }

  @override
  Future<void> login(String username, String password) async {
    final response = await HttpClient.post(
        endPoint: 'api/v1/authenticate',
        body: {
          "username": username,
          "password": password
        }
    );
    if (response == null) {
      throw Exception('Some error happen. Please try again');
    }
    if (response["code"] == 400) {
      throw Exception(response["message"]);
    }
    try {
      final results = response['results'] as dynamic;
      final String accessToken = results?['jwtToken'] as String;
      _localStorage.saveData('accessToken', accessToken);
      Config.accessToken = accessToken;
    } catch (e) {
      throw Exception('Some error happen. Please try again');
    }
  }

  @override
  Future<Map<String, dynamic>> register(String username, String password,
      String email) async {
    final response = await HttpClient.post(
        endPoint: 'api/v1/register',
        body: {
          "username": username,
          "password": password,
          "email": email,
        }
    );
    if (response == null) {
      throw Exception('Some error happen. Please try again');
    }

    final int code = response['code'] ?? -1;
    final String message = response['message'] ??
        'Hệ thống quá tải. Vui lòng thử lại sau';
    return {
      'code': code,
      'message': message,
    };
  }


  @override
  Future<List<Destination>> filterDestinations({String? type, String? city, String? ratingRange}) async {
    return await filterData(type: type, city: city, ratingRange: ratingRange);
  }

  @override
  Future<List<Destination>> getAllDestinations() async{
    return await fetchData();
  }

  @override
  Future<List<Destination>> getDestinationsByKeyword(String keyword) async {
    return await fetchDataByKeyword(keyword);
  }

  @override
  Future<List<String>> getKeyword(String prompt) {
    return fetchKeyword(prompt);
  }

  @override
  Future<List<String>> getKeywordHotel(String prompt, String destinationId) {
    return fetchKeywordHotel(prompt, destinationId);
  }


  @override
  Future<void> editUsername(String firstName, String lastName) async{
    await apiEditUsername(firstName, lastName);
  }

  @override
  Future<String> getUsername() {
    return fetchUsername();
  }
}