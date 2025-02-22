// import 'package:flutter/material.dart';
// import 'package:myapp/signUp.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF5F8F83),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 SizedBox(height: 20),
//                 // Logo
//                 Text(
//                   'Sneh',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 40,
//                     fontFamily: 'Script',
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 Text(
//                   'The Essence of Care and Health',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 // Login Card
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   padding: EdgeInsets.all(20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Text(
//                         'Welcome',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       // Name Input
//                       TextField(
//                         controller: _nameController,
//                         decoration: InputDecoration(
//                           hintText: 'Enter your Name',
//                           prefixIcon: Icon(Icons.person_outline),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(
//                               color: Colors.grey[300]!,
//                               width: 1,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(
//                               color: Colors.grey[300]!,
//                               width: 1,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       // Phone Input
//                       Row(
//                         children: [
//                           Expanded(
//                             child: TextField(
//                               controller: _phoneController,
//                               keyboardType: TextInputType.phone,
//                               decoration: InputDecoration(
//                                 hintText: 'Phone Number',
//                                 prefixIcon: Icon(Icons.phone),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     color: Colors.grey[300]!,
//                                     width: 1,
//                                   ),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     color: Colors.grey[300]!,
//                                     width: 1,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 10),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                   builder: (context) => LoginScreenOTP(),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               'Verify',
//                               style: TextStyle(
//                                 color: Color(0xFF5F8F83),
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 30),
//                       // Login Button
//                       ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF5F8F83),
//                           padding: EdgeInsets.symmetric(vertical: 15),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: Text(
//                           'Log in',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       // Create Account Link
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Don't have an account? ",
//                             style: TextStyle(
//                               color: Colors.grey[600],
//                               fontSize: 14,
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                   builder: (context) => SignupPage(),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               'Create',
//                               style: TextStyle(
//                                 color: Color(0xFF5F8F83),
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _phoneController.dispose();
//     super.dispose();
//   }
// }
import 'package:flutter/material.dart';
import 'package:myapp/auth/auth_exceptions.dart';
import 'package:myapp/bloc/auth_bloc.dart';
import 'package:myapp/bloc/auth_event.dart';
import 'package:myapp/bloc/auth_state.dart';
// Import the new OTP verification page
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
       listener: (context, state) async {
        if (state is AuthStateLoggedOut) {
          if (state.exception is UserNotFoundAuthException) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('User not found'),
              ),
            );
          } else if (state.exception is WrongPasswordAuthException) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Wrong password'),
              ),
            );
          } else if (state.exception is GenericAuthException) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('An error occurred'),
              ),
            );
          }
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFF5F8F83),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  // Logo
                  Text(
                    'Sneh',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'Script',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'The Essence of Care and Health',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 30),
                  // Login Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        // Email Input
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter your Email',
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey[300]!,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey[300]!,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
      
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter your Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey[300]!,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey[300]!,
                                width: 1,
                              ),
                            ),
                          ),
                          
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(AuthEventRegister(_emailController.text, _passwordController.text,));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF5F8F83),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Create Account Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<AuthBloc>().add(AuthEventShouldRegister());
                              },
                              child: Text(
                                'Create',
                                style: TextStyle(
                                  color: Color(0xFF5F8F83),
                                  fontWeight: FontWeight.w500,
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

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}