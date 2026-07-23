import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holistq/app.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase using the native platform configuration (google-services.json / GoogleService-Info.plist).
  // Note: lib/firebase_options.dart is not present in the repo. Initializing without options uses
  // the native config files you provided for Android (google-services.json). If you later run
  // the FlutterFire CLI and add lib/firebase_options.dart I can switch to DefaultFirebaseOptions.
  await Firebase.initializeApp();

  runApp(const ProviderScope(child: HolistQApp()));
}
