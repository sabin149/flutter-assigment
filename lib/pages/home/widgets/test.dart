// Scaffold(
      
//       appBar: AppBar(
       
//         title: Text('Settings'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 40)),
//               onPressed: () {
//                  Provider.of<ThemeProvider>(context, listen: false).swapTheme();
//               },
//               icon: const Icon(
//                Icons.brightness_6,
//                 size: 28,
//               ),
//               label: const Text(
//                 "Dark Mode",
//                 style: TextStyle(fontSize: 20),
//               ), 
//             ),
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 40)),
//               onPressed: () async {
//                     var res = await HttpConnectUser.logout();
//                     if (res) {
//                       Navigator.pushNamed(context, '/login');
//                       MotionToast.success(
//                               description: const Text('Logout Successfully'))
//                           .show(context);
//                     } else {
//                       MotionToast.error(
//                               description: const Text(' Failed to logout'))
//                           .show(context);
//                     }
                  
//                 },
              
                 
              
//               icon: const Icon(
//                 Icons.people,
//                 size: 28,
//               ),
//               label: const Text(
//                 "Logout",
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );