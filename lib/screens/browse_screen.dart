import 'package:flutter/material.dart';
import 'package:komik_flutter/components/comic_item.dart';
import 'package:komik_flutter/controllers/fetch_comick.dart';
import 'package:komik_flutter/models/lib_comic.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:komik_flutter/models/top_comic.dart';
import 'package:komik_flutter/screens/comic2_screen.dart';
import 'package:komik_flutter/screens/comic_screen.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text('Browse'),
                floating: true,
                pinned: true,
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.sort))
                ],
                bottom: const TabBar(tabs: [
                  Tab(child: Text('Popular')),
                  Tab(child: Text('New')),
                ]),
              ),
            ];
          },
          body: TabBarView(children: [
            TopScreen(),
            const PopularScreen(),
          ]),
        ),
      ),
    );
  }
}

class TopScreen extends StatefulWidget {
  TopScreen({Key? key}) : super(key: key);

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  static const _pageSize = 2;

  final _pagingController = PagingController<int, Completion>(
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
      final newItems = await ComickApi.getTopComic(pageKey);
      print("length: ${newItems.length}");
      final isLastPage = pageKey >= _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
        print(nextPageKey);
      }
    } catch (error) {
      print(error.toString());
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: CustomScrollView(
          slivers: [
            // SliverAppBar(
            //   title: Text('Browse'),
            //   floating: true,
            //   snap: true,
            //   pinned: false,
            //   actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sort))],
            // ),
            SliverSafeArea(
              bottom: false,
              minimum: const EdgeInsets.symmetric(horizontal: 8),
              sliver: PagedSliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: (2.4 / 4.4),
                ),
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<Completion>(
                  animateTransitions: true,
                  itemBuilder: (context, item, index) => InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (childContext) {
                        return ComicPage2(comic: item, slug: item.slug);
                      }));
                    },
                    child: ComicListItem2(
                      comict: item,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopularScreen extends StatefulWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
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
    // final newItems = await ComickApi.getListOfComic(pageKey);
    try {
      final newItems = await ComickApi.getListOfComic(pageKey);
      print(newItems.length);
      final isLastPage = pageKey > _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
        print(nextPageKey);
      }
    } catch (error) {
      print('error');
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: CustomScrollView(
          slivers: [
            // SliverAppBar(
            //   title: Text('Browse'),
            //   floating: true,
            //   snap: true,
            //   pinned: false,
            //   actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sort))],
            // ),
            SliverSafeArea(
              bottom: false,
              minimum: const EdgeInsets.symmetric(horizontal: 8),
              sliver: PagedSliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: (2.4 / 4.4),
                ),
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<LibComic>(
                  animateTransitions: true,
                  itemBuilder: (context, item, index) => InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (childContext) {
                        return ComicPage(comic: item, hid: item.hid);
                      }));
                    },
                    child: ComicListItem(
                      comic: item,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
      // print(newItems.length);
      final isLastPage = pageKey > _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      // print('error');
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
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
            crossAxisCount: 4,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: (2.4 / 4.4),
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
}
