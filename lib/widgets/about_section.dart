// import 'package:flutter/material.dart';
// import '../data/portfolio_data.dart';
// import '../theme/app_theme.dart';
// import '../utils/responsive.dart';
// import 'section_wrapper.dart';

// class AboutSection extends StatelessWidget {
//   final GlobalKey sectionKey;
//   const AboutSection({super.key, required this.sectionKey});

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = Responsive.isMobile(context);

//     return SectionWrapper(
//       sectionKey: sectionKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SectionLabel("About Me"),
//           const SizedBox(height: 16),
//           Text("Who I Am", style: Theme.of(context).textTheme.headlineMedium),
//           const SizedBox(height: 24),
//           Flex(
//             direction: isMobile ? Axis.vertical : Axis.horizontal,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: Text(
//                   PersonalInfo.summary,
//                   style: Theme.of(context).textTheme.bodyLarge,
//                 ),
//               ),
//               if (!isMobile) const SizedBox(width: 48),
//               if (isMobile) const SizedBox(height: 24),
//               Expanded(
//                 flex: 2,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _InfoRow(label: "Location", value: PersonalInfo.location),
//                     _InfoRow(label: "Email", value: PersonalInfo.email),
//                     _InfoRow(label: "Phone", value: PersonalInfo.phone),
//                     _InfoRow(label: "Experience", value: "2+ years"),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _InfoRow extends StatelessWidget {
//   final String label;
//   final String value;
//   const _InfoRow({required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 14),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: AppColors.surface,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: AppColors.border),
//       ),
//       child: Row(
//         children: [
//           Text(
//             label,
//             style: const TextStyle(
//               color: AppColors.slateLight,
//               fontWeight: FontWeight.w500,
//               fontSize: 13,
//             ),
//           ),
//           const Spacer(),
//           Flexible(
//             child: Text(
//               value,
//               textAlign: TextAlign.right,
//               style: const TextStyle(
//                 color: AppColors.textPrimary,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 13,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
