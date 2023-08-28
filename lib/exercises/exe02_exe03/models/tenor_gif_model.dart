class TenorGifModel {
  String id = "";
  String title = "";
  String description = "";
  String imageURL = "";

  TenorGifModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageURL});

  TenorGifModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["content_description"];
    imageURL = json["media_formats"]["gif"]["url"];
  }

  String get imageTitle {
    if (!title.isEmpty) return title;

    return description;
  }
}
