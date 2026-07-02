// import 'package:flutter/material.dart';
// import '../data/portfolio_data.dart';
// import '../theme/app_theme.dart';
// import '../utils/responsive.dart';
// import 'section_wrapper.dart';

// class SkillsSection extends StatelessWidget {
//   final GlobalKey sectionKey;
//   const SkillsSection({super.key, required this.sectionKey});

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = Responsive.isMobile(context);
//     // Two cards per row on tablet/desktop, one per row on mobile.
//     final cardWidth = isMobile
//         ? double.infinity
//         : (Responsive.contentMaxWidth(context) - 20) / 2;

//     return SectionWrapper(
//       sectionKey: sectionKey,
//       backgroundColor: AppColors.surface,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SectionLabel("Skills"),
//           const SizedBox(height: 16),
//           Text("Technical Expertise", style: Theme.of(context).textTheme.headlineMedium),
//           const SizedBox(height: 32),
//           Wrap(
//             spacing: 20,
//             runSpacing: 20,
//             children: [
//               for (final group in SkillsData.groups)
//                 SizedBox(
//                   width: cardWidth,
//                   child: Container(
//                     padding: const EdgeInsets.all(24),
//                     decoration: BoxDecoration(
//                       color: AppColors.background,
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: AppColors.border),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(group.category, style: Theme.of(context).textTheme.titleMedium),
//                         const SizedBox(height: 14),
//                         Wrap(
//                           spacing: 8,
//                           runSpacing: 8,
//                           children: [
//                             for (final skill in group.skills)
//                               Container(
//                                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                                 decoration: BoxDecoration(
//                                   color: AppColors.accent.withOpacity(0.08),
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 child: Text(
//                                   skill,
//                                   style: const TextStyle(
//                                     color: AppColors.accentDark,
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
