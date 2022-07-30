// To parse this JSON data, do
//
//     final detailsComic = detailsComicFromJson(jsonString);

import 'dart:convert';

import 'package:komik_flutter/models/lib_comic.dart';

DetailsComic detailsComicFromJson(String str) =>
    DetailsComic.fromJson(json.decode(str));

String detailsComicToJson(DetailsComic data) => json.encode(data.toJson());

class DetailsComic {
  DetailsComic({
    required this.chapter,
    required this.next,
    required this.prev,
    required this.matureContent,
    required this.chapters,
    required this.dupGroupChapters,
    required this.chapterLangList,
    required this.canonical,
    required this.seoTitle,
    required this.seoDescription,
    required this.chapTitle,
    required this.checkVol2Chap1,
  });

  Chapter chapter;
  dynamic next;
  dynamic prev;
  bool matureContent;
  List<Next> chapters;
  List<Next> dupGroupChapters;
  List<ChapterLangList> chapterLangList;
  String? canonical;
  String? seoTitle;
  String? seoDescription;
  String? chapTitle;
  bool checkVol2Chap1;

  factory DetailsComic.fromJson(Map<String, dynamic> json) => DetailsComic(
        chapter: Chapter.fromJson(json["chapter"]),
        next: json["next"],
        prev: json["prev"],
        matureContent: json["matureContent"],
        chapters:
            List<Next>.from(json["chapters"].map((x) => Next.fromJson(x))),
        dupGroupChapters: List<Next>.from(
            json["dupGroupChapters"].map((x) => Next.fromJson(x))),
        chapterLangList: List<ChapterLangList>.from(
            json["chapterLangList"].map((x) => ChapterLangList.fromJson(x))),
        canonical: json["canonical"],
        seoTitle: json["seoTitle"],
        seoDescription: json["seoDescription"],
        chapTitle: json["chapTitle"],
        checkVol2Chap1: json["checkVol2Chap1"],
      );

  Map<String, dynamic> toJson() => {
        "chapter": chapter.toJson(),
        "next": next,
        "prev": prev,
        "matureContent": matureContent,
        "chapters": List<dynamic>.from(chapters.map((x) => x.toJson())),
        "dupGroupChapters":
            List<dynamic>.from(dupGroupChapters.map((x) => x.toJson())),
        "chapterLangList":
            List<dynamic>.from(chapterLangList.map((x) => x.toJson())),
        "canonical": canonical,
        "seoTitle": seoTitle,
        "chapTitle": chapTitle,
        "checkVol2Chap1": checkVol2Chap1,
      };
}

class Chapter {
  Chapter({
    required this.id,
    required this.chap,
    required this.vol,
    required this.title,
    required this.server,
    required this.hid,
    required this.hash,
    required this.groupName,
    required this.chapterId,
    required this.createdAt,
    required this.mdid,
    required this.commentCount,
    required this.upCount,
    required this.downCount,
    required this.status,
    required this.lang,
    required this.mseid,
    required this.mdComics,
    required this.mdImages,
    required this.mdChaptersGroups,
  });

