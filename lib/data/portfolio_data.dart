// ---------------------------------------------------------------------------
// All portfolio content lives here. Edit this file to update your details —
// no need to touch the UI widgets.
// ---------------------------------------------------------------------------

class PersonalInfo {
  static const String name = "Nilam Shahaji Kolekar"; // TODO: replace with your name
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
  static const String email = "nilamkolekar26@gmail.com"; // TODO
  static const String phone = "+91 9730584425"; // TODO
  static const String location = "Pune, India"; // TODO
  static const String github = "https://github.com/yourusername"; // TODO
  static const String linkedin = "https://linkedin.com/in/yourusername"; // TODO
  static const String resumeUrl = "assets/resume.pdf"; // TODO: add your resume file
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
