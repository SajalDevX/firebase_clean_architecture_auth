import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'AuthBloc.dart';
import 'AuthEvent.dart';
import 'AuthState.dart';
import 'DependencyInjection.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Authentication')),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthInitial) {
              return SignInForm();
            } else if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AuthAuthenticated) {
              return Center(child: Text('Welcome ${state.user.email}'));
            } else if (state is AuthUnauthenticated) {
              return SignInForm();
            } else if (state is AuthError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Column(
      children: [
        TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
        TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password')),
        ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().add(SignInRequested(emailController.text, passwordController.text));
          },
          child: const Text('Sign In'),
        ),
      ],
    );
  }
}
