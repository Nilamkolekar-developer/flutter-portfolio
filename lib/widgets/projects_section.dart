// import 'package:flutter/material.dart';
// import '../data/portfolio_data.dart';
// import '../theme/app_theme.dart';
// import '../utils/responsive.dart';
// import 'section_wrapper.dart';

// class ProjectsSection extends StatelessWidget {
//   final GlobalKey sectionKey;
//   const ProjectsSection({super.key, required this.sectionKey});

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = Responsive.isMobile(context);
//     final cardWidth = isMobile
//         ? double.infinity
//         : (Responsive.contentMaxWidth(context) - 40) / 3;

//     return SectionWrapper(
//       sectionKey: sectionKey,
//       backgroundColor: AppColors.surface,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SectionLabel("Projects"),
//           const SizedBox(height: 16),
//           Text("Selected Work", style: Theme.of(context).textTheme.headlineMedium),
//           const SizedBox(height: 32),
//           Wrap(
//             spacing: 20,
//             runSpacing: 20,
//             children: [
//               for (final project in ProjectsData.items)
//                 SizedBox(
//                   width: cardWidth,
//                   child: _ProjectCard(project: project),
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ProjectCard extends StatelessWidget {
//   final ProjectItem project;
//   const _ProjectCard({required this.project});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(22),
//       decoration: BoxDecoration(
//         color: AppColors.background,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: AppColors.border),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             width: 44,
//             height: 44,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: AppColors.accent.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: const Icon(Icons.workspace_premium_outlined,
//                 color: AppColors.accent),
//           ),
//           const SizedBox(height: 16),
//           Text(project.title, style: Theme.of(context).textTheme.titleLarge),
//           const SizedBox(height: 4),
//           Text(
//             project.subtitle,
//             style: const TextStyle(
//               color: AppColors.slateLight,
//               fontWeight: FontWeight.w500,
//               fontSize: 13,
//             ),
//           ),
//           const SizedBox(height: 12),
//           for (final point in project.points)
//             Padding(
//               padding: const EdgeInsets.only(bottom: 8),
//               child: Text(
//                 "• $point",
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//             ),
//           const SizedBox(height: 8),
//           Text(
//             project.tech,
//             style: const TextStyle(
//               color: AppColors.accentDark,
//               fontWeight: FontWeight.w600,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
