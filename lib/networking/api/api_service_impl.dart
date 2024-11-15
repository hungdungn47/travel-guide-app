import 'package:travel_guide_app/models/Destination.dart';
import 'package:travel_guide_app/networking/api/api_service.dart';

import '../../models/Tour.dart';

class ApiServiceImpl implements ApiService {
  static final ApiServiceImpl _instance = ApiServiceImpl._internal();

  ApiServiceImpl._internal();

  static ApiServiceImpl get instance => _instance;

  Future<List<Destination>> getFestivalDestination([String? province]) async {
    return fetchData();
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

  List<Destination> fetchData() {
    return [
      Destination(
          id: 1,
          name: 'Tràng An, Ninh Bình',
          description:
          'Tràng An, Ninh Bình là một vùng thiên nhiên hoang sơ với rừng rậm, sông suối trong lành và cảnh quan độc đáo...',
          culturalValue:
          "Tín ngưỡng tâm linh: Tràng An có nhiều ngôi chùa, đền và phủ cổ kính như chùa Bái Đính, đền Trần và đền Vũ Lâm...",
          imageUrls: [
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTm9H1Z2CiFWMZsNPqvpQlh86ZyBoNkUe2xvQ&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvViDbz4Gki2KJPGl4I5twx6daGgPcN9H1hA&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpKFm3YIM4xermf0U29fKLuxOJ2sOCSVP4Zg&s'
          ],
          provinceCode: 37,
          location: 'Tràng An, Ninh Bình'),
      Destination(
          id: 2,
          name: 'Hạ Long Bay, Quảng Ninh',
          description:
          'Hạ Long Bay, Quảng Ninh nổi tiếng với hàng nghìn hòn đảo đá vôi, những hang động kỳ bí và là di sản thiên nhiên thế giới...',
          culturalValue:
          "Hạ Long là nơi có nhiều ngôi làng chài và truyền thống đánh bắt thủy sản của ngư dân địa phương...",
          imageUrls: [
            'https://bcp.cdnchinhphu.vn/344443456812359680/2023/3/9/halong-16783543829461323593123.jpg',
            'https://hanoiexploretravel.com/wp-content/uploads/2024/03/ha-long-bay-located.jpg',
            'https://puluongexcursions.com/wp-content/uploads/2023/05/halong-bay-travel-guide.jpg'
          ],
          provinceCode: 14,
          location: 'Hạ Long Bay, Quảng Ninh'),
      Destination(
          id: 3,
          name: 'Phú Quốc, Kiên Giang',
          description:
          'Phú Quốc, Kiên Giang là hòn đảo lớn nhất Việt Nam với bãi biển tuyệt đẹp, nước biển trong xanh và những khu rừng nhiệt đới...',
          culturalValue:
          "Phú Quốc có những lễ hội dân gian như lễ hội Dinh Cậu, lễ hội cầu ngư, mang đậm bản sắc văn hóa biển đảo...",
          imageUrls: [
            'https://vietnam.travel/sites/default/files/inline-images/du-lich-phu-quoc-thang-10-.jpeg',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuYqSs5RerZ8QeFaPtrRzEW4yl2DkKrglKcQ&s',
            'https://httravelhanoi.com/wp-content/uploads/2019/12/dao-ngoc-phu-quoc.jpg'
          ],
          provinceCode: 10,
          location: 'Phú Quốc, Kiên Giang'),
      Destination(
          id: 4,
          name: 'Sapa, Lào Cai',
          description:
          'Sapa nổi tiếng với cảnh đẹp núi non hùng vĩ, những thửa ruộng bậc thang, và bản sắc văn hóa dân tộc thiểu số...',
          culturalValue:
          "Sapa là nơi sinh sống của nhiều dân tộc như H'mông, Tày, và Giáy, với những phong tục, lễ hội truyền thống đặc sắc...",
          imageUrls: [
            'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/ba/2f/7f/caption.jpg?w=1200&h=1200&s=1',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSxoOquql4EaE_nLOw48O8D1RyxBRcS3WsZQZpd2ftGihdEK4qOpRcUqT2ptzusTSelbg&usqp=CAU',
            'https://cdn3.ivivu.com/2023/02/T%E1%BB%95ng-quan-du-l%E1%BB%8Bch-Sapa-ivivu.jpg'
          ],
          provinceCode: 23,
          location: 'Sapa, Lào Cai'),
      Destination(
          id: 5,
          name: 'Hue, Thừa Thiên Huế',
          description:
          'Huế là thành phố cổ kính, nổi tiếng với các di tích lịch sử, chùa chiền, đền đài và các công trình văn hóa...',
          culturalValue:
          "Huế là kinh đô xưa của Việt Nam, với những lễ hội lớn như lễ hội Huế, mang đậm nét văn hóa cung đình...",
          imageUrls: [
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbrePyk4fBjmDDszSrwxxkfbxSKiXPdYY43g&s',
            'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj63eDLCGNEcjOWV8_Du1Sn7uDYN_yDDY7WfmaWRBfGdw1c8oM4B_8Wwa0PChaCjYcX_wyUyVGUrjPitwJ7kz_whEIpMIuUtAbjYIeyV2s4PU6b-263hq45FxN9lmf9-uvs27z2Au-qPWI0/w1200-h630-p-k-no-nu/HUE+-+VIETNAM+dai_noi_hue_2_2.jpg',
            'https://static.vinwonders.com/2023/02/song-huong-hue-1.jpg'
          ],
          provinceCode: 48,
          location: 'Hue, Thừa Thiên Huế'),
      Destination(
          id: 6,
          name: 'Mộc Châu, Sơn La',
          description:
          'Mộc Châu nổi tiếng với những cánh đồng hoa mận, hoa đào, cùng khí hậu mát mẻ và phong cảnh hùng vĩ...',
          culturalValue:
          "Mộc Châu có nhiều lễ hội dân gian như lễ hội mừng cơm mới, lễ hội té nước của người Thái...",
          imageUrls: [
            'https://cdn.tgdd.vn/Files/2021/06/23/1362660/12-dia-diem-du-lich-moc-chau-dep-nhat-ban-khong-the-bo-qua-202303081537442039.jpg',
            'https://cf.bstatic.com/xdata/images/hotel/max1024x768/471605636.jpg?k=15b8e41272858214c9cc754b918b40a1f297d2a10542611b4554bfe6721dbb0f&o=&hp=1',
            'https://6.img.izshop.vn/tv31/images/tour/2020/05/origin/ccabd16d42c0f061647a7ad75759a33b.jpg'
          ],
          provinceCode: 19,
          location: 'Mộc Châu, Sơn La')
    ];
  }


  @override
  Future<Destination?> getDestinationById(int id) async {
    List<Destination> destinations = fetchData();
    for (var destination in destinations) {
      if (destination.id == id) {
        return destination;
      }
    }
    return null;
  }
}