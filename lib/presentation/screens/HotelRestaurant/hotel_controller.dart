import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_guide_app/presentation/screens/HotelRestaurant/hotel_state.dart';

import 'hotel.dart';

class HotelController extends Cubit<HotelState> {
  HotelController() : super(const HotelState()) {
    _init();
  }

  late ScrollController _sc;

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  void _init() async {
    _sc = ScrollController();
    _sc.addListener(() async {
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        if(!state.isRecommending && !state.isDone) {
          await _addToHotelLists();
        }
      }
    });
    await getRecommendationLists();
  }


  ScrollController getScrollController() {
    return _sc;
  }

  Future<void> _addToHotelLists() async {
    if (!state.loading) {
      emit(state.copyWith(loading: true));
    }

    List<Hotel> hotelsToAdd = await _search(state.currentSearchPrompt, 0);
    List<Hotel> currentHotels = [];

    currentHotels.addAll(state.hotels);

    for (Hotel hotel in hotelsToAdd) {
      currentHotels.add(hotel);
    }

    for(int i = state.hotels.length; i < currentHotels.length; i++) {
      listKey.currentState!
          .insertItem(i, duration: const Duration(milliseconds: 500));
    }

    emit(state.copyWith(
        currentIndex: currentHotels.length,
        hotels: currentHotels,
        loading: false,
        isRecommending: false));
  }

  Future<void> updateHotelLists(String prompt) async {
    for(int i = 0; i < state.hotels.length; i++) {
      listKey.currentState!.removeItem(0, (context, animation) => Container(),
          duration: Duration.zero);
    }

    if (!state.loading) {
      emit(state.copyWith(loading: true, hotels: []));
    }

    List<Hotel> updatedHotels = await _search(prompt, 0);

    for(int i = 0; i < updatedHotels.length; i++) {
      listKey.currentState!
          .insertItem(i, duration: const Duration(milliseconds: 500));
    }

    emit(state.copyWith(
        currentIndex: updatedHotels.length,
        isRecommending: false,
        currentSearchPrompt: prompt,
        loading: false,
        hotels: updatedHotels));
  }

  Future<List<String>> getSuggestion(String prompt) async {
    List<String> suggestions = ['This', 'shit', 'is', 'so', 'cool', 'WTF'];
    return suggestions;
  }

  Future<void> getRecommendationLists() async {
    if (!state.loading) {
      emit(state.copyWith(loading: true, hotels: []));
    }
    // Only for demonstration
    List<Hotel> recommendations = await _search("Recommendation", 0);
    for(int i = 0; i < recommendations.length; i++) {
      listKey.currentState!
          .insertItem(i, duration: const Duration(milliseconds: 500));
    }
    emit(state.copyWith(hotels: recommendations, loading: false));
  }

  Future<List<Hotel>> _search(String prompt, int startIndex) async {
    await Future.delayed(const Duration(seconds: 2));
    List<Hotel> hotels = [];
    for (int i = 0; i < 10; i++) {
      hotels.add(Hotel(
          name: 'Royal Palace',
          rating: 4.7,
          location: 'Somewhere in Vietnam',
          imageUrl: 'https://picsum.photos/200'));
    }
    return hotels;
  }
}
