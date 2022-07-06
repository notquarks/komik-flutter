import 'package:komik_flutter/models/descslug_comic.dart';
import 'package:komik_flutter/models/save_comic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPrefService {
  Future addComic(SavedComic comic) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('slug', comic.slug);
    await preferences.setString('title', comic.title);
    await preferences.setString('artist', comic.artist);
    await preferences.setString('author', comic.author);
    await preferences.setString('desc', comic.desc);
    await preferences.setInt('id', comic.id);
    await preferences.setInt('hid', comic.id);
    await preferences.setString('gpurl', comic.gpurl ?? '');
    await preferences.setString('b2key', comic.b2key ?? '');
    print('Saved');
  }

  Future getComic() async {
    final preferences = await SharedPreferences.getInstance();
    final slug = preferences.getString('slug');
    final title = preferences.getString('title');
    final artist = preferences.getString('artist');
    final author = preferences.getString('author');
    final desc = preferences.getString('desc');
    final id = preferences.getInt('id');
    final hid = preferences.getInt('hid');
    final gpurl = preferences.getString('gpurl');
    final b2key = preferences.getString('b2key');
  }
}
