import 'dart:async';
import 'package:get/get.dart';
import 'package:travel_guide_app/main.dart';

class SearchBarController extends GetxController {
  RxString keyword = ''.obs;
  Timer? _debounce;
  RxBool isCulture = false.obs;
  RxBool isLeisure = false.obs;
  RxBool isAdventure = false.obs;

  void changeKeyword(String newKeyword) {
    keyword.value = newKeyword;

    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(Duration(milliseconds: 500), () {
      callSearchAPI(keyword.value);
    });
  }

  void reset() {
    keyword.value = '';
    isCulture.value = false;
    isLeisure.value = false;
    isAdventure.value = false;
    if (_debounce?.isActive ?? false) _debounce!.cancel();
  }

  void callSearchAPI(String query) {
    print("Gọi API với từ khóa: $query");
  }

  void getDestinationByKeyWord(String keyword) {

  }

  @override
  void onClose() {
    _debounce?.cancel();
    reset();
    super.onClose();
  }
}
