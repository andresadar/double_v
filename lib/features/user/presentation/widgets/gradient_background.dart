import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Widget que proporciona un fondo con gradiente hermoso
class GradientBackground extends StatelessWidget {
  final Widget child;
  final bool hasAppBar;

  const GradientBackground({
    super.key,
    required this.child,
    this.hasAppBar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.backgroundGradient,
      ),
      child: child,
    );
  }
}
