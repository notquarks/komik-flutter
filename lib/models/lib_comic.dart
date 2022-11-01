// To parse this JSON data, do
//
//     final libComic = libComicFromJson(jsonString);

import 'dart:convert';

List<LibComic> libComicFromJson(String str) =>
    List<LibComic>.from(json.decode(str).map((x) => LibComic.fromJson(x)));

String libComicToJson(List<LibComic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LibComic {
  LibComic({
    required this.id,
    required this.status,
    required this.chap,
    // required this.lastAt,
    required this.hid,
    required this.createdAt,
    required this.updatedAt,
    required this.upCount,
    required this.lang,
    required this.downCount,
    // required this.mdImages,
    required this.mdComics,
    // required this.max,
    required this.count,
    // required this.distanceTime,
    // required this.lastAtDate,
  });

  final int id;
  final String status;
  final String? chap;
  // final DateTime lastAt;
  final String hid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int upCount;
  final String lang;
  final int downCount;
  // final List<MdImage?> mdImages;
  final MdComics mdComics;
  // final double? max;
  final int count;
  // final String distanceTime;
  // final DateTime lastAtDate;

  factory LibComic.fromJson(Map<String, dynamic> json) => LibComic(
        id: json["id"],
        status: json["status"],
        chap: json["chap"],
        // lastAt: DateTime.parse(json["last_at"]),
        hid: json["hid"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        upCount: json["up_count"],
        lang: json["lang"],
        downCount: json["down_count"],
        // mdImages: List<MdImage>.from(
        //     json["md_images"]?.map((x) => MdImage.fromJson(x))),
        mdComics: MdComics.fromJson(json["md_comics"]),
        // max: json["max"] ?? 0.0,
        count: json["count"],
        // distanceTime: json["distanceTime"],
        // lastAtDate: DateTime.parse(json["last_at_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "chap": chap,
        // "last_at": lastAt.toIso8601String(),
        "hid": hid,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "up_count": upCount,
        "lang": lang,
        "down_count": downCount,
        // "md_images": List<dynamic>.from(mdImages.map((x) => x?.toJson())),
        "md_comics": mdComics.toJson(),
        // "max": max,
        "count": count,
        // "distanceTime": distanceTime,
        // "last_at_date": lastAtDate.toIso8601String(),
      };
}

class MdComics {
  MdComics({
    required this.id,
    required this.title,
    required this.slug,
    required this.country,
    required this.status,
    required this.translationCompleted,
    required this.createdAt,
    required this.genres,
    required this.mdCovers,
  });

  final int id;
  final String title;
  final String slug;
  final String? country;
  final int status;
  final bool translationCompleted;
  final DateTime createdAt;
  final List<int> genres;
  final List<MdCover> mdCovers;

  factory MdComics.fromJson(Map<String, dynamic> json) => MdComics(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        country: json["country"],
        status: json["status"],
        translationCompleted: json["translation_completed"] ?? false,
        createdAt: DateTime.parse(json["created_at"]),
        genres: List<int>.from(json["genres"].map((x) => x)),
        mdCovers: List<MdCover>.from(
            json["md_covers"].map((x) => MdCover.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "country": country,
        "status": status,
        "translation_completed": translationCompleted ? false : true,
        "created_at": createdAt.toIso8601String(),
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "md_covers": List<dynamic>.from(mdCovers.map((x) => x.toJson())),
      };
}

enum Country { JP, KR, CN, GB }

final countryValues = EnumValues(
    {"cn": Country.CN, "gb": Country.GB, "jp": Country.JP, "kr": Country.KR});

class MdCover {
  MdCover({
    required this.w,
    required this.h,
    required this.url,
    required this.gpurl,
    required this.b2Key,
  });

  final int w;
  final int h;
  final String? url;
  final String? gpurl;
  final String b2Key;

  factory MdCover.fromJson(Map<String, dynamic> json) => MdCover(
        w: json["w"],
        h: json["h"],
        url: json["url"],
        gpurl: json["gpurl"],
        b2Key: json["b2key"],
      );

  Map<String, dynamic> toJson() => {
        "w": w,
        "h": h,
        "url": url,
        "gpurl": gpurl,
        "b2key": b2Key,
      };
}

class MdImage {
  MdImage({
    required this.id,
    required this.name,
    required this.mdChapterId,
    required this.w,
    required this.h,
    required this.s,
    required this.gpurl,
    required this.error,
    required this.errorCount,
    required this.b2Key,
    required this.origin,
    required this.optimized,
    required this.url,
  });

  final int id;
  final String name;
  final int mdChapterId;
  final int w;
  final int h;
  final int s;
  final dynamic gpurl;
  final String? error;
  final int errorCount;
  final String b2Key;
  final String? origin;
  final int? optimized;
  final String? url;

  factory MdImage.fromJson(Map<String, dynamic> json) => MdImage(
        id: json["id"],
        name: json["name"],
        mdChapterId: json["md_chapter_id"],
        w: json["w"],
        h: json["h"],
        s: json["s"],
        gpurl: json["gpurl"],
        error: json["error"] == null ? null : json["error"],
        errorCount: json["error_count"],
        b2Key: json["b2key"],
        origin: json["origin"] == null ? null : json["origin"],
        optimized: json["optimized"] == null ? null : json["optimized"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "md_chapter_id": mdChapterId,
        "w": w,
        "h": h,
        "s": s,
        "gpurl": gpurl,
        "error": error == null ? null : error,
        "error_count": errorCount,
        "b2key": b2Key,
        "origin": origin == null ? null : origin,
        "optimized": optimized == null ? null : optimized,
        "url": url == null ? null : url,
      };
}

enum Status { OK }

final statusValues = EnumValues({"OK": Status.OK});

class EnumValues<T> {
  Map<String, T> map;

  EnumValues(this.map);
}
