// // import 'package:flutter/material.dart';
// // import 'package:myapp/dash.dart'; // Import your home screen

// // class EmailVerificationPage extends StatefulWidget {
// //   final String email;

// //   EmailVerificationPage({required this.email});

// //   @override
// //   _EmailVerificationPageState createState() => _EmailVerificationPageState();
// // }

// // class _EmailVerificationPageState extends State<EmailVerificationPage> {
// //   final TextEditingController _otpController = TextEditingController();
// //   final String _correctOtp = "123456"; // Simulated correct OTP

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Email Verification'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(20.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(
// //               'Enter the OTP sent to ${widget.email}:',
// //               style: TextStyle(fontSize: 18),
// //               textAlign: TextAlign.center,
// //             ),
// //             SizedBox(height: 20),
// //             TextField(
// //               controller: _otpController,
// //               decoration: InputDecoration(
// //                 hintText: 'Enter OTP',
// //                 border: OutlineInputBorder(),
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () {
// //                 if (_otpController.text == _correctOtp) {
// //                   // Navigate to Home Screen if OTP is correct
// //                   Navigator.of(context).pushReplacement(
// //                     MaterialPageRoute(builder: (context) => HomeScreen(username: '',)),
// //                   );
// //                 } else {
// //                   // Show error message if OTP is incorrect
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     SnackBar(content: Text('Incorrect OTP. Please try again.')),
// //                   );
// //                 }
// //               },
// //               child: Text('Verify OTP'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:myapp/dash.dart'; // Import your home screen

// class OtpVerificationPage extends StatefulWidget {
//   final String email;

//   OtpVerificationPage({required this.email});

//   @override
//   _OtpVerificationPageState createState() => _OtpVerificationPageState();
// }

// class _OtpVerificationPageState extends State<OtpVerificationPage> {
//   final TextEditingController _otpController = TextEditingController();
//   final String _correctOtp = "123456"; // Simulated correct OTP

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('OTP Verification'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Enter the OTP sent to ${widget.email}:',
//               style: TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _otpController,
//               decoration: InputDecoration(
//                 hintText: 'Enter OTP',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 if (_otpController.text == _correctOtp) {
//                   // Navigate to Home Screen if OTP is correct
//                   Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(builder: (context) => HomeScreen()),
//                   );
//                 } else {
//                   // Show error message if OTP is incorrect
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Incorrect OTP. Please try again.')),
//                   );
//                 }
//               },
//               child: Text('Verify OTP'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }