
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/auth_bloc.dart';
import 'package:myapp/bloc/auth_event.dart';
import 'package:myapp/dash.dart';
import 'package:myapp/extensions/build_context/loc.dart';
import 'package:myapp/main.dart';
import 'package:provider/provider.dart';
// Import the new email verification page

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _password = '';
  String _confirmPassword = '';
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  // Logo
                  Image.asset(
                    'assets/logo2.png', // Add logo to assets
                    height: 80,
                  ),
                  Text(
                    'The Essence of Care and Health',
                    style: TextStyle(color: const Color.fromARGB(255, 234, 206, 255), fontSize: 16),
                  ),
                  SizedBox(height: 30),
                  // White Container
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 226, 231),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          context.loc.helloWorld,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30),
                        // Name TextField
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your Name',
                            prefixIcon: Icon(Icons.person_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        // Email TextField
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            
                            hintText: 'Enter Email',
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        // Password TextField
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          onChanged: (value) {
                            _password = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        // Confirm Password TextField
                        TextField(
                          obscureText: true,
                          onChanged: (value) {
                            _confirmPassword = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        // Email Verification Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigate to Email Verification Page
                             context.read<AuthBloc>().add(AuthEventRegister(_emailController.text  , _passwordController.text,),);
                              
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(255, 230, 226, 231),
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              
                            ),
                            child: Text('Verify Email', 
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Login Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: TextStyle(color: const Color.fromARGB(255, 118, 118, 118)),
                            ),
                            TextButton(
                              onPressed: () {
                              //  context.read<AuthBloc>().add(AuthEventLogout());
                               Navigator.of(context).push(
                                 MaterialPageRoute(builder: (context) => HomeScreen(authUser: null, username: '',)),
                               );
                              },
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 178, 74, 238),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}