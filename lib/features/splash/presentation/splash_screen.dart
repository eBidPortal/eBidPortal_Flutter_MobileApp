import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../auth/presentation/auth_provider.dart';
import 'splash_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    print('🔄 SCREEN: SplashScreen - initState called');
    _setupAnimations();
    _initializeApp();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );

    _animationController.forward();
  }

  void _initializeApp() {
    // Delay initialization to avoid modifying provider during build
    Future.delayed(const Duration(seconds: 2), () async {
      if (!mounted) return;
      
      await ref.read(splashProvider.notifier).initialize();
      
      // After initialization, navigate based on auth state
      if (mounted) {
        final authState = ref.read(authProvider);
        final isLoggedIn = authState.value != null;
        
        print('🔄 SPLASH: Auth check complete. isLoggedIn=$isLoggedIn');
        
        if (isLoggedIn) {
          // Navigate to home
          if (context.mounted) {
            print('🔄 SPLASH: Navigating to home');
            context.go('/');
          }
        } else {
          // Navigate to login
          if (context.mounted) {
            print('🔄 SPLASH: Navigating to login');
            context.go('/login');
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final splashState = ref.watch(splashProvider);

    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AppTheme.primaryGradient,
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                // Animated Logo
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(AppTheme.radiusXl),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.gavel_rounded,
                        size: 50,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppTheme.spacingLg),
                // App Name
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: const Text(
                    'eBidPortal',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: AppTheme.spacingSm),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: const Text(
                    'Your Auction Platform',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                // Loading Indicator with Status
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      const SizedBox(
                        width: 36,
                        height: 36,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacingMd),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingLg),
                        child: Text(
                          splashState.when(
                            data: (status) {
                              switch (status) {
                                case InitializationStatus.initializing:
                                  return 'Starting up...';
                                case InitializationStatus.firebaseInitialized:
                                  return 'Firebase ready...';
                                case InitializationStatus.initializingMessaging:
                                  return 'Setting up notifications...';
                                case InitializationStatus.initializingAnalytics:
                                  return 'Initializing analytics...';
                                case InitializationStatus.checkingAuth:
                                  return 'Checking authentication...';
                                case InitializationStatus.tokenRefreshed:
                                  return 'Session validated...';
                                case InitializationStatus.completed:
                                  return 'Ready!';
                                case InitializationStatus.error:
                                  return 'Error occurred';
                              }
                            },
                            loading: () => 'Initializing...',
                            error: (error, _) => 'Error: ${error.toString()}',
                          ),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
