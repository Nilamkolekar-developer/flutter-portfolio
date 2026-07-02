// import 'package:flutter/material.dart';
// import '../data/portfolio_data.dart';
// import '../theme/app_theme.dart';
// import 'section_wrapper.dart';

// class ExperienceSection extends StatelessWidget {
//   final GlobalKey sectionKey;
//   const ExperienceSection({super.key, required this.sectionKey});

//   @override
//   Widget build(BuildContext context) {
//     return SectionWrapper(
//       sectionKey: sectionKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SectionLabel("Experience"),
//           const SizedBox(height: 16),
//           Text("Where I've Worked", style: Theme.of(context).textTheme.headlineMedium),
//           const SizedBox(height: 32),
//           for (int i = 0; i < ExperienceData.items.length; i++)
//             _TimelineItem(
//               item: ExperienceData.items[i],
//               isLast: i == ExperienceData.items.length - 1,
//             ),
//         ],
//       ),
//     );
//   }
// }

// class _TimelineItem extends StatelessWidget {
//   final ExperienceItem item;
//   final bool isLast;
//   const _TimelineItem({required this.item, required this.isLast});

//   @override
//   Widget build(BuildContext context) {
//     return IntrinsicHeight(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Column(
//             children: [
//               Container(
//                 width: 14,
//                 height: 14,
//                 margin: const EdgeInsets.only(top: 6),
//                 decoration: const BoxDecoration(
//                   color: AppColors.accent,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               if (!isLast)
//                 Expanded(
//                   child: Container(width: 2, color: AppColors.border),
//                 ),
//             ],
//           ),
//           const SizedBox(width: 24),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(bottom: isLast ? 0 : 32),
//               child: Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: AppColors.surface,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: AppColors.border),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Wrap(
//                       crossAxisAlignment: WrapCrossAlignment.center,
//                       spacing: 12,
//                       runSpacing: 6,
//                       children: [
//                         Text(item.role, style: Theme.of(context).textTheme.titleLarge),
//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                           decoration: BoxDecoration(
//                             color: AppColors.navy.withOpacity(0.06),
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                           child: Text(
//                             item.period,
//                             style: const TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600,
//                               color: AppColors.navy,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       item.company,
//                       style: const TextStyle(
//                         color: AppColors.accent,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                       ),
//                     ),
//                     const SizedBox(height: 14),
//                     for (final point in item.points)
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 8),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Padding(
//                               padding: EdgeInsets.only(top: 7, right: 10),
//                               child: CircleAvatar(
//                                 radius: 3,
//                                 backgroundColor: AppColors.slateLight,
//                               ),
//                             ),
//                             Expanded(
//                               child: Text(
//                                 point,
//                                 style: Theme.of(context).textTheme.bodyMedium,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