  int? id;
  String? chap;
  dynamic vol;
  String? title;
  String? server;
  String hid;
  String? hash;
  dynamic groupName;
  dynamic chapterId;
  DateTime createdAt;
  dynamic mdid;
  int? commentCount;
  int? upCount;
  int? downCount;
  String? status;
  String lang;
  String? mseid;
  MdComics mdComics;
  List<MdImage> mdImages;
  List<dynamic> mdChaptersGroups;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json["id"],
        chap: json["chap"],
        vol: json["vol"],
        title: json["title"],
        server: json["server"],
        hid: json["hid"],
        hash: json["hash"],
        groupName: json["group_name"],
        chapterId: json["chapter_id"],
        createdAt: DateTime.parse(json["created_at"]),
        mdid: json["mdid"],
        commentCount: json["comment_count"],
        upCount: json["up_count"],
        downCount: json["down_count"],
        status: json["status"],
        lang: json["lang"],
        mseid: json["mseid"],
        mdComics: MdComics.fromJson(json["md_comics"]),
        mdImages: List<MdImage>.from(
            json["md_images"].map((x) => MdImage.fromJson(x))),
        mdChaptersGroups:
            List<dynamic>.from(json["md_chapters_groups"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chap": chap,
        "vol": vol,
        "title": title,
        "server": server,
        "hid": hid,
        "hash": hash,
        "group_name": groupName,
        "chapter_id": chapterId,
        "created_at": createdAt.toIso8601String(),
        "mdid": mdid,
        "comment_count": commentCount,
        "up_count": upCount,
        "down_count": downCount,
        "status": status,
        "lang": lang,
        "mseid": mseid,
        "md_comics": mdComics.toJson(),
        "md_images": List<dynamic>.from(mdImages.map((x) => x.toJson())),
        "md_chapters_groups":
            List<dynamic>.from(mdChaptersGroups.map((x) => x)),
      };
}

class MdComics {
  MdComics({
    required this.id,
    required this.title,
    required this.country,
    required this.slug,
    required this.desc,
    required this.links,
    required this.genres,
    required this.hentai,
    required this.contentRating,
    required this.mdCovers,
  });

  int id;
  String? title;
  String? country;
  String? slug;
  String? desc;
  Links links;
  List<int> genres;
  bool hentai;
  String? contentRating;
  List<MdCover> mdCovers;

  factory MdComics.fromJson(Map<String, dynamic> json) => MdComics(
        id: json["id"],
        title: json["title"],
        country: json["country"],
        slug: json["slug"],
        desc: json["desc"],
        links: Links.fromJson(json["links"]),
        genres: List<int>.from(json["genres"].map((x) => x)),
        hentai: json["hentai"],
        contentRating: json["content_rating"],
        mdCovers: List<MdCover>.from(
            json["md_covers"].map((x) => MdCover.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "country": country,
        "slug": slug,
        "desc": desc,
        "links": links.toJson(),
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "hentai": hentai,
        "content_rating": contentRating,
        "md_covers": List<dynamic>.from(mdCovers.map((x) => x.toJson())),
      };
}

class Links {
  Links({
    required this.al,
    required this.ap,
    required this.bw,
    required this.kt,
    required this.mu,
    required this.amz,
    required this.cdj,
    required this.ebj,
    required this.mal,
    required this.raw,
    required this.engtl,
  });

  String? al;
  String? ap;
  String? bw;
  String? kt;
  String? mu;
  String? amz;
  String? cdj;
  String? ebj;
  String? mal;
  String? raw;
  String? engtl;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        al: json["al"],
        ap: json["ap"],
        bw: json["bw"],
        kt: json["kt"],
        mu: json["mu"],
        amz: json["amz"],
        cdj: json["cdj"],
        ebj: json["ebj"],
        mal: json["mal"],
        raw: json["raw"],
        engtl: json["engtl"],
      );

  Map<String, dynamic> toJson() => {
        "al": al,
        "ap": ap,
        "bw": bw,
        "kt": kt,
        "mu": mu,
        "amz": amz,
        "cdj": cdj,
        "ebj": ebj,
        "mal": mal,
        "raw": raw,
        "engtl": engtl,
      };
}

class MdCover {
  MdCover({
    required this.url,
    required this.w,
    required this.h,
    required this.gpurl,
    required this.b2Key,
  });

  String? url;
  int? w;
  int? h;
  String? gpurl;
  String? b2Key;

  factory MdCover.fromJson(Map<String, dynamic> json) => MdCover(
        url: json["url"],
        w: json["w"],
        h: json["h"],
        gpurl: json["gpurl"],
        b2Key: json["b2key"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "w": w,
        "h": h,
        "gpurl": gpurl,
        "b2key": b2Key,
      };
}

class MdImage {
  MdImage({
    required this.gpurl,
    required this.h,
    required this.w,
    required this.name,
    required this.s,
    required this.b2Key,
    required this.optimized,
  });

  dynamic gpurl;
  int? h;
  int? w;
  String? name;
  int? s;
  String? b2Key;
  dynamic optimized;

