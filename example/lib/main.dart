import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_automatic_time/flutter_automatic_time.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _flutterAutomaticTimePlugin = FlutterAutomaticTime();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String isAutomaticTime;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
     var  value =
          await _flutterAutomaticTimePlugin.isAutomaticTime();

     if (value == null) {
       isAutomaticTime = 'Failed to get automatic time.';
     } else {
       isAutomaticTime = value.toString();
     }

    } on PlatformException {
      isAutomaticTime = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = isAutomaticTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
