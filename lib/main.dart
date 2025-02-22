
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as flutter_gen;
import 'package:myapp/auth/firebase_auth_provider.dart';
import 'package:myapp/bloc/auth_bloc.dart';
import 'package:myapp/bloc/auth_event.dart';
import 'package:myapp/bloc/auth_state.dart';
import 'package:myapp/dash.dart';
import 'package:myapp/email_verification.dart';
import 'package:myapp/forgot_password_view.dart';
import 'package:myapp/loading_screen.dart';
import 'package:myapp/login.dart';
import 'package:myapp/signUp.dart';
import 'package:myapp/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Firebase is initialized properly
  runApp(
    BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(FirebaseAuthProvider())..add(AuthEventInitialize()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.transparent,
          ),
          supportedLocales: flutter_gen.AppLocalizations.supportedLocales,
          localizationsDelegates: flutter_gen.AppLocalizations.localizationsDelegates,
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      },
    );
  }
}


class GradientBackground extends StatelessWidget {
  final Widget child;
  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(96, 149, 145, 100), // Top color
            Color.fromRGBO(54, 84, 81, 100),
            Color.fromRGBO(36, 60, 58, 100) // Bottom color
          ],
          stops: [
            0.4,  // Red covers the first 50%
            0.8,  // Blue covers 30% (from 50% to 80%)
            1.0,  // Green covers the last 20% (from 80% to 100%)
          ],
        ),
      ),
      child: child, // Wrap the actual page content
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen().show(
            context: context,
            text: state.loadingText ?? 'Please wait a moment',
          );
        } else {
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
        if (state is AuthStateOnboarding) {
          return const Splashscreen();
        } else if (state is AuthStateOnboardingComplete) {
          return LoginScreen();
        } else if (state is AuthStateLoggedIn) {
          return HomeScreen(authUser: state.user);
        } else if (state is AuthStateNeedsVerification) {
          return EmailVerificationPage();
        } else if (state is AuthStateLoggedOut) {
          return LoginScreen();
        } else if (state is AuthStateForgotPassword) {
          return const ForgotPasswordView();
        } else if (state is AuthStateRegistering) {
          return SignupPage();
        } else {
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

