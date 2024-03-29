import 'package:flutter/material.dart';
import 'package:komik_flutter/components/comic_item.dart';
import 'package:komik_flutter/controllers/fetch_comick.dart';
import 'package:komik_flutter/models/lib_comic.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:komik_flutter/models/top_comic.dart';
import 'package:komik_flutter/screens/comic2_screen.dart';
import 'package:komik_flutter/screens/comic_screen.dart';
import 'package:komik_flutter/screens/settings_screen.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({Key? key, required this.scrollController})
      : super(key: key);
  final ScrollController scrollController;

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: widget.scrollController,
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: const Text('Browse'),
              floating: true,
              pinned: false,
              snap: true,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return SettingPage();
                      }));
                    },
                    icon: const Icon(Icons.settings))
              ],
              bottom: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabs: const [
                    Tab(child: Text('Popular')),
                    Tab(child: Text('New')),
                  ]),
            ),
          ];
        },
        body: TabBarView(controller: _tabController, children: [
          TopScreen(),
          NewScreen(),
        ]),
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

  late final _pagingController = PagingController<int, Completion>(
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
    if (mounted) {
      try {
        final newItems = await ComickApi.getTopComic(pageKey);
        final isLastPage = pageKey >= _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(newItems, nextPageKey);
          // print(nextPageKey);
        }
      } catch (error) {
        print(error.toString());
        _pagingController.error = error;
      }
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
                        return ComicPage2(
                            comic: item,
                            slug: item.slug,
                            cvUrl: (item.mdCovers[0].gpurl != null)
                                ? "${item.mdCovers[0].gpurl}.256.jpg"
                                : 'https://meo.comick.pictures/${item.mdCovers[0].b2Key}');
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

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  static const _pageSize = 40;

  late final _pagingController = PagingController<int, LibComic>(
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
    final newItems = await ComickApi.getListOfComic(pageKey);
    if (mounted) {
      try {
        final newItems = await ComickApi.getListOfComic(pageKey);
        // print(newItems.length);
        final isLastPage = pageKey > _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(newItems, nextPageKey);
          // print(nextPageKey);
        }
      } catch (error) {
        print('error : ${error.toString()}');
        _pagingController.error = error;
      }
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
                        return ComicPage(
                          id: item.mdComics.id,
                          title: item.mdComics.title,
                          hid: item.hid,
                          slug: item.mdComics.slug,
                          chap: item.chap ?? '',
                          cvUrl: (item.mdComics.mdCovers[0].gpurl != null)
                              ? "${item.mdComics.mdCovers[0].gpurl}.256.jpg"
                              : 'https://meo.comick.pictures/${item.mdComics.mdCovers[0].b2Key}',
                        );
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
    if (mounted) {
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
