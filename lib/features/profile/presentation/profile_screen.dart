import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../auth/presentation/auth_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('👤 SCREEN: ProfileScreen - build called');
    final userAsync = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: userAsync.when(
        data: (user) => user != null ? _ProfileView(user: user) : const _NotLoggedIn(),
        loading: () => const _ProfileLoading(),
        error: (error, stack) => _ProfileError(
          error: error.toString(),
          onRetry: () => ref.invalidate(authProvider),
        ),
      ),
    );
  }
}

class _ProfileView extends ConsumerWidget {
  final dynamic user; // Using dynamic for now since we don't have a proper User model

  const _ProfileView({required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.spacingLg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Avatar
          _buildAvatar(),

          const SizedBox(height: AppTheme.spacingLg),

          // User Info
          _buildUserInfo(context),

          const SizedBox(height: AppTheme.spacingXl),

          // Menu Items
          _buildMenuItems(context, ref),

          const SizedBox(height: AppTheme.spacingXl),

          // Logout Button
          _buildLogoutButton(context, ref),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.1),
          child: Text(
            user.name?.substring(0, 1).toUpperCase() ?? 'U',
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Column(
      children: [
        Text(
          user.name ?? 'User',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          user.email ?? '',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppTheme.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppTheme.radiusFull),
          ),
          child: Text(
            user.role ?? 'User',
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItems(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _buildMenuItem(
          context,
          icon: Icons.person,
          title: 'Personal Information',
          subtitle: 'Update your profile details',
          onTap: () => context.push('/profile/personal-information'),
        ),
        _buildMenuItem(
          context,
          icon: Icons.location_on,
          title: 'Addresses',
          subtitle: 'Manage your delivery addresses',
          onTap: () => context.push('/profile/addresses'),
        ),
        _buildMenuItem(
          context,
          icon: Icons.notifications,
          title: 'Notifications',
          subtitle: 'Manage notification preferences',
          onTap: () => context.push('/notifications'),
        ),
        _buildMenuItem(
          context,
          icon: Icons.lock,
          title: 'Security',
          subtitle: 'Change password and security settings',
          onTap: () => context.push('/profile/security'),
        ),
        _buildMenuItem(
          context,
          icon: Icons.gavel,
          title: 'My Auctions',
          subtitle: 'Manage your posted auctions',
          onTap: () {
            // Navigate to My Auctions screen
            context.go('/my-auctions');
          },
        ),
        _buildMenuItem(
          context,
          icon: Icons.favorite,
          title: 'My Watchlist',
          subtitle: 'View auctions you\'re watching',
          onTap: () {
            // Navigate to Watchlist screen
            context.go('/profile/watchlist');
          },
        ),
        _buildMenuItem(
          context,
          icon: Icons.history,
          title: 'Purchase History',
          subtitle: 'View your auction activity',
          onTap: () => context.push('/profile/purchase-history'),
        ),
        _buildMenuItem(
          context,
          icon: Icons.help,
          title: 'Help & Support',
          subtitle: 'Get help and contact support',
          onTap: () => context.push('/profile/help-support'),
        ),
        _buildMenuItem(
          context,
          icon: Icons.info,
          title: 'About',
          subtitle: 'App version and information',
          onTap: () {
            showAboutDialog(
              context: context,
              applicationName: 'eBidPortal',
              applicationVersion: '1.0.0',
              applicationLegalese: '© 2025 eBidPortal',
            );
          },
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingSm),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          ),
          child: Icon(
            icon,
            color: AppTheme.primaryColor,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppTheme.textSecondary,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: AppTheme.textSecondary,
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: () {
          // TODO: Implement logout
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Logout - Coming soon!')),
          );
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppTheme.errorColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          ),
        ),
        child: const Text(
          'Logout',
          style: TextStyle(
            color: AppTheme.errorColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _NotLoggedIn extends StatelessWidget {
  const _NotLoggedIn();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Not logged in'),
    );
  }
}

class _ProfileLoading extends StatelessWidget {
  const _ProfileLoading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ProfileError extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const _ProfileError({
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingLg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppTheme.errorColor,
            ),
            const SizedBox(height: AppTheme.spacingMd),
            Text(
              'Failed to load profile',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingSm),
            Text(
              error,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacingLg),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}