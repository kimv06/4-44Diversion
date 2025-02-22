import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/auth_bloc.dart';
import 'package:myapp/bloc/auth_state.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateForgotPassword) {
          if (state.hasSentEmail) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Password reset email sent!'),
              ),
            );
          } else if (state.exception != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: ${state.exception}'),
              ),
            );
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Forgot Password'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Send password reset email
                },
                child: Text('Send Reset Email'),
              ),
            ],
          ),
        ),
        
      ),
    );
  }
}