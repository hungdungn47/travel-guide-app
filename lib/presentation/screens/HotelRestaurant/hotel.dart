class Hotel {
  final String name;
  final double rating;
  final String location;
  final String? imageUrl; // Made nullable

  Hotel({
    required this.name,
    required this.rating,
    required this.location,
    this.imageUrl, // Nullable field
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      name: json['name'] as String,
      rating: json['rating'] as double,
      location: json['location'] as String,
      imageUrl: json['imageUrl'] as String? ?? 'https://hoteldel.com/wp-content/uploads/2021/01/hotel-del-coronado-views-suite-K1TOS1-K1TOJ1-1600x900-1.jpg', // Default value
    );
  }
}
