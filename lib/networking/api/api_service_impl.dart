import 'package:travel_guide_app/models/Destination.dart';
import 'package:travel_guide_app/models/Festival.dart';
import 'package:travel_guide_app/networking/api/api_service.dart';
import 'package:travel_guide_app/networking/index.dart';

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
    return fetchData();
  }

  Future<List<Tour>> getTours() async {
    return fetchToursData();
  }

  List<Tour> fetchToursData() {
    return [
      Tour(
        destination: "Ha Long Bay",
        location: "Quang Ninh, Vietnam",
        days: 3,
        nights: 2,
        price: 130,
        tourProvider: "Vietnam Explorer",
        tourProviderWeb: "https://vietnamexplorer.com",
        schedule: [
          ["7:30 AM: Depart from Hanoi", "11:00 AM: Check-in at the hotel", "2:00 PM: Explore Ha Long Bay by cruise", "6:30 PM: Dinner on the cruise"],
          ["8:00 AM: Visit Thien Cung Cave", "10:00 AM: Swim at Bai Chay Beach", "12:00 PM: Lunch at a local restaurant", "3:00 PM: Shop for Ha Long specialties"],
          ["8:00 AM: Breakfast at the hotel", "9:00 AM: Return to Hanoi"],
        ],
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5SpfqOAFzZ3O3_3EvX3oTvdsT1Cr7VUjo_Q&s',
      ),
      Tour(
        destination: "Da Nang",
        location: "Da Nang, Vietnam",
        days: 4,
        nights: 3,
        price: 190,
        tourProvider: "Saigon Travel",
        tourProviderWeb: "https://saigontravel.com",
        schedule: [
          ["7:00 AM: Pickup at the airport", "9:30 AM: Hotel check-in", "2:00 PM: Visit Marble Mountains", "7:00 PM: Dinner in Hoi An Ancient Town"],
          ["7:00 AM: Depart for Ba Na Hills", "9:00 AM: Experience Golden Bridge", "12:00 PM: Buffet lunch at the summit", "3:00 PM: Enjoy Fantasy Park"],
          ["8:00 AM: Swim at My Khe Beach", "10:00 AM: Shop at Con Market", "2:00 PM: Visit Dragon Bridge and Han River Bridge"],
          ["7:00 AM: Breakfast at the hotel", "10:00 AM: Check-out and return home"],
        ],
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSY7yb5Ki_KWzCekqLcpZLR7PyG0Sd7jrWag&s',
      ),
      Tour(
        destination: "Nha Trang",
        location: "Khanh Hoa, Vietnam",
        days: 3,
        nights: 2,
        price: 150,
        tourProvider: "Viet Travel",
        tourProviderWeb: "https://viettravel.com",
        schedule: [
          ["8:00 AM: Pickup at Cam Ranh Airport", "11:00 AM: Hotel check-in", "2:00 PM: Visit Ponagar Towers", "6:30 PM: Seafood dinner at a local restaurant"],
          ["7:30 AM: Explore VinWonders", "10:00 AM: Ride the sea-crossing cable car", "12:00 PM: Lunch at VinWonders", "4:00 PM: Swim at Hon Tam Beach"],
          ["8:00 AM: Breakfast at the hotel", "10:00 AM: Check-out and shop at Dam Market", "12:00 PM: Return to the airport"],
        ],
          imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-J6wFA2iVZAVyeFTcTR-0XxvxxnvkWRkjbA&s'
      ),
      Tour(
        destination: "Da Lat",
        location: "Lam Dong, Vietnam",
        days: 3,
        nights: 2,
        price: 120,
        tourProvider: "Fiditour",
        tourProviderWeb: "https://fiditour.com",
        schedule: [
          ["6:30 AM: Depart from Ho Chi Minh City", "12:00 PM: Check-in at Da Lat", "2:00 PM: Visit Valley of Love", "6:00 PM: Dinner at a local restaurant"],
          ["8:00 AM: Explore Cau Dat Tea Hill", "11:00 AM: Visit Truc Lam Zen Monastery", "2:00 PM: Walk around Xuan Huong Lake", "5:00 PM: Enjoy local BBQ specialties"],
          ["8:00 AM: Shop at Da Lat Market", "10:00 AM: Check-out and return to Ho Chi Minh City"],
        ],
          imageUrl: 'https://cdn3.ivivu.com/2023/10/du-lich-Da-Lat-ivivu1.jpg'
      ),
      Tour(
        destination: "Phu Quoc",
        location: "Kien Giang, Vietnam",
        days: 5,
        nights: 4,
        price: 300,
        tourProvider: "Paradise Tours",
        tourProviderWeb: "https://paradisetours.com",
        schedule: [
          ["8:00 AM: Pickup at Phu Quoc Airport", "11:00 AM: Resort check-in", "2:00 PM: Visit VinWonders", "6:00 PM: Dinner by the beach"],
          ["7:30 AM: Explore Phu Quoc Safari", "12:00 PM: Lunch at Safari", "2:00 PM: Swim at Sao Beach", "7:00 PM: Fresh seafood dinner"],
          ["8:00 AM: Visit Ham Ninh Fishing Village", "11:00 AM: Tour Phu Quoc Fish Sauce Factory", "3:00 PM: Explore Dinh Cau Night Market"],
          ["8:00 AM: Fishing on the sea", "11:00 AM: Lunch on the boat", "4:00 PM: Sunset at Sunset Sanato"],
          ["8:00 AM: Breakfast at the resort", "10:00 AM: Check-out and transfer to the airport"],
        ],
          imageUrl: 'https://vcdn1-dulich.vnecdn.net/2022/04/08/dulichPhuQuoc-1649392573-9234-1649405369.jpg?w=0&h=0&q=100&dpr=2&fit=crop&s=SU6n3IvJxW1Sla0xqg31Kg'
      ),
    ];
  }

  Future<List<Destination>> fetchData() async {
    final response = await HttpClient.get(endPoint: 'api/v1/destinations/getAll');
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