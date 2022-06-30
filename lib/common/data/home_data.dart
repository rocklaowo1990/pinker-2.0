class HomeData {
  HomeData({
    required this.banner,
    required this.types,
    required this.size,
  });

  List<HomeDataBanner> banner;
  List<HomeDataType> types;
  int size;

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
        banner: List<HomeDataBanner>.from(
            json["banner"].map((x) => HomeDataBanner.fromJson(x))),
        types: List<HomeDataType>.from(
            json["types"].map((x) => HomeDataType.fromJson(x))),
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "size": size,
      };

  static Map<String, dynamic> child = {
    "banner": <HomeDataBanner>[],
    "types": <HomeDataType>[],
    "size": 0,
  };
}

class HomeDataBanner {
  HomeDataBanner({
    required this.image,
    required this.bannerType,
    required this.title,
    this.bannerUrl,
  });

  String image;
  int bannerType;
  String title;
  String? bannerUrl;

  factory HomeDataBanner.fromJson(Map<String, dynamic> json) => HomeDataBanner(
        image: json["image"],
        bannerType: json["bannerType"],
        title: json["title"],
        bannerUrl: json["bannerUrl"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "bannerType": bannerType,
        "title": title,
        "bannerUrl": bannerUrl,
      };
}

class HomeDataType {
  HomeDataType({
    required this.typeId,
    required this.typeName,
  });

  int typeId;
  String typeName;

  factory HomeDataType.fromJson(Map<String, dynamic> json) => HomeDataType(
        typeId: json["typeId"],
        typeName: json["typeName"],
      );

  Map<String, dynamic> toJson() => {
        "typeId": typeId,
        "typeName": typeName,
      };
}
