import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
          )
        ]));
  }
}
