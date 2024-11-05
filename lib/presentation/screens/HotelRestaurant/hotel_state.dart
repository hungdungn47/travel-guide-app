import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_guide_app/presentation/screens/HotelRestaurant/hotel.dart';

part 'hotel_state.freezed.dart';

@freezed
class HotelState with _$HotelState {
  const factory HotelState({
    @Default(false) bool loading,
    @Default(true) bool isRecommending,
    @Default(false) bool isDone,
    @Default([]) List<Hotel> hotels,
    @Default('') String currentSearchPrompt,
    @Default(0) int currentIndex
  }) = _HotelState;
}