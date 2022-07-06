import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:komik_flutter/models/lib_comic.dart';
import 'package:komik_flutter/models/top_comic.dart';

class ComicListItem extends StatelessWidget {
  const ComicListItem({Key? key, required this.comic}) : super(key: key);
  final LibComic comic;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 214,
      height: 311,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                      width: 1, color: Colors.grey, style: BorderStyle.solid)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9.0),
                child: SizedBox(
                  width: 214,
                  height: 311,
                  child: CachedNetworkImage(
                    fit: BoxFit.fitHeight,
                    maxHeightDiskCache: 300,
                    maxWidthDiskCache: 200,
                    imageUrl: (comic.mdComics.mdCovers[0].gpurl != null)
                        ? "${comic.mdComics.mdCovers[0].gpurl}.256.jpg"
                        : 'https://meo.comick.pictures/${comic.mdComics.mdCovers[0].b2Key}',
                    placeholder: (context, url) => CachedNetworkImage(
                      imageUrl:
                          'https://i0.wp.com/elkadii.ponpes.id/wp-content/uploads/2018/10/placeholder.jpg?ssl=1',
                      fit: BoxFit.fitHeight,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
          Text(
            '${comic.mdComics.title}\n',
            maxLines: 2,
            textAlign: TextAlign.left,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 13.4,
            ),
          )
        ],
      ),
    );
    // ListTile(
    //   leading: Text(comic.mdComics.title),
    // );
  }
}

class ComicListItem2 extends StatelessWidget {
  const ComicListItem2({Key? key, required this.comict}) : super(key: key);
  final Completion comict;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 214,
      height: 311,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                      width: 1, color: Colors.grey, style: BorderStyle.solid)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9.0),
                child: SizedBox(
                  width: 214,
                  height: 311,
                  child: CachedNetworkImage(
                    fit: BoxFit.fitHeight,
                    maxHeightDiskCache: 300,
                    maxWidthDiskCache: 200,
                    imageUrl: (comict.mdCovers.first.gpurl != null)
                        ? "${comict.mdCovers.first.gpurl}.256.jpg"
                        : 'https://meo.comick.pictures/${comict.mdCovers.first.b2Key}',
                    placeholder: (context, url) => CachedNetworkImage(
                      imageUrl:
                          'https://i0.wp.com/elkadii.ponpes.id/wp-content/uploads/2018/10/placeholder.jpg?ssl=1',
                      fit: BoxFit.fitHeight,
                      cacheManager: CacheManager(Config(
                        "meo.comick.pictures",
                        maxNrOfCacheObjects: 20,
                        stalePeriod: const Duration(days: 2),
                      )),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
          Text(
            '${comict.title}\n',
            maxLines: 2,
            textAlign: TextAlign.left,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 13.4,
            ),
          )
        ],
      ),
    );
    // ListTile(
    //   leading: Text(comic.mdComics.title),
    // );
  }
}
