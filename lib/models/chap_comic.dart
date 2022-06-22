import 'package:http/http.dart' as http;
import 'package:komik_flutter/models/lib_comic.dart';

class ComickApi {
  static Future<List<LibComic>> getListOfComic(int currentPage) async {
    final url = 'https://api.comick.fun/';
    List<LibComic> libComic = [];
    var response = await http.get(Uri.parse(url + 'chapter?page=$currentPage'));
    var jsonresult = libComicFromJson(response.body);
    print(jsonresult[0].hid);
    print('Fetch called');
    return jsonresult;
  }
}
