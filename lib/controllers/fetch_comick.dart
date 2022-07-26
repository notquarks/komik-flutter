import 'package:http/http.dart' as http;
import 'package:komik_flutter/models/descslug_comic.dart';
import 'package:komik_flutter/models/details_comic.dart';
import 'package:komik_flutter/models/lchap_comic.dart';
import 'package:komik_flutter/models/lib_comic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:komik_flutter/models/top_comic.dart';

final detailsComicProvider = StateProvider((ref) {
  return [];
});

class ComickApi {
  static Future<List<LibComic>> getListOfComic(int currentPage) async {
    const url = 'https://api.comick.fun/';
    var response = await http
        .get(Uri.parse(url + 'chapter?lang=en&page=$currentPage&order=hot'));
    var jsonresult = libComicFromJson(response.body);
    return jsonresult;
  }

  static Future<List<LibComic>> getListOfComicNew(int currentPage) async {
    const url = 'https://api.comick.fun/';
    // List<LibComic> libComic = [];
    var response = await http
        .get(Uri.parse(url + 'chapter?lang=en&page=$currentPage&order=new'));
    var jsonresult = libComicFromJson(response.body);
    // print(jsonresult[0].hid);
    // print('Fetch called');
    return jsonresult;
  }

  static Future<List<Completion>> getTopComic(int page) async {
    const url = 'https://api.comick.fun/top';
    List<TopComic> topComic = [];
    var response = await http.get(Uri.parse(url));
    var jsonresult = topComicFromJson(response.body);
    topComic.add(jsonresult);
    print('top: ${jsonresult.rank.length}');
    // print('Fetch called');
    return topComic.first.rank;
  }

  static Future<List<DetailsComic>> getComicDetails(String hid) async {
    const url = 'https://api.comick.fun/chapter/';
    List<DetailsComic> detailsComick = [];
    var response = await http.get(Uri.parse(url + '$hid'));
    var jsonresult = detailsComicFromJson(response.body);
    detailsComick.add(jsonresult);
    // print(jsonresult.chapter);
    // print('Fetch called');
    return detailsComick;
  }

  static Future<List<ListChapters>> getListChapters(int id) async {
    const url = 'https://api.comick.fun/comic/';
    List<ListChapters> listChapters = [];
    var response = await http.get(Uri.parse(url + '$id/chapter?lang=en'));
    var jsonresult = listChaptersFromJson(response.body);
    listChapters.add(jsonresult);
    print(jsonresult.chapters.length);
    // print('Fetch called');
    return listChapters;
  }

  static Future<List<ComicDescSlug>> getComicDescSlug(String slug) async {
    const url = 'https://api.comick.fun/comic/';
    List<ComicDescSlug> descComic = [];
    var response = await http.get(Uri.parse(url + '$slug'));
    var jsonresult = comicDescSlugFromJson(response.body);
    descComic.add(jsonresult);
    print(jsonresult);
    // print('Fetch called');
    return descComic;
  }
}

//apiProvider
// final apiComickProvider = Provider<ComickApi>((ref) => ComickApi());

// final comicInfoProvider =
//     FutureProvider.family<List<DetailsComic>, String>((ref, hid) async {
//   return ref.read(apiComickProvider).getComicDetails(hid);
// });
