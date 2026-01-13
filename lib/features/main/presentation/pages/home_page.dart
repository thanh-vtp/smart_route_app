// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Smart Route App',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 'Plan your routes intelligently',
//                 style: TextStyle(color: Colors.white70, fontSize: 16),
//               ),
//               const SizedBox(height: 32),
//               Expanded(
//                 child: GridView.count(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 16,
//                   mainAxisSpacing: 16,
//                   children: [
//                     _buildFeatureCard(
//                       context,
//                       icon: Icons.map,
//                       title: 'Smart Map',
//                       description: 'Interactive map with real-time data',
//                       onTap: () => context.go('/map'),
//                     ),
//                     _buildFeatureCard(
//                       context,
//                       icon: Icons.route,
//                       title: 'Route Planning',
//                       description: 'Plan optimal routes',
//                       onTap: () {
//                         // TODO: Implement route planning
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Route planning coming soon!'),
//                           ),
//                         );
//                       },
//                     ),
//                     _buildFeatureCard(
//                       context,
//                       icon: Icons.traffic,
//                       title: 'Traffic Info',
//                       description: 'Real-time traffic updates',
//                       onTap: () {
//                         // TODO: Implement traffic info
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Traffic info coming soon!'),
//                           ),
//                         );
//                       },
//                     ),
//                     _buildFeatureCard(
//                       context,
//                       icon: Icons.analytics,
//                       title: 'Analytics',
//                       description: 'Route performance analytics',
//                       onTap: () {
//                         // TODO: Implement analytics
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Analytics coming soon!'),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildFeatureCard(
//     BuildContext context, {
//     required IconData icon,
//     required String title,
//     required String description,
//     required VoidCallback onTap,
//   }) {
//     return Card(
//       color: const Color(0xFF1E1E1E),
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(12),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, size: 48, color: Colors.blue),
//               const SizedBox(height: 12),
//               Text(
//                 title,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 description,
//                 style: const TextStyle(color: Colors.white70, fontSize: 14),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
