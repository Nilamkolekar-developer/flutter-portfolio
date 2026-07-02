import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

void main() {
  runApp(const PortfolioApp());
}

// =============================================================================
// APP ROOT
// =============================================================================

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${PersonalInfo.name} — Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const PortfolioHomePage(),
    );
  }
}

// =============================================================================
// MAIN.DART
// =============================================================================

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  Map<String, GlobalKey> get _sectionKeys => {
        "home": _heroKey,
        "about": _aboutKey,
        "skills": _skillsKey,
        "experience": _experienceKey,
        "projects": _projectsKey,
        "education": _educationKey,
        "contact": _contactKey,
      };

  void _scrollTo(String key) {
    final ctx = _sectionKeys[key]?.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        onNavTap: _scrollTo,
        onContactTap: () => _scrollTo("contact"),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(sectionKey: _heroKey, onViewWork: () => _scrollTo("projects")),
            AboutSection(sectionKey: _aboutKey),
            SkillsSection(sectionKey: _skillsKey),
            ExperienceSection(sectionKey: _experienceKey),
            ProjectsSection(sectionKey: _projectsKey),
            EducationSection(sectionKey: _educationKey),
            ContactFooter(sectionKey: _contactKey),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// THEME / APP_THEME.DART
// =============================================================================

/// Corporate / professional palette — deep navy + slate + a single
/// confident accent blue. Kept restrained on purpose.
class AppColors {
  static const Color navy = Color(0xFF0B1F3A);
  static const Color navyLight = Color(0xFF13294B);
  static const Color slate = Color(0xFF3D4B5C);
  static const Color slateLight = Color(0xFF6B7A8F);
  static const Color accent = Color(0xFF2F6FED);
  static const Color accentDark = Color(0xFF1E4FBF);
  static const Color background = Color(0xFFF7F8FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE3E7ED);
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF5B6472);
}

class AppTheme {
  static ThemeData get theme {
    final base = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.accent,
        primary: AppColors.accent,
        background: AppColors.background,
      ),
    );

    final textTheme = GoogleFonts.interTextTheme(base.textTheme).copyWith(
      displayLarge: GoogleFonts.poppins(
        fontSize: 56,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.1,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.15,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.6,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.6,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.surface,
      ),
    );

    return base.copyWith(textTheme: textTheme);
  }
}

// =============================================================================
// UTILS / RESPONSIVE.DART
// =============================================================================

/// Simple breakpoint helpers used throughout the app.
class Responsive {
  static const double mobileMax = 700;
  static const double tabletMax = 1100;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileMax;

