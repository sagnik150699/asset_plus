// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.id,
    this.tag,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.marketingPosters,
    this.userId,
  });

  Id id;
  String tag;
  DateTime publishedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<MarketingPoster> marketingPosters;
  Id userId;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: idValues.map[json["_id"]],
    tag: json["tag"],
    publishedAt: DateTime.parse(json["published_at"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    marketingPosters: List<MarketingPoster>.from(json["marketing_posters"].map((x) => MarketingPoster.fromJson(x))),
    userId: idValues.map[json["id"]],
  );

  Map<String, dynamic> toJson() => {
    "_id": idValues.reverse[id],
    "tag": tag,
    "published_at": publishedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "marketing_posters": List<dynamic>.from(marketingPosters.map((x) => x.toJson())),
    "id": idValues.reverse[userId],
  };
}

enum Id { THE_60420_AC2958_EB0_DF85_ADCC10, THE_60420_ACC958_EB0_DF85_ADCC11, THE_60420_AD6958_EB0_DF85_ADCC12, THE_6043219_B2_ACF4_CE04_EFECFB3 }

final idValues = EnumValues({
  "60420ac2958eb0df85adcc10": Id.THE_60420_AC2958_EB0_DF85_ADCC10,
  "60420acc958eb0df85adcc11": Id.THE_60420_ACC958_EB0_DF85_ADCC11,
  "60420ad6958eb0df85adcc12": Id.THE_60420_AD6958_EB0_DF85_ADCC12,
  "6043219b2acf4ce04efecfb3": Id.THE_6043219_B2_ACF4_CE04_EFECFB3
});

class MarketingPoster {
  MarketingPoster({
    this.tags,
    this.id,
    this.title,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.poster,
    this.marketingPosterId,
  });

  List<Id> tags;
  String id;
  String title;
  DateTime publishedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  Poster poster;
  String marketingPosterId;

  factory MarketingPoster.fromJson(Map<String, dynamic> json) => MarketingPoster(
    tags: List<Id>.from(json["tags"].map((x) => idValues.map[x])),
    id: json["_id"],
    title: json["title"],
    publishedAt: DateTime.parse(json["published_at"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    poster: Poster.fromJson(json["poster"]),
    marketingPosterId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "tags": List<dynamic>.from(tags.map((x) => idValues.reverse[x])),
    "_id": id,
    "title": title,
    "published_at": publishedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "poster": poster.toJson(),
    "id": marketingPosterId,
  };
}

class Poster {
  Poster({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.width,
    this.height,
    this.url,
    this.formats,
    this.provider,
    this.related,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.posterId,
  });

  String id;
  String name;
  String alternativeText;
  String caption;
  String hash;
  Ext ext;
  Mime mime;
  double size;
  int width;
  int height;
  String url;
  Formats formats;
  Provider provider;
  List<String> related;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String posterId;

  factory Poster.fromJson(Map<String, dynamic> json) => Poster(
    id: json["_id"],
    name: json["name"],
    alternativeText: json["alternativeText"],
    caption: json["caption"],
    hash: json["hash"],
    ext: extValues.map[json["ext"]],
    mime: mimeValues.map[json["mime"]],
    size: json["size"].toDouble(),
    width: json["width"],
    height: json["height"],
    url: json["url"],
    formats: Formats.fromJson(json["formats"]),
    provider: providerValues.map[json["provider"]],
    related: List<String>.from(json["related"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    posterId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "alternativeText": alternativeText,
    "caption": caption,
    "hash": hash,
    "ext": extValues.reverse[ext],
    "mime": mimeValues.reverse[mime],
    "size": size,
    "width": width,
    "height": height,
    "url": url,
    "formats": formats.toJson(),
    "provider": providerValues.reverse[provider],
    "related": List<dynamic>.from(related.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": posterId,
  };
}

enum Ext { JPEG, JPG }

final extValues = EnumValues({
  ".jpeg": Ext.JPEG,
  ".jpg": Ext.JPG
});

class Formats {
  Formats({
    this.thumbnail,
    this.large,
    this.medium,
    this.small,
  });

  Large thumbnail;
  Large large;
  Large medium;
  Large small;

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
    thumbnail: Large.fromJson(json["thumbnail"]),
    large: Large.fromJson(json["large"]),
    medium: Large.fromJson(json["medium"]),
    small: Large.fromJson(json["small"]),
  );

  Map<String, dynamic> toJson() => {
    "thumbnail": thumbnail.toJson(),
    "large": large.toJson(),
    "medium": medium.toJson(),
    "small": small.toJson(),
  };
}

class Large {
  Large({
    this.name,
    this.hash,
    this.ext,
    this.mime,
    this.width,
    this.height,
    this.size,
    this.path,
    this.url,
  });

  String name;
  String hash;
  Ext ext;
  Mime mime;
  int width;
  int height;
  double size;
  dynamic path;
  String url;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
    name: json["name"],
    hash: json["hash"],
    ext: extValues.map[json["ext"]],
    mime: mimeValues.map[json["mime"]],
    width: json["width"],
    height: json["height"],
    size: json["size"].toDouble(),
    path: json["path"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "hash": hash,
    "ext": extValues.reverse[ext],
    "mime": mimeValues.reverse[mime],
    "width": width,
    "height": height,
    "size": size,
    "path": path,
    "url": url,
  };
}

enum Mime { IMAGE_JPEG }

final mimeValues = EnumValues({
  "image/jpeg": Mime.IMAGE_JPEG
});

enum Provider { LOCAL }

final providerValues = EnumValues({
  "local": Provider.LOCAL
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
