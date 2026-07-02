import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import 'section_wrapper.dart';

class ContactFooter extends StatelessWidget {
  final GlobalKey sectionKey;
  const ContactFooter({super.key, required this.sectionKey});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri, webOnlyWindowName: '_blank');
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      children: [
        SectionWrapper(
          sectionKey: sectionKey,
          backgroundColor: AppColors.navy,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Let's Work Together",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: Colors.white, fontSize: isMobile ? 28 : 36),
              ),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Text(
                  "Have a project in mind or an opening on your team? "
                  "I'd love to hear from you.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color(0xFFB8C2D9), fontSize: 16, height: 1.6),
                ),
              ),
              const SizedBox(height: 36),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 16,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _launch("mailto:${PersonalInfo.email}"),
                    icon: const Icon(Icons.email_outlined, size: 18),
                    label: const Text("Email Me"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => _launch(PersonalInfo.linkedin),
                    icon: const FaIcon(FontAwesomeIcons.linkedin, size: 16),
                    label: const Text("LinkedIn"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFF33456B), width: 1.5),
                      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => _launch(PersonalInfo.github),
                    icon: const FaIcon(FontAwesomeIcons.github, size: 16),
                    label: const Text("GitHub"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFF33456B), width: 1.5),
                      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: AppColors.navyLight,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text(
            "© ${DateTime.now().year} ${PersonalInfo.name}. All rights reserved.",
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xFF8493AC), fontSize: 13),
          ),
        ),
      ],
    );
  }
}
