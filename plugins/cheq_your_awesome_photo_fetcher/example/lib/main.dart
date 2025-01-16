import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:cheq_your_awesome_photo_fetcher/cheq_your_awesome_photo_fetcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _status = 'No albums fetched yet';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String status;
    try {
      final albums = await CheqYourAwesomePhotoFetcher().getPhotosByAlbum();
      if (albums.isEmpty) {
        status = 'No albums found';
      } else {
        status = 'Fetched ${albums.length} albums';
      }
    } on PlatformException catch (e) {
      status = 'Failed to fetch albums: ${e.message}';
    }

    if (!mounted) return;

    setState(() {
      _status = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin Example App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Status: $_status\n'),
            ],
          ),
        ),
      ),
    );
  }
}
