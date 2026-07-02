// import 'package:flutter/material.dart';
// import '../data/portfolio_data.dart';
// import '../theme/app_theme.dart';
// import '../utils/responsive.dart';
// import 'section_wrapper.dart';

// class EducationSection extends StatelessWidget {
//   final GlobalKey sectionKey;
//   const EducationSection({super.key, required this.sectionKey});

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = Responsive.isMobile(context);

//     return SectionWrapper(
//       sectionKey: sectionKey,
//       child: Flex(
//         direction: isMobile ? Axis.vertical : Axis.horizontal,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             flex: 3,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SectionLabel("Education"),
//                 const SizedBox(height: 16),
//                 Text("Academic Background", style: Theme.of(context).textTheme.headlineMedium),
//                 const SizedBox(height: 24),
//                 for (final edu in EducationData.items)
//                   Container(
//                     margin: const EdgeInsets.only(bottom: 16),
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: AppColors.surface,
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: AppColors.border),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(edu.degree, style: Theme.of(context).textTheme.titleMedium),
//                         const SizedBox(height: 6),
//                         Text(edu.institute,
//                             style: const TextStyle(
//                                 color: AppColors.accent, fontWeight: FontWeight.w600)),
//                         const SizedBox(height: 6),
//                         Text("${edu.score}  ·  ${edu.period}",
//                             style: Theme.of(context).textTheme.bodyMedium),
//                       ],
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           if (!isMobile) const SizedBox(width: 48),
//           if (isMobile) const SizedBox(height: 16),
//           Expanded(
//             flex: 2,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SectionLabel("Achievements"),
//                 const SizedBox(height: 16),
//                 Text("Highlights", style: Theme.of(context).textTheme.headlineMedium),
//                 const SizedBox(height: 24),
//                 for (final achievement in AchievementsData.items)
//                   Container(
//                     margin: const EdgeInsets.only(bottom: 14),
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: AppColors.navy.withOpacity(0.04),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Icon(Icons.emoji_events_outlined,
//                             color: AppColors.accent, size: 20),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Text(achievement,
//                               style: Theme.of(context).textTheme.bodyMedium),
//                         ),
//                       ],
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
