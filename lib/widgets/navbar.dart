import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function(String key) onNavTap;
  final VoidCallback onContactTap;

  const NavBar({super.key, required this.onNavTap, required this.onContactTap});

  static const List<String> _navItems = [
    "About", "Skills", "Experience", "Projects", "Education",
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
      ),
      child: Row(
        children: [
          Text(
            PersonalInfo.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          if (!isMobile) ...[
            for (final item in _navItems)
              TextButton(
                onPressed: () => onNavTap(item.toLowerCase()),
                child: Text(
                  item,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: onContactTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.navy,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Contact"),
            ),
          ] else
            PopupMenuButton<String>(
              icon: const Icon(Icons.menu, color: AppColors.textPrimary),
              onSelected: (v) =>
                  v == "contact" ? onContactTap() : onNavTap(v),
              itemBuilder: (context) => [
                for (final item in _navItems)
                  PopupMenuItem(
                    value: item.toLowerCase(),
                    child: Text(item),
                  ),
                const PopupMenuItem(value: "contact", child: Text("Contact")),
              ],
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}
