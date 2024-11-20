import 'package:get_storage/get_storage.dart';
import 'package:travel_guide_app/presentation/screens/Authentication/Login/login_page.dart';
import 'package:travel_guide_app/presentation/screens/page_wrapper.dart';
import 'package:travel_guide_app/utils/index.dart';

import './networking/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

Future<void> setup() async {
  // final response = await HttpClient.post(
  //     endPoint: 'api/v1/authenticate',
  //     body: {
  //       "username": 'test1223',
  //       "password": 'test1223'
  //     }
  // );
  // if(response == null) {
  //   print("Login failed");
  //   return null;
  // }
  // final results = response?['results'] as dynamic;
  // final String accessToken = results?['jwtToken'] as String;
  // print(accessToken);
  await GetStorage.init();
  sl.registerSingleton<ApiService>(ApiServiceImpl.instance);
  // sl.registerLazySingleton<LocalStorage>(() => LocalStorage());
  final localStorage = LocalStorage();
  final accessToken = await localStorage.readData('accessToken');

  print(accessToken);

  if(accessToken != null) {
    Config.accessToken = accessToken;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        initialRoute: Config.accessToken.isNotEmpty ? '/home' : '/login',
        getPages: [
          GetPage(name: '/login', page: () => LoginPage()),
          GetPage(name: '/home', page: () => PageWrapper())
        ]
    ));
  }
}
