import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';
import 'router/app_router.dart';
import '../core/theme/app_theme.dart';

class App extends ConsumerWidget {
  App({super.key}) {
    print('📱 APP: App widget constructor called');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('📱 APP: Building main app widget...');
    
    final router = ref.watch(routerProvider);
    print('📱 APP: Router provider initialized: ${router != null ? "✅ Success" : "❌ Failed"}');

    print('📱 APP: Creating MaterialApp.router with theme and router config...');
    return ToastificationWrapper(
      child: MaterialApp.router(
        title: 'eBidPortal',
        theme: AppTheme.lightTheme,
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
