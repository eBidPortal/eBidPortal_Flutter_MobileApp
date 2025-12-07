import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool centerTitle;

  AppBarCustom({
    Key? key,
    required this.title,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.backgroundColor,
    this.foregroundColor,
    this.centerTitle = true,
  }) : super(key: key) {
    print('🎨 APPBAR_CUSTOM: Constructor called with title: $title');
  }

  @override
  Widget build(BuildContext context) {
    print('🎨 APPBAR_CUSTOM: Building AppBar with title: $title');
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: foregroundColor ?? AppTheme.textPrimary,
        ),
      ),
      actions: actions,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor ?? AppTheme.surfaceColor,
      foregroundColor: foregroundColor ?? AppTheme.textPrimary,
      centerTitle: centerTitle,
      elevation: 0,
      scrolledUnderElevation: 1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}