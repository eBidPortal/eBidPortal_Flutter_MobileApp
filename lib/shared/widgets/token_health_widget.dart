import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/auth/token_manager.dart';
import '../../core/theme/app_theme.dart';
import '../../features/auth/presentation/auth_provider.dart';

class TokenHealthWidget extends ConsumerWidget {
  final bool showFullDetails;
  
  const TokenHealthWidget({super.key, this.showFullDetails = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<TokenHealth>(
      future: ref.read(tokenManagerProvider).getTokenHealth(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        }

        if (!snapshot.hasData) {
          return const Icon(Icons.error, color: Colors.red, size: 20);
        }

        final health = snapshot.data!;
        final color = _getStatusColor(health.status);
        final icon = _getStatusIcon(health.status);

        if (!showFullDetails) {
          return Icon(icon, color: color, size: 20);
        }

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.spacingMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(icon, color: color),
                    const SizedBox(width: AppTheme.spacingSm),
                    Text(
                      'Token Status',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(height: AppTheme.spacingSm),
                Text(
                  'Status: ${health.status.name}',
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
                Text(health.message),
                if (health.expiry != null) ...[
                  const SizedBox(height: AppTheme.spacingSm),
                  FutureBuilder<String>(
                    future: ref.read(tokenManagerProvider).getExpiryDisplay(),
                    builder: (context, expirySnapshot) {
                      if (expirySnapshot.hasData) {
                        return Text(expirySnapshot.data!);
                      }
                      return const Text('Calculating...');
                    },
                  ),
                ],
                const SizedBox(height: AppTheme.spacingMd),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (health.needsRefresh)
                      ElevatedButton.icon(
                        onPressed: () async {
                          final success = await ref.read(authProvider.notifier).refreshToken();
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  success ? 'Token refreshed successfully' : 'Token refresh failed',
                                ),
                                backgroundColor: success ? Colors.green : Colors.red,
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('Refresh'),
                      ),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final isValid = await ref.read(tokenManagerProvider).ensureTokenValid();
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                isValid ? 'Token is valid' : 'Token validation failed',
                              ),
                              backgroundColor: isValid ? Colors.green : Colors.red,
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.check),
                      label: const Text('Validate'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getStatusColor(TokenStatus status) {
    switch (status) {
      case TokenStatus.valid:
        return Colors.green;
      case TokenStatus.expiringSoon:
        return Colors.orange;
      case TokenStatus.expired:
      case TokenStatus.missing:
        return Colors.red;
      case TokenStatus.unknown:
      case TokenStatus.error:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(TokenStatus status) {
    switch (status) {
      case TokenStatus.valid:
        return Icons.check_circle;
      case TokenStatus.expiringSoon:
        return Icons.warning;
      case TokenStatus.expired:
        return Icons.error;
      case TokenStatus.missing:
        return Icons.no_accounts;
      case TokenStatus.unknown:
        return Icons.help;
      case TokenStatus.error:
        return Icons.error_outline;
    }
  }
}

class TokenHealthDialog extends ConsumerWidget {
  const TokenHealthDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('Token Health Monitor'),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TokenHealthWidget(showFullDetails: true),
            const SizedBox(height: AppTheme.spacingMd),
            Text(
              'This is a development tool to monitor JWT token health and expiry.',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}