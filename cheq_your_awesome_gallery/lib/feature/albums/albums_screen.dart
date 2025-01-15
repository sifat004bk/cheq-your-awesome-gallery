import 'package:flutter/material.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  static const path = '/albumsScreen';

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const AlbumsScreen(),
    );
  }

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Text('Albums');
  }
}
