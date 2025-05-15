import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:install_time_plugin/install_time_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String installTime = 'Unknown'; // 用於顯示的字串

  @override
  void initState() {
    super.initState();
    _loadInstallTime();
  }

  Future<void> _loadInstallTime() async {
    try {
      final int? rawInstallTime = await InstallTimePlugin.getFirstInstallTime();

      if (!mounted) return;

      setState(() {
        installTime =
            (rawInstallTime != null)
                ? DateTime.fromMillisecondsSinceEpoch(rawInstallTime).toString()
                : 'Failed to get install time.';
      });
    } on PlatformException {
      if (!mounted) return;
      setState(() {
        installTime = 'Failed to get install time.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(child: Text('Installed on: $installTime\n')),
      ),
    );
  }
}
