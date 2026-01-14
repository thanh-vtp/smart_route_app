// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:smart_route_app/features/auth/presentation/states/auth.dart';
// import 'package:smart_route_app/features/map/domain/entities/incident.dart';
// import 'package:smart_route_app/features/map/presentation/extensions/incident_display_extensions.dart';
// import 'package:smart_route_app/features/map/presentation/providers/states/map_page_notifier.dart';
// import 'package:smart_route_app/features/map/presentation/widgets/edit_incident_bottom_sheet.dart';
// import 'package:smart_route_app/features/map/presentation/widgets/incident_type_widgets.dart';

// chuyển file mới: incident_detail_draggable_sheet.dart

// /// Bottom sheet hiển thị chi tiết sự cố
// class IncidentDetailBottomSheet extends ConsumerWidget {
//   final Incident incident;

//   const IncidentDetailBottomSheet({super.key, required this.incident});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final currentUser = ref.watch(authProvider);
//     final isOwner =
//         currentUser.isNotEmpty &&
//         incident.reportedByUid != null &&
//         currentUser.uid == incident.reportedByUid;

//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // Header với gradient
//           Container(
//             padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [incident.color.withValues(alpha: 0.1), Colors.white],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//               borderRadius: const BorderRadius.vertical(
//                 top: Radius.circular(24),
//               ),
//             ),
//             child: Column(
//               children: [
//                 // Drag handle
//                 Container(
//                   width: 40,
//                   height: 4,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade300,
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 // Icon và title
//                 Row(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(14),
//                       decoration: BoxDecoration(
//                         color: incident.backgroundColor,
//                         borderRadius: BorderRadius.circular(16),
//                         border: Border.all(
//                           color: incident.color.withValues(alpha: 0.3),
//                         ),
//                       ),
//                       child: IncidentTypeIcon(
//                         typeId: incident.type,
//                         size: 40,
//                         showBackground: false,
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             incident.typeDisplayName,
//                             style: const TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 6),
//                           _SeverityChip(severity: incident.severity),
//                         ],
//                       ),
//                     ),
//                     if (isOwner) _buildOwnerMenu(context, ref),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           // Content
//           Padding(
//             padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
//             child: Column(
//               children: [
//                 // Description card
//                 _InfoCard(
//                   icon: Icons.description_outlined,
//                   title: 'Mô tả',
//                   content: incident.description,
//                 ),
//                 const SizedBox(height: 12),

//                 // Location & Time row
//                 Row(
//                   children: [
//                     Expanded(
//                       child: _InfoCard(
//                         icon: Icons.access_time_outlined,
//                         title: 'Báo cáo',
//                         content: incident.formattedReportedTime,
//                         compact: true,
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: _InfoCard(
//                         icon: Icons.update_outlined,
//                         title: 'Cập nhật',
//                         content: incident.formattedEditTime,
//                         compact: true,
//                       ),
//                     ),
//                   ],
//                 ),

//                 if (incident.reportedBy != null) ...[
//                   const SizedBox(height: 12),
//                   _InfoCard(
//                     icon: Icons.person_outline,
//                     title: 'Người báo cáo',
//                     content: incident.reportedBy!,
//                   ),
//                 ],

//                 const SizedBox(height: 20),

//                 // Owner actions
//                 if (isOwner) ...[
//                   Row(
//                     children: [
//                       Expanded(
//                         child: OutlinedButton.icon(
//                           onPressed: () => _showEditSheet(context),
//                           icon: const Icon(Icons.edit_outlined, size: 20),
//                           label: const Text('Chỉnh sửa'),
//                           style: OutlinedButton.styleFrom(
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             side: BorderSide(color: Colors.blue.shade300),
//                             foregroundColor: Colors.blue.shade700,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: OutlinedButton.icon(
//                           onPressed: () => _showDeleteConfirm(context, ref),
//                           icon: const Icon(Icons.delete_outline, size: 20),
//                           label: const Text('Xóa'),
//                           style: OutlinedButton.styleFrom(
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             side: BorderSide(color: Colors.red.shade300),
//                             foregroundColor: Colors.red.shade700,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],

//                 SizedBox(height: MediaQuery.of(context).padding.bottom + 8),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildOwnerMenu(BuildContext context, WidgetRef ref) {
//     return PopupMenuButton<String>(
//       icon: Icon(Icons.more_vert, color: Colors.grey.shade600),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       onSelected: (value) {
//         if (value == 'edit') _showEditSheet(context);
//         if (value == 'delete') _showDeleteConfirm(context, ref);
//       },
//       itemBuilder: (context) => [
//         const PopupMenuItem(
//           value: 'edit',
//           child: Row(
//             children: [
//               Icon(Icons.edit_outlined, size: 20),
//               SizedBox(width: 12),
//               Text('Chỉnh sửa'),
//             ],
//           ),
//         ),
//         PopupMenuItem(
//           value: 'delete',
//           child: Row(
//             children: [
//               Icon(Icons.delete_outline, size: 20, color: Colors.red.shade700),
//               const SizedBox(width: 12),
//               Text('Xóa', style: TextStyle(color: Colors.red.shade700)),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   void _showEditSheet(BuildContext context) {
//     Navigator.pop(context);
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) => EditIncidentBottomSheet(incident: incident),
//     );
//   }

