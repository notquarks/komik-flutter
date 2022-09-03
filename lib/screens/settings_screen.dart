import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:komik_flutter/providers/settings.dart';

class SettingPage extends ConsumerStatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends ConsumerState<SettingPage> {
  DefaultCacheManager manager = new DefaultCacheManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: ListView(children: [
          ListTile(
            title: const Text('Clear Cache'),
            onTap: () {
              try {
                manager.emptyCache().then(
                    (value) => Fluttertoast.showToast(msg: 'Cache Cleared'));
              } catch (e) {
                print(e.toString());
              }
            },
          ),
          SwitchListTile(
            value: ref.watch(darkModeProvider).getDarkMode(),
            title: const Text('Dark Mode'),
            onChanged: (val) {
              ref.read(darkModeProvider).setDarkMode(val);
            },
          )
        ]));
  }
}
