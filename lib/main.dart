import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:komik_flutter/controllers/db_interface.dart';
import 'package:komik_flutter/screens/browse_screen.dart';
import 'package:komik_flutter/screens/history_screen.dart';
import 'package:komik_flutter/screens/library_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

late ObjectBox objectBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final dir = await getApplicationSupportDirectory();
  objectBox = await ObjectBox.create();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baca Komik on Flutter',
      themeMode: ThemeMode.dark,
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.brandBlue,
        useMaterial3: true,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarStyle: FlexAppBarStyle.background,
        appBarOpacity: 0.90,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 30,
        ),
      ),
      theme: FlexThemeData.light(
        scheme: FlexScheme.brandBlue,
        useMaterial3: true,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 20,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          blendOnColors: false,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
      ),
      home: const BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  late ScrollController scrollController;
  // final screen = [
  //   HomeScreen(),
  //   BrowseScreen(isar: widget.isar),
  //   HistoryScreen(),
  // ];
  @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  void updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getPage(int index, ScrollController scrollController) {
    switch (index) {
      case 0:
        return HomeScreen(scrollController: scrollController);
        break;
      case 1:
        return BrowseScreen(scrollController: scrollController);
        break;
      case 2:
        return HistoryScreen(scrollController: scrollController);
        break;
      default:
        return HomeScreen(scrollController: scrollController);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getPage(_selectedIndex, scrollController),
      bottomNavigationBar: HideBottomNavBar(
        scrollController: scrollController,
        child: NavigationBar(
          height: 75.0,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.collections_bookmark_outlined),
              selectedIcon: Icon(Icons.collections_bookmark),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore),
              label: 'Browse',
            ),
            NavigationDestination(
              icon: Icon(Icons.access_time_outlined),
              selectedIcon: Icon(Icons.access_time_filled),
              label: 'History',
            )
          ],
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          selectedIndex: _selectedIndex,
          onDestinationSelected: updateIndex,
        ),
      ),
    );
  }
}

class HideBottomNavBar extends StatefulWidget {
  const HideBottomNavBar(
      {Key? key,
      required this.child,
      required this.scrollController,
      this.duration = const Duration(milliseconds: 200)})
      : super(key: key);
  final Widget child;
  final ScrollController scrollController;
  final Duration duration;
  @override
  State<HideBottomNavBar> createState() => _HideBottomNavBarState();
}

class _HideBottomNavBarState extends State<HideBottomNavBar> {
  bool isVisible = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.scrollController.addListener(listen);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.scrollController.removeListener(listen);
    super.dispose();
  }

  listen() {
    final scrollDirection =
        widget.scrollController.position.userScrollDirection;
    if (scrollDirection == ScrollDirection.forward) {
      show();
    } else if (scrollDirection == ScrollDirection.reverse) {
      hide();
    }
  }

  show() {
    setState(() {
      if (isVisible != true) isVisible = true;
    });
  }

  hide() {
    setState(() {
      if (isVisible == true) isVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isVisible ? 75 : 0,
      duration: widget.duration,
      child: Wrap(children: [widget.child]),
    );
  }
}
