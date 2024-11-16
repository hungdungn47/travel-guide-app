import 'package:travel_guide_app/models/Destination.dart';
import 'package:travel_guide_app/networking/api/api_service.dart';

class ApiServiceImpl implements ApiService {
  static final ApiServiceImpl _instance = ApiServiceImpl._internal();

  ApiServiceImpl._internal();

  static ApiServiceImpl get instance => _instance;

  @override
  Future<List<Destination>> getFestivalDestination([String? province]) async {
    return fetchData();
  }

  @override
  Future<List<Destination>> getRecommendationDestination(
      [String? province]) async {
    return fetchData();
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
