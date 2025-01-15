import 'package:cheq_your_awesome_gallery/core/di/service_locator.dart';
import 'package:cheq_your_awesome_gallery/feature/albums/albums_screen.dart';
import 'package:cheq_your_awesome_gallery/resources/asset_helper.dart';
import 'package:cheq_your_awesome_gallery/resources/colors.dart';
import 'package:cheq_your_awesome_gallery/resources/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cheq_your_awesome_gallery/feature/onboarding/cubit/permission_cubit.dart';
import 'package:cheq_your_awesome_gallery/feature/onboarding/cubit/permission_state.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  static const path = '/permissionScreen';

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const PermissionScreen(),
    );
  }

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  late PermissionCubit permissionCubit;

  @override
  void initState() {
    super.initState();
    permissionCubit = gi.get<PermissionCubit>();
    permissionCubit.requestPermission();
  }

  @override
  void dispose() {
    permissionCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<PermissionCubit, PermissionState>(
          listener: _onPermissionChanged,
          bloc: permissionCubit,
          builder: (context, state) {
            if(state is PermissionGrantedState) {
              return const SizedBox.shrink();
            }
            return permissionRequiredWidget();
          },
        ),
      ),
    );
  }

  Widget permissionRequiredWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCentralImage(),
        const SizedBox(height: 42),
        _buildTitle(),
        const SizedBox(height: 8),
        _buildDescription(),
        const SizedBox(height: 42),
        _buildButton(),
      ],
    );
  }

  void _onPermissionChanged(BuildContext context, PermissionState state) {
    if (state is PermissionGrantedState) {
      _navigateToAlbums();
    }
  }

  Widget _buildCentralImage() {
    return SvgPicture.asset(AssetHelper.permissionImage);
  }

  Text _buildTitle() {
    return Text(
      'Permission Required',
      style: AppTextStyles.permissionTitleStyle,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 53),
      child: Text(
        '''To show your black and white photos we just need your folder permission. We promise, we don’t take your photos.''',
        style: AppTextStyles.permissionDescriptionStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ElevatedButton(
        onPressed: () async {
          if (permissionCubit.state is PermissionGrantedState) {
            _navigateToAlbums();
          } else if (permissionCubit.state
              is PermissionPermanentlyDeniedState) {
            await openAppSettings();
          } else {
            permissionCubit.requestPermission();
          }
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(42),
          backgroundColor: AppColor.buttonFillColor,
        ),
        child: Text(
          'Grant Access',
          style: AppTextStyles.buttonTextStyle,
        ),
      ),
    );
  }

  void _navigateToAlbums() {
    Navigator.pushReplacement(
      context,
      AlbumsScreen.route(),
    );
  }

  Future<void> _checkPermissionStatus() async {
    final status = await Permission.storage.status;
    if (status.isGranted) {
      _navigateToAlbums();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkPermissionStatus();
  }
}
