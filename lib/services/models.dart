// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  final List<Tag> tags;
  final String id;
  final String title;
  final DateTime publishedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final Poster poster;
  final String description;
  final String userId;

  Users({
    required this.tags,
    required this.id,
    required this.title,
    required this.publishedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.poster,
    required this.description,
    required this.userId,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    id: json["_id"],
    title: json["title"],
    publishedAt: DateTime.parse(json["published_at"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    poster: Poster.fromJson(json["poster"]),
    description: json["description"],
    userId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "_id": id,
    "title": title,
    "published_at": publishedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "poster": poster.toJson(),
    "description": description,
    "id": userId,
  };
}

class Poster {
  final String id;
  final String name;
  final String alternativeText;
  final String caption;
  final String hash;
  final String ext;
  final String mime;
  final double size;
  final int width;
  final int height;
  final String url;
  final Formats formats;
  final String provider;
  final List<String> related;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String posterId;

  Poster({
    required this.id,
    required this.name,
    required this.alternativeText,
    required this.caption,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.width,
    required this.height,
    required this.url,
    required this.formats,
    required this.provider,
    required this.related,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.posterId,
  });

  factory Poster.fromJson(Map<String, dynamic> json) => Poster(
    id: json["_id"],
    name: json["name"],
    alternativeText: json["alternativeText"],
    caption: json["caption"],
    hash: json["hash"],
    ext: json["ext"],
    mime: json["mime"],
    size: json["size"]?.toDouble(),
    width: json["width"],
    height: json["height"],
    url: json["url"],
    formats: Formats.fromJson(json["formats"]),
    provider: json["provider"],
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
    "ext": ext,
    "mime": mime,
    "size": size,
    "width": width,
    "height": height,
    "url": url,
    "formats": formats.toJson(),
    "provider": provider,
    "related": List<dynamic>.from(related.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": posterId,
  };
}

class Formats {
  final Large thumbnail;
  final Large large;
  final Large medium;
  final Large small;

  Formats({
    required this.thumbnail,
    required this.large,
    required this.medium,
    required this.small,
  });

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
  final String name;
  final String hash;
  final String ext;
  final String mime;
  final int width;
  final int height;
  final double size;
  final dynamic path;
  final String url;

  Large({
    required this.name,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.width,
    required this.height,
    required this.size,
    required this.path,
    required this.url,
  });

  factory Large.fromJson(Map<String, dynamic> json) => Large(
    name: json["name"],
    hash: json["hash"],
    ext: json["ext"],
    mime: json["mime"],
    width: json["width"],
    height: json["height"],
    size: json["size"]?.toDouble(),
    path: json["path"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "hash": hash,
    "ext": ext,
    "mime": mime,
    "width": width,
    "height": height,
    "size": size,
    "path": path,
    "url": url,
  };
}

class Tag {
  final String id;
  final String tag;
  final DateTime publishedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String tagId;

  Tag({
    required this.id,
    required this.tag,
    required this.publishedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.tagId,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["_id"],
    tag: json["tag"],
    publishedAt: DateTime.parse(json["published_at"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    tagId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "tag": tag,
    "published_at": publishedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": tagId,
  };
}
