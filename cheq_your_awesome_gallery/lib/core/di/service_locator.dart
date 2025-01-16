import 'package:cheq_your_awesome_gallery/core/di/service_locator.config.dart';
import 'package:cheq_your_awesome_gallery/resources/colors.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..indicatorColor = AppColor.white
    ..loadingStyle = EasyLoadingStyle.custom
    ..maskType = EasyLoadingMaskType.clear
    ..backgroundColor = AppColor.imageLayerColor
    ..progressColor = AppColor.white
    ..textColor = AppColor.white;
  dl.DataInterfaceImpl().init();
  gi.init();
}

