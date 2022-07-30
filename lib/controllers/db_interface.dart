import 'package:komik_flutter/models/entity/comic_entity.dart';
import 'package:komik_flutter/models/entity/chread_entity.dart';
import 'package:komik_flutter/models/entity/library_entity.dart';
import 'package:komik_flutter/models/entity/history_entity.dart';
import 'package:komik_flutter/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';

class ObjectBox {
  late final Store store;
  late final Box<ComicEntity> comicBox;
  late final Box<ChReadEntity> chReadBox;
  late final Box<HistoryEntity> historyBox;
  late final Box<LibraryEntity> libraryBox;

  ObjectBox._create(this.store) {
    comicBox = Box<ComicEntity>(store);
    chReadBox = Box<ChReadEntity>(store);
    historyBox = Box<HistoryEntity>(store);
    libraryBox = Box<LibraryEntity>(store);
  }

  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }

  addToLib(int id) {
    LibraryEntity addComicToLib = LibraryEntity(id: id);
    final comic = comicBox.get(id);
    addComicToLib.comic.target = comic;
    libraryBox.put(addComicToLib);
  }

  removeFromLib(int id) async {
    libraryBox.remove(id);
  }

  addComic(int id, String hid, String title, String slug, String chap,
      String cvUrl) async {
    ComicEntity addComic = ComicEntity(
        id: id, hid: hid, title: title, slug: slug, chap: chap, cvUrl: cvUrl);
    // addComic.historys.add(HistoryEntity(
    //     id: id, chapter_title: chapter_title, lastRead: lastRead));
    comicBox.put(addComic);
  }

  removeComic(int id) async {
    comicBox.remove(id);
  }

  addToHistory(int id, int comic_id, String hid, String comic_hid,
      String ch_title, String ch_num) {
    final getChRead = chReadBox.get(id);
    final getRecentHistory = historyBox.get(id);
    if (getChRead == null) {
      ChReadEntity addHistory = ChReadEntity(
          id: id,
          hid: hid,
          comic_id: comic_id,
          comic_hid: comic_hid,
          ch_num: ch_num,
          ch_title: ch_title,
          lastRead: DateTime.now());
      final comic = comicBox.get(comic_id);
      addHistory.comic.target = comic;
      chReadBox.put(addHistory);
    } else {
      getChRead.lastRead = DateTime.now();
      chReadBox.put(getChRead);
    }
    if (getRecentHistory == null) {
      HistoryEntity addRecentHistory = HistoryEntity(id: comic_id);
      addRecentHistory.history.target = chReadBox.get(id);
      historyBox.put(addRecentHistory);
    } else {
      final getRecent = historyBox.get(comic_id);
      getRecent!.history.target = chReadBox.get(id);
      historyBox.put(getRecent);
    }
  }

  deleteAllHistory() {
    historyBox.removeAll();
  }
}
