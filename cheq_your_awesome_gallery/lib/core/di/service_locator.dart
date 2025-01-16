import 'package:cheq_your_awesome_gallery/core/di/service_locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:data/data.dart' as dl;

GetIt gi = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureServiceLocator() {
  dl.DataInterfaceImpl().init();
  gi.init();
}

