import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import 'section_wrapper.dart';

class HeroSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final VoidCallback onViewWork;

  const HeroSection({super.key, required this.sectionKey, required this.onViewWork});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri, webOnlyWindowName: '_blank');
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionWrapper(
      sectionKey: sectionKey,
      backgroundColor: AppColors.surface,
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: isMobile ? 0 : 3,
            child: Column(
              crossAxisAlignment:
                  isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                const SectionLabel("Portfolio"),
                const SizedBox(height: 20),
                Text(
                  PersonalInfo.name,
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  style: (isMobile
                          ? Theme.of(context).textTheme.displayMedium
                          : Theme.of(context).textTheme.displayLarge)
                      ?.copyWith(color: AppColors.navy),
                ),
                const SizedBox(height: 8),
                Text(
                  PersonalInfo.title,
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  style: const TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 560),
                  child: Text(
                    PersonalInfo.tagline,
                    textAlign: isMobile ? TextAlign.center : TextAlign.start,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 32),
                Wrap(
                  alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                  spacing: 14,
                  runSpacing: 14,
                  children: [
                    ElevatedButton(
                      onPressed: onViewWork,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("View My Work"),
                    ),
                    OutlinedButton(
                      onPressed: () => _launch(PersonalInfo.resumeUrl),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.navy,
                        side: const BorderSide(color: AppColors.border, width: 1.5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Download Resume"),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Wrap(
                  alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                  spacing: 18,
                  children: [
                    _SocialIcon(icon: FontAwesomeIcons.github, onTap: () => _launch(PersonalInfo.github)),
                    _SocialIcon(icon: FontAwesomeIcons.linkedin, onTap: () => _launch(PersonalInfo.linkedin)),
                    _SocialIcon(icon: FontAwesomeIcons.envelope, onTap: () => _launch("mailto:${PersonalInfo.email}")),
                  ],
                ),
              ],
            ),
          ),
          if (!isMobile) const SizedBox(width: 48),
          if (!isMobile)
            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  width: 320,
                  height: 320,
                  decoration: BoxDecoration(
                    color: AppColors.navy.withOpacity(0.05),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.border, width: 2),
                  ),
                  // TODO: replace with Image.asset('assets/profile.jpg')
                  child: const Icon(Icons.person_outline,
                      size: 140, color: AppColors.slateLight),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _SocialIcon({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 42,
        height: 42,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.background,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.border),
        ),
        child: FaIcon(icon, size: 18, color: AppColors.navy),
      ),
    );
  }
}
