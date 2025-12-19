import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/app_theme.dart';

class HelpSupportScreen extends ConsumerWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Frequently Asked Questions'),
            const SizedBox(height: AppTheme.spacingMd),
            _buildFAQSection(),
            const SizedBox(height: AppTheme.spacingXl),
            _buildSectionTitle('Contact Support'),
            const SizedBox(height: AppTheme.spacingMd),
            _buildContactSection(context),
            const SizedBox(height: AppTheme.spacingXl),
            _buildSectionTitle('Legal'),
            const SizedBox(height: AppTheme.spacingMd),
            _buildLegalSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppTheme.textPrimary,
      ),
    );
  }

  Widget _buildFAQSection() {
    final faqs = [
      {
        'question': 'How do I place a bid?',
        'answer': 'Navigate to any active auction, tap on the auction card to view details, then use the bidding widget at the bottom to place your bid.',
      },
      {
        'question': 'How do I create an auction?',
        'answer': 'Tap the "Sell" button in the bottom navigation, select a category, fill in the required details, and publish your auction.',
      },
      {
        'question': 'What payment methods are accepted?',
        'answer': 'We accept various payment methods including credit cards, debit cards, and digital wallets. Payment integration coming soon.',
      },
      {
        'question': 'How do I add items to my watchlist?',
        'answer': 'Tap the heart icon on any auction card to add it to your watchlist for easy tracking.',
      },
      {
        'question': 'What are the bidding rules?',
        'answer': 'Each auction has its own bidding rules. Check the auction details for minimum bid increments and reserve prices.',
      },
    ];

    return Column(
      children: faqs.map((faq) => _buildFAQItem(faq['question']!, faq['answer']!)).toList(),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingSm),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingMd),
            child: Text(
              answer,
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Column(
      children: [
        _buildContactItem(
          icon: Icons.email,
          title: 'Email Support',
          subtitle: 'support@ebidportal.com',
          onTap: () => _launchEmail(context, 'support@ebidportal.com'),
        ),
        const SizedBox(height: AppTheme.spacingSm),
        _buildContactItem(
          icon: Icons.phone,
          title: 'Phone Support',
          subtitle: '+1 (555) 123-4567',
          onTap: () => _launchPhone(context, '+15551234567'),
        ),
        const SizedBox(height: AppTheme.spacingSm),
        _buildContactItem(
          icon: Icons.chat,
          title: 'Live Chat',
          subtitle: 'Available 9 AM - 6 PM EST',
          onTap: () => _showComingSoon(context, 'Live Chat'),
        ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.primaryColor),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  Widget _buildLegalSection(BuildContext context) {
    return Column(
      children: [
        _buildLegalItem(
          title: 'Terms of Service',
          onTap: () => _showComingSoon(context, 'Terms of Service'),
        ),
        const SizedBox(height: AppTheme.spacingSm),
        _buildLegalItem(
          title: 'Privacy Policy',
          onTap: () => _showComingSoon(context, 'Privacy Policy'),
        ),
        const SizedBox(height: AppTheme.spacingSm),
        _buildLegalItem(
          title: 'Auction Rules',
          onTap: () => _showComingSoon(context, 'Auction Rules'),
        ),
        const SizedBox(height: AppTheme.spacingSm),
        _buildLegalItem(
          title: 'Shipping & Returns',
          onTap: () => _showComingSoon(context, 'Shipping & Returns'),
        ),
      ],
    );
  }

  Widget _buildLegalItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  void _launchEmail(BuildContext context, String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'eBidPortal Support Request',
      },
    );

    try {
      await launchUrl(emailUri);
    } catch (e) {
      // Fallback - show message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email: $email')),
        );
      }
    }
  }

  void _launchPhone(BuildContext context, String phone) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phone);

    try {
      await launchUrl(phoneUri);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Phone: $phone')),
        );
      }
    }
  }

  void _showComingSoon(BuildContext context, String feature) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$feature'),
        content: const Text('This feature is coming soon. Please check back later or contact support for assistance.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}