//   void _showDeleteConfirm(BuildContext context, WidgetRef ref) {
//     showDialog(
//       context: context,
//       builder: (dialogContext) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         title: const Row(
//           children: [
//             Icon(Icons.warning_amber_rounded, color: Colors.red),
//             SizedBox(width: 12),
//             Text('Xác nhận xóa'),
//           ],
//         ),
//         content: const Text(
//           'Bạn có chắc muốn xóa sự cố này?\nHành động này không thể hoàn tác.',
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(dialogContext),
//             child: const Text('Hủy'),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               Navigator.pop(dialogContext);
//               Navigator.pop(context);

//               final currentUser = ref.read(authProvider);
//               final success = await ref
//                   .read(mapPageNotifierProvider.notifier)
//                   .deleteIncident(incident.id, currentUser);

//               if (context.mounted) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(
//                       success
//                           ? 'Đã xóa sự cố!'
//                           : 'Không thể xóa. Vui lòng thử lại.',
//                     ),
//                     backgroundColor: success ? Colors.green : Colors.red,
//                     behavior: SnackBarBehavior.floating,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                 );
//               }
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.red,
//               foregroundColor: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: const Text('Xóa'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// Chip hiển thị severity
// class _SeverityChip extends StatelessWidget {
//   final String severity;

//   const _SeverityChip({required this.severity});

//   @override
//   Widget build(BuildContext context) {
//     final (color, icon, label) = switch (severity.toLowerCase()) {
//       'high' => (Colors.red, Icons.error, 'Nghiêm trọng'),
//       'medium' => (Colors.orange, Icons.warning_amber, 'Trung bình'),
//       'low' => (Colors.green, Icons.check_circle, 'Nhẹ'),
//       _ => (Colors.grey, Icons.help_outline, severity),
//     };

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//       decoration: BoxDecoration(
//         color: color.withValues(alpha: 0.1),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: color.withValues(alpha: 0.3)),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, size: 16, color: color),
//           const SizedBox(width: 6),
//           Text(
//             label,
//             style: TextStyle(
//               color: color,
//               fontWeight: FontWeight.w600,
//               fontSize: 13,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// Card hiển thị thông tin
// class _InfoCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String content;
//   final bool compact;

//   const _InfoCard({
//     required this.icon,
//     required this.title,
//     required this.content,
//     this.compact = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(compact ? 12 : 16),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade50,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade200),
//       ),
//       child: Row(
//         crossAxisAlignment: compact
//             ? CrossAxisAlignment.center
//             : CrossAxisAlignment.start,
//         children: [
//           Icon(icon, size: compact ? 18 : 20, color: Colors.grey.shade600),
//           SizedBox(width: compact ? 8 : 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: compact ? 11 : 12,
//                     color: Colors.grey.shade500,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 SizedBox(height: compact ? 2 : 4),
//                 Text(
//                   content,
//                   style: TextStyle(
//                     fontSize: compact ? 13 : 14,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.grey.shade800,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
