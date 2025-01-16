// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/data.dart' as _i437;
import 'package:domain/domain.dart' as _i494;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/onboarding/cubit/permission_cubit.dart' as _i579;
import 'app_dependencies.dart' as _i469;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appDependencies = _$AppDependencies();
    gh.factory<_i579.PermissionCubit>(() => _i579.PermissionCubit());
    gh.singleton<_i437.DataInterface>(
        () => appDependencies.registerDataInterface());
    gh.singleton<_i494.FetchAlbumsUseCase>(
        () => appDependencies.fetchImageAlbums(gh<_i437.DataInterface>()));
    return this;
  }
}

class _$AppDependencies extends _i469.AppDependencies {}
