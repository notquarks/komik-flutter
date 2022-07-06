// To parse this JSON data, do
//
//     final comicDescSlug = comicDescSlugFromJson(jsonString);

import 'dart:convert';

ComicDescSlug comicDescSlugFromJson(String str) =>
    ComicDescSlug.fromJson(json.decode(str));

String comicDescSlugToJson(ComicDescSlug data) => json.encode(data.toJson());

class ComicDescSlug {
  ComicDescSlug({
    required this.comic,
    required this.artists,
    required this.authors,
    required this.langList,
    required this.demographic,
    required this.englishLink,
    required this.genres,
    required this.matureContent,
  });

  Comic comic;
  List<Artist> artists;
  List<Artist> authors;
  List<String> langList;
  String? demographic;
  dynamic englishLink;
  List<Artist> genres;
  bool matureContent;

  factory ComicDescSlug.fromJson(Map<String, dynamic> json) => ComicDescSlug(
        comic: Comic.fromJson(json["comic"]),
        artists:
            List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        authors:
            List<Artist>.from(json["authors"].map((x) => Artist.fromJson(x))),
        langList: List<String>.from(json["langList"].map((x) => x)),
        demographic: json["demographic"],
        englishLink: json["englishLink"],
        genres:
            List<Artist>.from(json["genres"].map((x) => Artist.fromJson(x))),
        matureContent: json["matureContent"],
      );

  Map<String, dynamic> toJson() => {
        "comic": comic.toJson(),
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
        "langList": List<dynamic>.from(langList.map((x) => x)),
        "demographic": demographic,
        "englishLink": englishLink,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "matureContent": matureContent,
      };
}

class Artist {
  Artist({
    required this.name,
    required this.slug,
  });

  String name;
  String slug;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
      };
}

class Comic {
  Comic({
    required this.id,
    required this.title,
    required this.country,
    required this.status,
    required this.links,
    required this.lastChapter,
    required this.demographic,
    required this.mdid,
    required this.hentai,
    required this.verificationStatus,
    required this.userFollowCount,
    required this.followRank,
    required this.commentCount,
    required this.followCount,
    required this.desc,
    required this.parsed,
    required this.slug,
    required this.year,
    required this.bayesianRating,
    required this.ratingCount,
    required this.contentRating,
    required this.relateFrom,
    required this.mies,
    required this.mdTitles,
    required this.mdComicMdGenres,
    required this.mdCovers,
    required this.muComics,
    required this.iso6391,
    required this.langName,
    required this.langNative,
  });

  int id;
  String title;
  String country;
  int? status;
  Links links;
  String? lastChapter;
  int? demographic;
  int? mdid;
  bool hentai;
  int? verificationStatus;
  int? userFollowCount;
  int? followRank;
  int? commentCount;
  int? followCount;
  String desc;
  String parsed;
  String slug;
  int? year;
  String? bayesianRating;
  int? ratingCount;
  String contentRating;
  List<dynamic> relateFrom;
  dynamic mies;
  List<MdTitle> mdTitles;
  List<MdComicMdGenre> mdComicMdGenres;
  List<MdCover> mdCovers;
  dynamic muComics;
  String iso6391;
  dynamic langName;
  dynamic langNative;

  factory Comic.fromJson(Map<String, dynamic> json) => Comic(
        id: json["id"],
        title: json["title"],
        country: json["country"],
        status: json["status"],
        links: Links.fromJson(json["links"]),
        lastChapter: json["last_chapter"].toString(),
        demographic: json["demographic"],
        mdid: json["mdid"],
        hentai: json["hentai"],
        verificationStatus: json["verification_status"],
        userFollowCount: json["user_follow_count"],
        followRank: json["follow_rank"],
        commentCount: json["comment_count"],
        followCount: json["follow_count"],
        desc: json["desc"],
        parsed: json["parsed"],
        slug: json["slug"],
        year: json["year"],
        bayesianRating: json["bayesian_rating"],
        ratingCount: json["rating_count"],
        contentRating: json["content_rating"],
        relateFrom: List<dynamic>.from(json["relate_from"].map((x) => x)),
        mies: json["mies"],
        mdTitles: List<MdTitle>.from(
            json["md_titles"].map((x) => MdTitle.fromJson(x))),
        mdComicMdGenres: List<MdComicMdGenre>.from(
            json["md_comic_md_genres"].map((x) => MdComicMdGenre.fromJson(x))),
        mdCovers: List<MdCover>.from(
            json["md_covers"].map((x) => MdCover.fromJson(x))),
        muComics: json["mu_comics"],
        iso6391: json["iso639_1"],
        langName: json["lang_name"],
        langNative: json["lang_native"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "country": country,
        "status": status,
        "links": links.toJson(),
        "last_chapter": lastChapter,
        "demographic": demographic,
        "mdid": mdid,
        "hentai": hentai,
        "verification_status": verificationStatus,
        "user_follow_count": userFollowCount,
        "follow_rank": followRank,
        "comment_count": commentCount,
        "follow_count": followCount,
        "desc": desc,
        "parsed": parsed,
        "slug": slug,
        "year": year,
        "bayesian_rating": bayesianRating,
        "rating_count": ratingCount,
        "content_rating": contentRating,
        "relate_from": List<dynamic>.from(relateFrom.map((x) => x)),
        "mies": mies,
        "md_titles": List<dynamic>.from(mdTitles.map((x) => x.toJson())),
        "md_comic_md_genres":
            List<dynamic>.from(mdComicMdGenres.map((x) => x.toJson())),
        "md_covers": List<dynamic>.from(mdCovers.map((x) => x.toJson())),
        "mu_comics": muComics,
        "iso639_1": iso6391,
        "lang_name": langName,
        "lang_native": langNative,
      };
}

class Links {
  Links({
    required this.al,
    required this.ap,
    required this.kt,
    required this.mu,
    required this.nu,
    required this.raw,
    required this.engtl,
  });

  String? al;
  String? ap;
  String? kt;
  String? mu;
  String? nu;
  String? raw;
  String? engtl;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        al: json["al"],
        ap: json["ap"],
        kt: json["kt"],
        mu: json["mu"],
        nu: json["nu"],
        raw: json["raw"],
        engtl: json["engtl"],
      );

  Map<String, dynamic> toJson() => {
        "al": al,
        "ap": ap,
        "kt": kt,
        "mu": mu,
        "nu": nu,
        "raw": raw,
        "engtl": engtl,
      };
}

class MdComicMdGenre {
  MdComicMdGenre({
    required this.mdGenres,
  });

  MdGenres mdGenres;

  factory MdComicMdGenre.fromJson(Map<String, dynamic> json) => MdComicMdGenre(
        mdGenres: MdGenres.fromJson(json["md_genres"]),
      );

  Map<String, dynamic> toJson() => {
        "md_genres": mdGenres.toJson(),
      };
}

class MdGenres {
  MdGenres({
    required this.name,
    required this.type,
    required this.slug,
    required this.group,
  });

  String name;
  String? type;
  String slug;
  dynamic group;

  factory MdGenres.fromJson(Map<String, dynamic> json) => MdGenres(
        name: json["name"],
        type: json["type"] == null ? null : json["type"],
        slug: json["slug"],
        group: json["group"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type == null ? null : type,
        "slug": slug,
        "group": groupValues.reverse[group],
      };
}

enum Group { GENRE, THEME, FORMAT }

final groupValues = EnumValues(
    {"Format": Group.FORMAT, "Genre": Group.GENRE, "Theme": Group.THEME});

class MdCover {
  MdCover({
    required this.id,
    required this.w,
    required this.h,
    required this.s,
    required this.gpurl,
    required this.mdComicId,
    required this.url,
    required this.vol,
    required this.mdid,
    required this.b2Key,
    required this.volNum,
  });

  int? id;
  int? w;
  int? h;
  int? s;
  String? gpurl;
  int? mdComicId;
  String? url;
  dynamic vol;
  dynamic mdid;
  String? b2Key;
  dynamic volNum;

  factory MdCover.fromJson(Map<String, dynamic> json) => MdCover(
        id: json["id"],
        w: json["w"],
        h: json["h"],
        s: json["s"],
        gpurl: json["gpurl"],
        mdComicId: json["md_comic_id"],
        url: json["url"],
        vol: json["vol"],
        mdid: json["mdid"],
        b2Key: json["b2key"],
        volNum: json["vol_num"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "w": w,
        "h": h,
        "s": s,
        "gpurl": gpurl,
        "md_comic_id": mdComicId,
        "url": url,
        "vol": vol,
        "mdid": mdid,
        "b2key": b2Key,
        "vol_num": volNum,
      };
}

class MdTitle {
  MdTitle({
    required this.title,
  });

  String title;

  factory MdTitle.fromJson(Map<String, dynamic> json) => MdTitle(
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
      };
}

class MuComics {
  MuComics({
    required this.licensedInEnglish,
    required this.completelyScanlated,
    required this.muComicCategories,
  });

  bool licensedInEnglish;
  bool completelyScanlated;
  List<MuComicCategory> muComicCategories;

  factory MuComics.fromJson(Map<String, dynamic> json) => MuComics(
        licensedInEnglish: json["licensed_in_english"],
        completelyScanlated: json["completely_scanlated"],
        muComicCategories: List<MuComicCategory>.from(
            json["mu_comic_categories"]
                .map((x) => MuComicCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "licensed_in_english": licensedInEnglish,
        "completely_scanlated": completelyScanlated,
        "mu_comic_categories":
            List<dynamic>.from(muComicCategories.map((x) => x.toJson())),
      };
}

class MuComicCategory {
  MuComicCategory({
    required this.muCategories,
    required this.positiveVote,
    required this.negativeVote,
  });

  MuCategories muCategories;
  int positiveVote;
  int negativeVote;

  factory MuComicCategory.fromJson(Map<String, dynamic> json) =>
      MuComicCategory(
        muCategories: MuCategories.fromJson(json["mu_categories"]),
        positiveVote: json["positive_vote"],
        negativeVote: json["negative_vote"],
      );

  Map<String, dynamic> toJson() => {
        "mu_categories": muCategories.toJson(),
        "positive_vote": positiveVote,
        "negative_vote": negativeVote,
      };
}

class MuCategories {
  MuCategories({
    required this.title,
    required this.slug,
  });

  String title;
  String slug;

  factory MuCategories.fromJson(Map<String, dynamic> json) => MuCategories(
        title: json["title"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "slug": slug,
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
