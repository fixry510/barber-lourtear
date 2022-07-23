class HairData {
  late int hairId;
  late String name;
  late String description;
  late num price;
  late List<Images> images;

  HairData({
    required this.hairId,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
  });

  HairData.fromJson(Map<String, dynamic> json) {
    hairId = json['hair_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hair_id'] = this.hairId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;

    data['images'] = this.images.map((v) => v.toJson()).toList();

    return data;
  }
}

class Images {
  late int hairImageId;
  late String imageUrl;
  late int hairId;

  Images({
    required this.hairImageId,
    required this.imageUrl,
    required this.hairId,
  });

  Images.fromJson(Map<String, dynamic> json) {
    hairImageId = json['hairImage_id'];
    imageUrl = json['image_url'];
    hairId = json['hair_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hairImage_id'] = this.hairImageId;
    data['image_url'] = this.imageUrl;
    data['hair_id'] = this.hairId;
    return data;
  }
}
