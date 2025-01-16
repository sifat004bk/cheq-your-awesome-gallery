import 'package:cheq_your_awesome_gallery/feature/albums/cubit/albums_cubit.dart';
import 'package:cheq_your_awesome_gallery/feature/albums/cubit/albums_fetch_state.dart';
import 'package:cheq_your_awesome_gallery/feature/albums/widgets/album_grid.dart';
import 'package:cheq_your_awesome_gallery/resources/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/service_locator.dart';

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

  late AlbumsCubit albumsCubit;

  @override
  void initState() {
    super.initState();
    albumsCubit = gi.get<AlbumsCubit>();
    albumsCubit.fetchAlbums();
  }

  @override
  void dispose() {
    albumsCubit.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<AlbumsCubit, AlbumsFetchState>(
          bloc: albumsCubit,
          builder: (context, state) {
            if(state is AlbumsFetchSuccessState) {
              return  Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Albums', style: AppTextStyles.albumsHeaderStyle),
                    const SizedBox(height: 8),
                    Expanded(child: AlbumGrid(albums: state.albums)),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
