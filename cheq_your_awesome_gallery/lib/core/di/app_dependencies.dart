import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppDependencies {
  @singleton
  DataInterface registerDataInterface() {
    return DataInterfaceImpl();
  }

  @singleton
  FetchAlbumsUseCase fetchImageAlbums(
    DataInterface dataLayer,
  ) {
    return FetchAlbumsUseCase(dataLayer.createRepository());
  }
}
