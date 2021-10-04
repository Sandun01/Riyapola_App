class Advertisement {
  final String id;
  final String title;
  final double price;
  final String category;
  final String desccription;
  final String location;
  final String imageUrl;
  final String user;

  Advertisement({
    required this.id,
    required this.title,
    required this.desccription,
    required this.price,
    required this.category,
    required this.location,
    this.imageUrl = '',
    this.user = '',
  });
}
