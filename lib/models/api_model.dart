class ApiModel {
  final String id;
  final String title;
  final String price;
  final String desc;
  final String cat;
  final String imageUrl;
  final Rating rating;

  ApiModel(
      {required this.cat,
      required this.desc,
      required this.id,
      required this.imageUrl,
      required this.price,
      required this.rating,
      required this.title});

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    final imageUrl = json['image'] as String?;

    if (imageUrl != null && imageUrl.isNotEmpty) {
      print('Image URL: $imageUrl');
    } else {
      print('imageUrl is empty');
    }
    return ApiModel(
        cat: json['cat'].toString(),
        desc: json['desc'].toString(),
        id: json['id'].toString(),
        imageUrl: imageUrl ?? 'Noimage available',
        price: json['price'].toString(),
        rating: Rating.fromJson(json['rating']),
        title: json['title'].toString());
  }
}

class Rating {
  String rate;
  String count;

  Rating({required this.count, required this.rate});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
        count: json['count'].toString(), rate: json['rate'].toString());
  }
}
