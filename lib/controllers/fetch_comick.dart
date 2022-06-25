import 'package:http/http.dart' as http;
import 'package:komik_flutter/models/details_comic.dart';
import 'package:komik_flutter/models/lib_comic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final detailsComicProvider = StateProvider((ref) {
  return [];
});

class ComickApi {
  static Future<List<LibComic>> getListOfComic(int currentPage) async {
    final url = 'https://api.comick.fun/';
    List<LibComic> libComic = [];
    var response = await http
        .get(Uri.parse(url + 'chapter?lang=en&page=$currentPage&order=hot'));
    var jsonresult = libComicFromJson(response.body);
    // print(jsonresult[0].hid);
    // print('Fetch called');
    return jsonresult;
  }

  static Future<List<DetailsComic>> getComicDetails(String hid) async {
    final url = 'https://api.comick.fun/chapter/';
    List<DetailsComic> detailsComick = [];
    var response = await http.get(Uri.parse('url + $hid'));
    var jsonresult = detailsComicFromJson(response.body);
    detailsComick.add(jsonresult);
    print(jsonresult.chapter);
    // print('Fetch called');
    return detailsComick;
  }
}
