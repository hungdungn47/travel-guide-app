class Destination {
  final String id;
  final String name;
  final String description;
  final String culturalValue;
  final List<String> imageUrl;
  final String city;
  final String location;
  String? type;

  Destination({required this.id, required this.name, required this.description, required this.culturalValue, required this.imageUrl, required this.city, required this.location, this.type});

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      culturalValue: json['culturalValue'],
      imageUrl: List<String>.from(json['imageUrl']),
      city: json['city'],
      location: json['location'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'culturalValue': culturalValue,
      'imageUrl': imageUrl,
      'city': city,
      'location': location,
      'type': type,
    };
  }
}
