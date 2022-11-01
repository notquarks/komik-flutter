import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:komik_flutter/controllers/db_interface.dart';
import 'package:komik_flutter/providers/settings.dart';
import 'package:komik_flutter/screens/browse_screen.dart';
import 'package:komik_flutter/screens/history_screen.dart';
import 'package:komik_flutter/screens/library_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

late ObjectBox objectBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  objectBox = await ObjectBox.create();
  runApp(
    ProviderScope(overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
    ], child: const MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Baca Komik on Flutter',
      themeMode: ref.watch(darkModeProvider).getDarkMode()
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: FlexThemeData.light(
        scheme: FlexScheme.purpleBrown,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 20,
        appBarOpacity: 0.95,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          blendOnColors: false,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        fontFamily: GoogleFonts.robotoFlex().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.purpleBrown,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 15,
        appBarStyle: FlexAppBarStyle.background,
        appBarOpacity: 0.95,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 30,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        fontFamily: GoogleFonts.robotoFlex().fontFamily,
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
  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
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
      case 1:
        return BrowseScreen(scrollController: scrollController);
      case 2:
        return HistoryScreen(scrollController: scrollController);
      default:
        return HomeScreen(scrollController: scrollController);
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
              label: 'Library',
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
    super.initState();
    widget.scrollController.addListener(listen);
  }

  @override
  void dispose() {
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
