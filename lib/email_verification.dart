import 'package:flutter/material.dart';
import 'package:myapp/bloc/auth_bloc.dart';
import 'package:myapp/bloc/auth_event.dart';
import 'package:provider/provider.dart'; // Import your home screen

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  _EmailVerificationPageState createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final TextEditingController _otpController = TextEditingController();
  final String _correctOtp = "123456"; // Simulated correct OTP

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'A verification mail has been sent to your registered email address.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
           
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthEventSendEmailVerification());
              },
              child: Text('Send Email Verification'),
            ),

            SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              context.read<AuthBloc>().add(AuthEventLogout());
            }, child: Text('Back to Login'))
          ],
        ),
      ),
    );
  }
}