  factory MdImage.fromJson(Map<String, dynamic> json) => MdImage(
        gpurl: json["gpurl"],
        h: json["h"],
        w: json["w"],
        name: json["name"],
        s: json["s"],
        b2Key: json["b2key"],
        optimized: json["optimized"],
      );

  Map<String, dynamic> toJson() => {
        "gpurl": gpurl,
        "h": h,
        "w": w,
        "name": name,
        "s": s,
        "b2key": b2Key,
        "optimized": optimized,
      };
}

class ChapterLangList {
  ChapterLangList({
    required this.lang,
    required this.hid,
  });

  String lang;
  String hid;

  factory ChapterLangList.fromJson(Map<String, dynamic> json) =>
      ChapterLangList(
        lang: json["lang"],
        hid: json["hid"],
      );

  Map<String, dynamic> toJson() => {
        "lang": lang,
        "hid": hid,
      };
}

class Next {
  Next({
    required this.id,
    required this.hid,
    required this.vol,
    required this.title,
    required this.chap,
    required this.groupName,
    required this.lang,
    required this.mdGroupId,
    required this.mdChaptersGroups,
    required this.href,
  });

  int? id;
  String hid;
  dynamic vol;
  String? title;
  String? chap;
  dynamic groupName;
  String? lang;
  dynamic mdGroupId;
  List<dynamic> mdChaptersGroups;
  String? href;

  factory Next.fromJson(Map<String, dynamic> json) => Next(
        id: json["id"],
        hid: json["hid"],
        vol: json["vol"],
        title: json["title"] == null ? null : json["title"],
        chap: json["chap"],
        groupName: json["group_name"],
        lang: json["lang"],
        mdGroupId: json["md_group_id"],
        mdChaptersGroups:
            List<dynamic>.from(json["md_chapters_groups"].map((x) => x)),
        href: json["href"] == null ? null : json["href"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hid": hid,
        "vol": vol,
        "title": title == null ? null : title,
        "chap": chap,
        "group_name": groupName,
        "lang": lang,
        "md_group_id": mdGroupId,
        "md_chapters_groups":
            List<dynamic>.from(mdChaptersGroups.map((x) => x)),
        "href": href == null ? null : href,
      };
}

enum GroupName {
  ALPHASCANS,
  REAPERSCANS,
  REAPER_SCANS,
  KKJ_SCANS,
  OFFICIAL,
  WE_SCANS,
  WE_SCAN,
  FUK_SCANS
}

final groupNameValues = EnumValues({
  "alphascans": GroupName.ALPHASCANS,
  "Fuk Scans": GroupName.FUK_SCANS,
  "KKJ Scans": GroupName.KKJ_SCANS,
  "Official": GroupName.OFFICIAL,
  "reaperscans": GroupName.REAPERSCANS,
  "Reaper_Scans": GroupName.REAPER_SCANS,
  "WeScan": GroupName.WE_SCAN,
  "WeScans": GroupName.WE_SCANS
});

class Prev {
  Prev({
    required this.id,
    required this.hid,
    required this.vol,
    required this.title,
    required this.chap,
    required this.mdGroupId,
    required this.mdChaptersGroups,
    required this.href,
  });

  int? id;
  String? hid;
  String? vol;
  String? title;
  String? chap;
  int? mdGroupId;
  List<int> mdChaptersGroups;
  String? href;

  factory Prev.fromJson(Map<String, dynamic> json) => Prev(
        id: json["id"],
        hid: json["hid"],
        vol: json["vol"] == null ? null : json["vol"],
        title: json["title"] == null ? null : json["title"],
        chap: json["chap"],
        mdGroupId: json["md_group_id"] == null ? null : json["md_group_id"],
        mdChaptersGroups:
            List<int>.from(json["md_chapters_groups"].map((x) => x)),
        href: json["href"] == null ? null : json["href"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hid": hid,
        "vol": vol == null ? null : vol,
        "title": title == null ? null : title,
        "chap": chap,
        "md_group_id": mdGroupId == null ? null : mdGroupId,
        "md_chapters_groups":
            List<dynamic>.from(mdChaptersGroups.map((x) => x)),
        "href": href == null ? null : href,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
