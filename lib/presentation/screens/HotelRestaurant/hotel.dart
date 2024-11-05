class Hotel {
  final String name;
  final double rating;
  final String location;
  final String imageUrl;

  Hotel({required this.name, required this.rating, required this.location, required this.imageUrl});

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      name: json['name'] as String,
      rating: json['rating'] as double,
      location: json['location'] as String,
      imageUrl: json['image'] as String
    );
  }
}