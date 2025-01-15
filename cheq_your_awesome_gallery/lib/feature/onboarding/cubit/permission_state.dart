import 'package:equatable/equatable.dart';

abstract class PermissionState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialPermissionState extends PermissionState {}

class PermissionGrantedState extends PermissionState {}

class PermissionDeniedState extends PermissionState {}

class PermissionPermanentlyDeniedState extends PermissionState {}
