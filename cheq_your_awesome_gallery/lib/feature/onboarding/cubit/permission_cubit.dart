import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cheq_your_awesome_gallery/feature/onboarding/cubit/permission_state.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

@injectable
class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit() : super(InitialPermissionState());

  Future<void> requestPermission() async {
    PermissionStatus status;

    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        status = await Permission.photos.request();
      } else {
        status = await Permission.storage.request();
      }
    } else {
      status = await Permission.storage.request();
    }

    if (status.isGranted) {
      emit(PermissionGrantedState());
    } else if (status.isDenied) {
      emit(PermissionDeniedState());
    } else if (status.isPermanentlyDenied) {
      emit(PermissionPermanentlyDeniedState());
    }
  }
}
