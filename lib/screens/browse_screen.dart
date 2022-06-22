import 'package:flutter/material.dart';
import 'package:komik_flutter/components/comic_item.dart';
import 'package:komik_flutter/models/chap_comic.dart';
import 'package:komik_flutter/models/lib_comic.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Browse'),
            floating: true,
          ),
          ComicGrid(),
          SliverToBoxAdapter(
            child:
                ElevatedButton(onPressed: () {}, child: const Text('Test Api')),
          )
        ],
      ),
    );
  }
}

class ComicGrid extends StatefulWidget {
  const ComicGrid({
    Key? key,
  }) : super(key: key);

  @override
  State<ComicGrid> createState() => _ComicGridState();
}

class _ComicGridState extends State<ComicGrid> {
  // List<LibComic> libComic = [];
  static const _pageSize = 40;

  final _pagingController = PagingController<int, LibComic>(
    firstPageKey: 1,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ComickApi.getListOfComic(pageKey);
      print(newItems.length);
      final isLastPage = pageKey > _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      print('error');
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: PagedGridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<LibComic>(
            animateTransitions: true,
            itemBuilder: (context, item, index) => ComicListItem(
              comic: item,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
