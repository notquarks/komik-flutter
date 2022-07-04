// To parse this JSON data, do
//
//     final topComic = topComicFromJson(jsonString);

import 'dart:convert';

TopComic topComicFromJson(String str) => TopComic.fromJson(json.decode(str));

String topComicToJson(TopComic data) => json.encode(data.toJson());

class TopComic {
  TopComic({
    required this.rank,
    required this.recentRank,
    required this.trending,
    required this.follows,
    required this.news,
    required this.completions,
    required this.topFollowNewComics,
    required this.topFollowComics,
  });

  final List<Completion> rank;
  final List<Completion> recentRank;
  final Map<String, List<TopFollowNewComic>> trending;
  final List<Follow> follows;
  final List<Completion> news;
  final List<Completion> completions;
  final Map<String, List<TopFollowNewComic>> topFollowNewComics;
  final Map<String, List<TopFollowComic>> topFollowComics;

  factory TopComic.fromJson(Map<String, dynamic> json) => TopComic(
        rank: List<Completion>.from(
            json["rank"].map((x) => Completion.fromJson(x))),
        recentRank: List<Completion>.from(
            json["recentRank"].map((x) => Completion.fromJson(x))),
        trending: Map.from(json["trending"]).map((k, v) =>
            MapEntry<String, List<TopFollowNewComic>>(
                k,
                List<TopFollowNewComic>.from(
                    v.map((x) => TopFollowNewComic.fromJson(x))))),
        follows:
            List<Follow>.from(json["follows"].map((x) => Follow.fromJson(x))),
        news: List<Completion>.from(
            json["news"].map((x) => Completion.fromJson(x))),
        completions: List<Completion>.from(
            json["completions"].map((x) => Completion.fromJson(x))),
        topFollowNewComics: Map.from(json["topFollowNewComics"]).map((k, v) =>
            MapEntry<String, List<TopFollowNewComic>>(
                k,
                List<TopFollowNewComic>.from(
                    v.map((x) => TopFollowNewComic.fromJson(x))))),
        topFollowComics: Map.from(json["topFollowComics"]).map((k, v) =>
            MapEntry<String, List<TopFollowComic>>(
                k,
                List<TopFollowComic>.from(
                    v.map((x) => TopFollowComic.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "rank": List<dynamic>.from(rank.map((x) => x.toJson())),
        "recentRank": List<dynamic>.from(recentRank.map((x) => x.toJson())),
        "trending": Map.from(trending).map((k, v) => MapEntry<String, dynamic>(
            k, List<dynamic>.from(v.map((x) => x.toJson())))),
        "follows": List<dynamic>.from(follows.map((x) => x.toJson())),
        "news": List<dynamic>.from(news.map((x) => x.toJson())),
        "completions": List<dynamic>.from(completions.map((x) => x.toJson())),
        "topFollowNewComics": Map.from(topFollowNewComics).map((k, v) =>
            MapEntry<String, dynamic>(
                k, List<dynamic>.from(v.map((x) => x.toJson())))),
        "topFollowComics": Map.from(topFollowComics).map((k, v) =>
            MapEntry<String, dynamic>(
                k, List<dynamic>.from(v.map((x) => x.toJson())))),
      };
}

class Completion {
  Completion({
    required this.slug,
    required this.title,
    required this.demographic,
    required this.genres,
    required this.createdAt,
    required this.uploadedAt,
    required this.lastChapter,
    required this.mdCovers,
  });

  final String slug;
  final String title;
  final String? demographic;
  final List<int> genres;
  final DateTime? createdAt;
  final DateTime? uploadedAt;
  final String? lastChapter;
  final List<MdCover> mdCovers;

  factory Completion.fromJson(Map<String, dynamic> json) => Completion(
        slug: json["slug"],
        title: json["title"],
        demographic: json["demographic"].toString(),
        genres: List<int>.from(json["genres"].map((x) => x)),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        uploadedAt: json["uploaded_at"] == null
            ? null
            : DateTime.parse(json["uploaded_at"]),
        lastChapter: json["last_chapter"].toString(),
        mdCovers: List<MdCover>.from(
            json["md_covers"].map((x) => MdCover.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "title": title,
        "demographic": demographic ?? demographic,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "created_at": createdAt ?? createdAt?.toIso8601String(),
        "uploaded_at": uploadedAt ?? uploadedAt?.toIso8601String(),
        "last_chapter": lastChapter ?? lastChapter,
        "md_covers": List<dynamic>.from(mdCovers.map((x) => x.toJson())),
      };
}

class MdCover {
  MdCover({
    required this.w,
    required this.h,
    required this.b2Key,
    this.gpurl,
    required this.vol,
  });

  final int w;
  final int h;
  final String b2Key;
  final String? gpurl;
  final String? vol;

  factory MdCover.fromJson(Map<String, dynamic> json) => MdCover(
        w: json["w"],
        h: json["h"],
        b2Key: json["b2key"],
        gpurl: json["gpurl"],
        vol: json["vol"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "w": w,
        "h": h,
        "b2key": b2Key,
        "gpurl": gpurl,
        "vol": vol,
      };
}

class Follow {
  Follow({
    required this.createdAt,
    required this.identities,
    required this.mdComics,
  });

  final DateTime createdAt;
  final Identities identities;
  final MdComics mdComics;

  factory Follow.fromJson(Map<String, dynamic> json) => Follow(
        createdAt: DateTime.parse(json["created_at"]),
        identities: Identities.fromJson(json["identities"]),
        mdComics: MdComics.fromJson(json["md_comics"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "identities": identities.toJson(),
        "md_comics": mdComics.toJson(),
      };
}

class Identities {
  Identities({
    required this.id,
    required this.traits,
  });

  final String id;
  final Traits traits;

  factory Identities.fromJson(Map<String, dynamic> json) => Identities(
        id: json["id"],
        traits: Traits.fromJson(json["traits"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "traits": traits.toJson(),
      };
}

class Traits {
  Traits({
    required this.username,
    required this.id,
    required this.gravatar,
  });

  final String username;
  final String id;
  final String gravatar;

  factory Traits.fromJson(Map<String, dynamic> json) => Traits(
        username: json["username"],
        id: json["id"],
        gravatar: json["gravatar"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "id": id,
        "gravatar": gravatar,
      };
}

class MdComics {
  MdComics({
    required this.id,
    required this.title,
    required this.slug,
    required this.followCount,
    required this.mdCovers,
  });

  final int id;
  final String title;
  final String slug;
  final int followCount;
  final List<MdCover> mdCovers;

  factory MdComics.fromJson(Map<String, dynamic> json) => MdComics(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        followCount: json["follow_count"],
        mdCovers: List<MdCover>.from(
            json["md_covers"].map((x) => MdCover.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "follow_count": followCount,
        "md_covers": List<dynamic>.from(mdCovers.map((x) => x.toJson())),
      };
}

class TopFollowComic {
  TopFollowComic({
    required this.title,
    required this.slug,
    required this.id,
    required this.mdCovers,
    required this.count,
  });

  final String title;
  final String slug;
  final int id;
  final List<MdCover> mdCovers;
  final int count;

  factory TopFollowComic.fromJson(Map<String, dynamic> json) => TopFollowComic(
        title: json["title"],
        slug: json["slug"],
        id: json["id"],
        mdCovers: List<MdCover>.from(
            json["md_covers"].map((x) => MdCover.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "slug": slug,
        "id": id,
        "md_covers": List<dynamic>.from(mdCovers.map((x) => x.toJson())),
        "count": count,
      };
}

class TopFollowNewComic {
  TopFollowNewComic({
    required this.title,
    required this.slug,
    required this.mdCovers,
  });

  final String title;
  final String slug;
  final List<MdCover> mdCovers;

  factory TopFollowNewComic.fromJson(Map<String, dynamic> json) =>
      TopFollowNewComic(
        title: json["title"],
        slug: json["slug"],
        mdCovers: List<MdCover>.from(
            json["md_covers"].map((x) => MdCover.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "slug": slug,
        "md_covers": List<dynamic>.from(mdCovers.map((x) => x.toJson())),
      };
}
