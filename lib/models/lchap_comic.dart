// To parse this JSON data, do
//
//     final listChapters = listChaptersFromJson(jsonString);

import 'dart:convert';

ListChapters listChaptersFromJson(String str) =>
    ListChapters.fromJson(json.decode(str));

String listChaptersToJson(ListChapters data) => json.encode(data.toJson());

class ListChapters {
  ListChapters({
    required this.chapters,
    required this.total,
  });

  List<Chapter> chapters;
  int total;

  factory ListChapters.fromJson(Map<String, dynamic> json) => ListChapters(
        chapters: List<Chapter>.from(
            json["chapters"].map((x) => Chapter.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "chapters": List<dynamic>.from(chapters.map((x) => x.toJson())),
        "total": total,
      };
}

class Chapter {
  Chapter({
    required this.id,
    required this.chap,
    required this.title,
    required this.vol,
    required this.slug,
    required this.lang,
    required this.createdAt,
    required this.updatedAt,
    required this.upCount,
    required this.downCount,
    required this.groupName,
    required this.hid,
    required this.mdGroups,
  });

  int id;
  String chap;
  String? title;
  String? vol;
  dynamic slug;
  String? lang;
  DateTime createdAt;
  DateTime updatedAt;
  int? upCount;
  int? downCount;
  dynamic groupName;
  String? hid;
  List<MdGroup> mdGroups;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json["id"],
        chap: json["chap"] ?? '0',
        title: json["title"],
        vol: json["vol"],
        slug: json["slug"],
        lang: json["lang"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        upCount: json["up_count"],
        downCount: json["down_count"],
        groupName: json["group_name"] ?? '',
        hid: json["hid"],
        mdGroups: List<MdGroup>.from(
            json["md_groups"].map((x) => MdGroup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chap": chap,
        "title": title,
        "vol": vol,
        "slug": slug,
        "lang": lang,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "up_count": upCount,
        "down_count": downCount,
        "group_name": groupName,
        "hid": hid,
        "md_groups": List<dynamic>.from(mdGroups.map((x) => x.toJson())),
      };
}

class MdGroup {
  MdGroup({
    required this.slug,
    required this.title,
  });

  String slug;
  String title;

  factory MdGroup.fromJson(Map<String, dynamic> json) => MdGroup(
        slug: json["slug"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "title": title,
      };
}