  static bool isTablet(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return w >= mobileMax && w < tabletMax;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletMax;

  /// Horizontal page padding that scales with screen size.
  static double horizontalPadding(BuildContext context) {
    if (isMobile(context)) return 20;
    if (isTablet(context)) return 48;
    return 96;
  }

  /// Caps content width on very large screens so text doesn't stretch edge
  /// to edge.
  static double contentMaxWidth(BuildContext context) => 1200;
}

// =============================================================================
// DATA / PORTFOLIO_DATA.DART
// =============================================================================

// ---------------------------------------------------------------------------
// All portfolio content lives here. Edit this file to update your details —
// no need to touch the UI widgets.
// ---------------------------------------------------------------------------

class PersonalInfo {
  static const String name = "Nilam Shahaji Kolekar";
  static const String title = "Flutter Developer";
  static const String tagline =
      "Building cross-platform mobile apps and full-stack web systems that ship.";
  static const String summary =
      "Flutter Developer with 2+ years of experience building cross-platform "
      "mobile applications and full-stack web systems. Skilled in Flutter, "
      "GetX state management, Firebase (real-time database, authentication), "
      "and REST API integration, with a strong foundation in Java, React, and "
      "SQL from prior full-stack work. Currently building automotive "
      "diagnostic mobile apps (DTC reading/flashing) at Autopeepal "
      "Technologies. Delivered production apps spanning HRMS, ed-tech, and "
      "AI-enhanced learning tools. Comfortable owning a feature end-to-end — "
      "from UI to backend integration to deployment — within agile, "
      "cross-functional teams.";
  static const String email = "nilamkolekar26@gmail.com";
  static const String phone = "+91 9730584425";
  static const String location = "Pune, India"; // TODO
  static const String github = "https://github.com/yourusername"; // TODO
  static const String linkedin = "https://linkedin.com/in/yourusername"; // TODO
  static const String resumeUrl = "assets/assets/pdf/Nilam-resume.pdf";
}

class SkillGroup {
  final String category;
  final List<String> skills;
  const SkillGroup(this.category, this.skills);
}

class SkillsData {
  static const List<SkillGroup> groups = [
    SkillGroup("Mobile Development", [
      "Flutter", "Dart", "GetX", "Firebase (Realtime DB, Auth, Firestore)",
      "Cross-platform iOS/Android",
    ]),
    SkillGroup("Web Development", [
      "React", "JavaScript", "HTML5", "CSS3", "Bootstrap",
      "Responsive Web Design", "Java", "Node.js", "Express.js",
    ]),
    SkillGroup("Database & APIs", [
      "SQL", "MongoDB", "RESTful APIs", "Third-party API Integration",
    ]),
    SkillGroup("Tools & Practices", [
      "Git", "GitHub", "GitLab", "VS Code", "Postman",
      "Agile/Scrum", "Debugging", "Code Optimization",
    ]),
  ];
}

class ExperienceItem {
  final String role;
  final String company;
  final String period;
  final List<String> points;
  const ExperienceItem({
    required this.role,
    required this.company,
    required this.period,
    required this.points,
  });
}

class ExperienceData {
  static const List<ExperienceItem> items = [
    ExperienceItem(
      role: "Junior Flutter Developer",
      company: "Autopeepal Technologies",
      period: "February 2026 – Present",
      points: [
        "Develop Flutter-based mobile applications for automotive diagnostics, including DTC (Diagnostic Trouble Code) reading and flashing workflows.",
        "Contributed to 3 diagnostic-focused mobile app projects, building UI and integrating diagnostic/hardware communication features.",
        "Collaborate with cross-functional teams to test and refine diagnostic tools for real-world vehicle data accuracy.",
      ],
    ),
    ExperienceItem(
      role: "Full Stack Developer",
      company: "Global Edutech Pvt Ltd.",
      period: "May 2024 – January 2026",
      points: [
        "Built and maintained Android and web features for an educational platform using Java, React, Firebase, and SQL.",
        "Owned frontend and backend development for two major applications, from planning through testing and deployment.",
        "Contributed to release planning and QA cycles, helping ship on schedule with reduced bug count and fewer post-release issues.",
      ],
    ),
  ];
}

class ProjectItem {
  final String title;
  final String subtitle;
  final String tech;
  final List<String> points;
  const ProjectItem({
    required this.title,
    required this.subtitle,
    required this.tech,
    required this.points,
  });
}

class ProjectsData {
  static const List<ProjectItem> items = [
    ProjectItem(
      title: "ECU Diagnostic Terminal Tool",
      subtitle: "Kirloskar & Autopeepal",
      tech: "Flutter/Dart, Dongle Communication, ECU Protocols, WiFi, USB",
      points: [
        "Built a terminal application to send and verify ECU commands through a diagnostic dongle across multiple communication channels for Kirloskar and Autopeepal diagnostic projects.",
        "Implemented routine diagnostic tests and DTC (Diagnostic Trouble Code) read functionality across all supported channels.",
        "Enabled ECU flashing over both WiFi and USB dongle connections.",
      ],
    ),
    ProjectItem(
      title: "ErpHrms",
      subtitle: "Enterprise HR Management System",
      tech: "Flutter, GetX, Firebase",
      points: [
        "Built a cross-platform HR management app (onboarding, attendance, leave, payroll, performance reviews) using Firebase for real-time sync and authentication.",
      ],
    ),
    ProjectItem(
      title: "AI Language Learning Platform",
      subtitle: "Grades 1–12 interactive learning",
      tech: "React, JavaScript, SQL, AI Integrations",
      points: [
        "Built an AI-powered web app delivering interactive learning content and quizzes for grades 1–12.",
      ],
    ),
  ];
}

class EducationItem {
  final String degree;
  final String institute;
  final String score;
  final String period;
  const EducationItem({
    required this.degree,
    required this.institute,
    required this.score,
    required this.period,
  });
}

class EducationData {
  static const List<EducationItem> items = [
    EducationItem(
      degree: "Bachelor of Engineering, Computer Engineering",
      institute: "Pune University",
      score: "CGPA 9.05",
      period: "2020 – 2023",
    ),
    EducationItem(
      degree: "Diploma in Computer Engineering",
      institute: "MSBTE",
      score: "82.17%",
      period: "2018 – 2020",
    ),
  ];
}

class AchievementsData {
  static const List<String> items = [
    "Awarded 1st Prize in Academics.",
    "Served as TPO (Training & Placement) Cell Coordinator; organized the 'Junior Paras' college event.",
  ];
}

// =============================================================================
// WIDGETS / SECTION_WRAPPER.DART
// =============================================================================

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

// =============================================================================
// WIDGETS / NAVBAR.DART
// =============================================================================

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

// =============================================================================
// WIDGETS / HERO_SECTION.DART
// =============================================================================

class HeroSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final VoidCallback onViewWork;

