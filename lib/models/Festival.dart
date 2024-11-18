class Festival {
  final String id;
  final String destinationId;
  final String name;
  final String imageUrl;

  Festival({
    required this.id,
    required this.name,
    this.destinationId = '',
    this.imageUrl = '',
  });

  factory Festival.fromJson(Map<String, dynamic> json) {
    return Festival(
      id: json['id'],
      name: json['name'],
      destinationId: json['destinationId'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}
