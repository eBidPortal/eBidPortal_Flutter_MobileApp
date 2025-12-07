import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/app.dart';

Future<void> main() async {
  print('🚀 MAIN: Starting eBidPortal app initialization...');
  
  WidgetsFlutterBinding.ensureInitialized();
  print('🚀 MAIN: Flutter widgets binding initialized');
  
  // Initialize Firebase
  print('🔥 MAIN: Initializing Firebase...');
  await Firebase.initializeApp();
  print('🔥 MAIN: Firebase initialized successfully');
  
  print('📱 MAIN: Starting app with ProviderScope...');
  runApp(
    ProviderScope(
      child: App(),
    ),
  );
  print('📱 MAIN: App launched successfully');
}
