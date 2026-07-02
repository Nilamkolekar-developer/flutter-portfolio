import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

/// Wraps every section with consistent max-width, padding, and optional
/// background color/key (used for scroll-to-section navigation).
class SectionWrapper extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final GlobalKey? sectionKey;

  const SectionWrapper({
    super.key,
    required this.child,
    this.backgroundColor,
    this.sectionKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey,
      width: double.infinity,
      color: backgroundColor ?? AppColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
        vertical: Responsive.isMobile(context) ? 56 : 96,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Responsive.contentMaxWidth(context),
          ),
          child: child,
        ),
      ),
    );
  }
}

/// Small uppercase eyebrow label used above section headings
/// (e.g. "EXPERIENCE", "PROJECTS").
class SectionLabel extends StatelessWidget {
  final String text;
  const SectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 28, height: 3, color: AppColors.accent),
        const SizedBox(width: 10),
        Text(
          text.toUpperCase(),
          style: const TextStyle(
            color: AppColors.accent,
            fontWeight: FontWeight.w700,
            fontSize: 13,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }
}
