// import 'package:flutter/material.dart';

// class MainProvider extends ChangeNotifier {
//   void _showDialog(User user) {
//     // show dialog to get user's age and gender
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Enter your age and gender'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               decoration: InputDecoration(labelText: 'Age'),
//               keyboardType: TextInputType.number,
//               onChanged: (value) => user.age = int.tryParse(value),
//             ),
//             TextField(
//               decoration: InputDecoration(labelText: 'Gender'),
//               onChanged: (value) => user.gender = value,
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             child: Text('OK'),
//             onPressed: () {
//               Navigator.pop(context);
//               _saveUsers(); // save user data to local storage
//               _navigateToUserScreen(user); // navigate to user screen
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
