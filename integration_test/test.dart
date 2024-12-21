import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:journey_pro/flutter_flow/flutter_flow_drop_down.dart';
import 'package:journey_pro/flutter_flow/flutter_flow_icon_button.dart';
import 'package:journey_pro/flutter_flow/flutter_flow_widgets.dart';
import 'package:journey_pro/flutter_flow/flutter_flow_theme.dart';
import 'package:journey_pro/index.dart';
import 'package:journey_pro/main.dart';
import 'package:journey_pro/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:journey_pro/backend/firebase/firebase_config.dart';
import 'package:journey_pro/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  testWidgets('Golden Path-SignupLogin', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(),
    ));

    await tester.enterText(
        find.byKey(ValueKey('loginEmail_w7y6')), 'mwentworth14@uri.edu');
    await tester.enterText(
        find.byKey(ValueKey('loginPass_jm9g')), 'PleaseWork123');
    await tester.pumpAndSettle();
    // I set this to be if the UI sees the "Add New Trip" button
    expect(find.byKey(ValueKey('Button_eg3u')), findsWidgets);
  });

  testWidgets('Account Creation', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(),
    ));

    await tester.enterText(
        find.byKey(ValueKey('sign-upEmail_dm1t')), 'NotAEmail');
    await tester.enterText(
        find.byKey(ValueKey('SignupPass_a8py')), 'Testing12345');
    await tester.enterText(
        find.byKey(ValueKey('ConfirmPass_sz44')), 'Testing12345');
    await tester.tap(find.byKey(ValueKey('SignUpButton_mojk')));
    expect(find.text('Error'), findsWidgets);
  });

  testWidgets('Trip Team Map Test', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: 'k@gmail.com', password: 'kkkkkk');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: HomeWidget(),
      ),
    ));

    await tester.tap(find.byKey(ValueKey('Button_eg3u')));
    await tester.enterText(
        find.byKey(ValueKey('Addemail_wm6l')), 'c@gmail.com');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.tap(find.byKey(ValueKey('Button_tqdf')));
    await tester.tap(find.byKey(ValueKey('Button_m9fg')));
    await tester.tap(find.byKey(ValueKey('Trips_d0rd')));
    await tester.tap(find.byKey(ValueKey('Button_7tpf')));
    expect(find.byKey(ValueKey('GoogleMap_961i')), findsWidgets);
  });

  testWidgets('Golden Path', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'mithilesh@gmail.com', password: 'Hello123');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(),
    ));

    await tester.tap(find.byKey(ValueKey('Trips_d0rd')));
  });

  testWidgets('UserStory 10 Currency Converter', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'darren.medeiros@uri.edu', password: 'password');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: HomeWidget(),
      ),
    ));

    await tester.tap(find.descendant(
      of: find.byKey(ValueKey('BottomBar_fgtw')),
      matching: find.byKey(ValueKey('IconButton_95iy')),
    ));
    await tester.tap(find.byKey(ValueKey('CurConvFromText_40w8')));
    await tester.enterText(
        find.byKey(ValueKey('CurConvInputText_khin')), '100');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.tap(find.byKey(ValueKey('CurConvToText_kl9w')));
    await tester.pump(kDoubleTapMinTime);
    await tester.tap(find.byKey(ValueKey('CurConvToText_kl9w')));
    await tester.tap(find.byKey(ValueKey('Button_32fp')));
  });

  testWidgets('Adding Activities', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'test@gmail.com', password: 'test1234');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: HomeWidget(),
      ),
    ));

    await tester.tap(find.byKey(ValueKey('Button_eg3u')));
    await tester.tap(find.byKey(ValueKey('Button_m9fg')));
    await tester.tap(find.byKey(ValueKey('Button_o7iu')));
    await tester.tap(find.byKey(ValueKey('PlacePicker_sdc5')));
    await tester.tap(find.byKey(ValueKey('Button_mbmm')));
    expect(find.byKey(ValueKey('GoogleMap_961i')), findsWidgets);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
