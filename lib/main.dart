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
  sl.registerSingleton<ApiService>(ApiServiceImpl.instance);
  sl.registerSingleton<LocalStorage>(LocalStorage());
  await GetStorage.init();
  final localStorage = sl.get<LocalStorage>();
  final accessToken = await localStorage.readData('accessToken');

  Config.accessToken = accessToken;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/home', page: () => PageWrapper())
      ],
      home: PageWrapper(),
    );
  }
}
