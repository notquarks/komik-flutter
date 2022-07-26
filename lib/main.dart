import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:komik_flutter/collections/comic_col.dart';
import 'package:komik_flutter/collections/history_col.dart';
import 'package:komik_flutter/screens/browse_screen.dart';
import 'package:komik_flutter/screens/history_screen.dart';
import 'package:komik_flutter/screens/library_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationSupportDirectory();
  final isar = await Isar.open(
    inspector: true,
    schemas: [ComicColSchema, HistorySchema],
    directory: dir.path,
  );
  runApp(
    ProviderScope(child: MyApp(isar: isar)),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.isar}) : super(key: key);
  final Isar isar;
  // This widget is the root of your application.
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
      home: BottomNavBar(isar: isar),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, required this.isar}) : super(key: key);
  final Isar isar;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  // final screen = [
  //   HomeScreen(),
  //   BrowseScreen(isar: widget.isar),
  //   HistoryScreen(),
  // ];

  void updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return HomeScreen(
          isar: widget.isar,
        );
        break;
      case 1:
        return BrowseScreen(isar: widget.isar);
        break;
      case 2:
        return HistoryScreen(
          isar: widget.isar,
        );
        break;
      default:
        return HomeScreen(
          isar: widget.isar,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getPage(_selectedIndex),
      bottomNavigationBar: NavigationBar(
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
    );
  }
}
