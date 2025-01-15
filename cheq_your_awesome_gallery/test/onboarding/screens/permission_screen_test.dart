import 'package:bloc_test/bloc_test.dart';
import 'package:cheq_your_awesome_gallery/core/di/service_locator.dart';
import 'package:cheq_your_awesome_gallery/feature/albums/albums_screen.dart';
import 'package:cheq_your_awesome_gallery/feature/onboarding/screens/permission_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:cheq_your_awesome_gallery/feature/onboarding/cubit/permission_cubit.dart';
import 'package:cheq_your_awesome_gallery/feature/onboarding/cubit/permission_state.dart';

class MockPermissionCubit extends MockCubit<PermissionState>
    implements PermissionCubit {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  configureServiceLocator();
  setUpAll(() {
    registerFallbackValue(AlbumsScreen.route());
  });

  group('PermissionScreen Tests', () {
    late MockPermissionCubit mockPermissionCubit;
    late MockNavigatorObserver mockNavigatorObserver;

    setUp(() {
      mockPermissionCubit = MockPermissionCubit();
      mockNavigatorObserver = MockNavigatorObserver();
    });

    testWidgets(
        'should display permission required UI when permission is not granted',
        (WidgetTester tester) async {
      // Arrange
      when(() => mockPermissionCubit.state)
          .thenReturn(InitialPermissionState());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockPermissionCubit,
            child: const PermissionScreen(),
          ),
          navigatorObservers: [mockNavigatorObserver],
        ),
      );

      // Act
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Permission Required'), findsOneWidget);
      expect(
          find.text(
              'To show your black and white photos we just need your folder permission. We promise, we don’t take your photos.'),
          findsOneWidget);
      expect(find.text('Grant Access'), findsOneWidget);
    });

    testWidgets('should navigate to AlbumsScreen when permission is granted',
        (WidgetTester tester) async {
      // Arrange
      when(() => mockPermissionCubit.state)
          .thenReturn(PermissionGrantedState());
      final mockNavigatorObserver = MockNavigatorObserver();

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockPermissionCubit,
            child: const PermissionScreen(),
          ),
          navigatorObservers: [mockNavigatorObserver],
        ),
      );

      // Act
      await tester.pumpAndSettle();

      // Assert
      verify(() => mockNavigatorObserver.didPush(any(), any())).called(1);
    });
  });
}
