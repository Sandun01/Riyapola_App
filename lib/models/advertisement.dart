class Advertisement {
  String id;
  String title;
  double price;
  String category;
  String description;
  String location;
  String imageUrl;
  String user;

  Advertisement({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.location,
    this.imageUrl = '',
    this.user = '',
  });
}
