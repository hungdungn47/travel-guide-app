class Tour {
  final String destination;
  final String location;
  final int days;
  final int nights;
  final int price;
  final String tourProvider;
  final String tourProviderWeb;
  final List<List<String>> schedule;
  final String imageUrl;

  Tour({required this.destination, required this.location, required this.days, required this.nights, required this.price, required this.tourProvider, required this.tourProviderWeb, required this.schedule, required this.imageUrl});
}