  const HeroSection({super.key, required this.sectionKey, required this.onViewWork});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri, webOnlyWindowName: '_blank');
  }

  /// Fetches the PDF as raw bytes and forces a real download via a Blob
  /// URL. This is more reliable across browsers/dev-vs-release builds than
  /// pointing an anchor's `download` attribute straight at a relative asset
  /// path, which some browsers/environments will still just open instead
  /// of downloading.
  Future<void> _downloadResume(String assetUrl, String downloadFileName) async {
    try {
      final request = await html.HttpRequest.request(
        assetUrl,
        responseType: 'arraybuffer',
      );
      final buffer = request.response as ByteBuffer;
      final blob = html.Blob([buffer], 'application/pdf');
      final blobUrl = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: blobUrl)
        ..setAttribute('download', downloadFileName)
        ..style.display = 'none';
      html.document.body?.append(anchor);
      anchor.click();
      anchor.remove();
      html.Url.revokeObjectUrl(blobUrl);
    } catch (e) {
      // Fallback: open in a new tab if the fetch fails (e.g. bad path).
      final uri = Uri.parse(assetUrl);
      if (await canLaunchUrl(uri)) await launchUrl(uri, webOnlyWindowName: '_blank');
    }
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
                      onPressed: () => _downloadResume(
                          PersonalInfo.resumeUrl, "Nilam-resume.pdf"),
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
                  child: ClipOval(
                    child: Image.asset(
                      'assets/image/image.jpg',
                      width: 320,
                      height: 320,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.person_outline,
                        size: 140,
                        color: AppColors.slateLight,
                      ),
                    ),
                  ),
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

// =============================================================================
// WIDGETS / ABOUT_SECTION.DART
// =============================================================================

class AboutSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const AboutSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionWrapper(
      sectionKey: sectionKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel("About Me"),
          const SizedBox(height: 16),
          Text("Who I Am", style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 24),
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  PersonalInfo.summary,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              if (!isMobile) const SizedBox(width: 48),
              if (isMobile) const SizedBox(height: 24),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _InfoRow(label: "Location", value: PersonalInfo.location),
                    _InfoRow(label: "Email", value: PersonalInfo.email),
                    _InfoRow(label: "Phone", value: PersonalInfo.phone),
                    _InfoRow(label: "Experience", value: "2+ years"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.slateLight,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
          const Spacer(),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// WIDGETS / SKILLS_SECTION.DART
// =============================================================================

class SkillsSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const SkillsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final cardWidth = isMobile
        ? double.infinity
        : (Responsive.contentMaxWidth(context) - 20) / 2;

    // Chunk groups into pairs so each pair can be stretched to equal
    // height together. Safe to use IntrinsicHeight here (unlike a Row
    // with Expanded children) because every card has an explicit fixed
    // width, so there's no flex-based intrinsic-size mismeasurement.
    final List<List<SkillGroup>> rows = [];
    for (int i = 0; i < SkillsData.groups.length; i += 2) {
      rows.add(SkillsData.groups.sublist(
        i,
        (i + 2 <= SkillsData.groups.length) ? i + 2 : i + 1,
      ));
    }

    return SectionWrapper(
      sectionKey: sectionKey,
      backgroundColor: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel("Skills"),
          const SizedBox(height: 16),
          Text("Technical Expertise", style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 32),
          for (final row in rows)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: isMobile
                  ? Column(
                      children: [
                        for (final group in row)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: _SkillCard(group: group, width: cardWidth),
                          ),
                      ],
                    )
                  : IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (int i = 0; i < row.length; i++) ...[
                            if (i > 0) const SizedBox(width: 20),
                            SizedBox(
                              width: cardWidth,
                              child: _SkillCard(group: row[i], width: cardWidth),
                            ),
                          ],
                        ],
                      ),
                    ),
            ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  final SkillGroup group;
  final double width;
  const _SkillCard({required this.group, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(group.category, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final skill in group.skills)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    skill,
                    style: const TextStyle(
                      color: AppColors.accentDark,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// WIDGETS / EXPERIENCE_SECTION.DART
// =============================================================================

class ExperienceSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const ExperienceSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      sectionKey: sectionKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel("Experience"),
          const SizedBox(height: 16),
          Text("Where I've Worked", style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 32),
          for (int i = 0; i < ExperienceData.items.length; i++)
            _TimelineItem(
              item: ExperienceData.items[i],
              isLast: i == ExperienceData.items.length - 1,
            ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final ExperienceItem item;
  final bool isLast;
  const _TimelineItem({required this.item, required this.isLast});

  @override
  Widget build(BuildContext context) {
    // Stack sizes itself to the Row (its only non-positioned child), then
    // the connecting line stretches to match via top/bottom Positioned —
    // this avoids IntrinsicHeight, which mis-measures wrapped text.
    return Stack(
      children: [
        if (!isLast)
          const Positioned(
            left: 6,
            top: 20,
            bottom: 0,
            child: SizedBox(width: 2, child: ColoredBox(color: AppColors.border)),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 14,
              height: 14,
              margin: const EdgeInsets.only(top: 6),
              decoration: const BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: isLast ? 0 : 32),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 12,
                        runSpacing: 6,
                        children: [
                          Text(item.role, style: Theme.of(context).textTheme.titleLarge),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.navy.withOpacity(0.06),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              item.period,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.navy,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.company,
                        style: const TextStyle(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 14),
                      for (final point in item.points)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 7, right: 10),
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: AppColors.slateLight,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  point,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// =============================================================================
// WIDGETS / PROJECTS_SECTION.DART
// =============================================================================

class ProjectsSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const ProjectsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final cardWidth = isMobile
        ? double.infinity
        : (Responsive.contentMaxWidth(context) - 40) / 3;

    // Chunk into rows of 3 so each row can be stretched to equal height —
    // same safe pattern as Skills (fixed-width children, no Expanded, so
    // IntrinsicHeight measures correctly).
    final List<List<ProjectItem>> rows = [];
    for (int i = 0; i < ProjectsData.items.length; i += 3) {
      rows.add(ProjectsData.items.sublist(
        i,
        (i + 3 <= ProjectsData.items.length) ? i + 3 : ProjectsData.items.length,
      ));
    }

    return SectionWrapper(
      sectionKey: sectionKey,
      backgroundColor: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel("Projects"),
          const SizedBox(height: 16),
          Text("Selected Work", style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 32),
          for (final row in rows)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: isMobile
                  ? Column(
                      children: [
                        for (final project in row)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: _ProjectCard(project: project, width: cardWidth),
                          ),
                      ],
                    )
                  : IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (int i = 0; i < row.length; i++) ...[
                            if (i > 0) const SizedBox(width: 20),
                            SizedBox(
                              width: cardWidth,
                              child: _ProjectCard(project: row[i], width: cardWidth),
                            ),
                          ],
                        ],
                      ),
                    ),
            ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final ProjectItem project;
  final double width;
  const _ProjectCard({required this.project, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.workspace_premium_outlined,
                color: AppColors.accent),
          ),
          const SizedBox(height: 16),
          Text(project.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(
            project.subtitle,
            style: const TextStyle(
              color: AppColors.slateLight,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 12),
          for (final point in project.points)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "• $point",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          const SizedBox(height: 8),
          Text(
            project.tech,
            style: const TextStyle(
              color: AppColors.accentDark,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// WIDGETS / EDUCATION_SECTION.DART
// =============================================================================

class EducationSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const EducationSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionWrapper(
      sectionKey: sectionKey,
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionLabel("Education"),
                const SizedBox(height: 16),
                Text("Academic Background", style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 24),
                for (final edu in EducationData.items)
                  ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 110),
                    child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(edu.degree, style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 6),
                        Text(edu.institute,
                            style: const TextStyle(
                                color: AppColors.accent, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 6),
                        Text("${edu.score}  ·  ${edu.period}",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    ),
                  ),
              ],
            ),
          ),
          if (!isMobile) const SizedBox(width: 48),
          if (isMobile) const SizedBox(height: 16),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionLabel("Achievements"),
                const SizedBox(height: 16),
                Text("Highlights", style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 24),
                for (final achievement in AchievementsData.items)
                  ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 88),
                    child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.navy.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.emoji_events_outlined,
                            color: AppColors.accent, size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(achievement,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ],
                    ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// WIDGETS / CONTACT_FOOTER.DART
// =============================================================================

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