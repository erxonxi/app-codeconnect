import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/user/user_bloc.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserError) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is UserLogged) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(
                  title: "CodeConnect",
                ),
              ),
            );
          });
        }

        return Scaffold(
          body: Container(
            color: Colors.grey[300],
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width < 800
                    ? double.infinity
                    : 600,
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Text(
                      'CodeConnect',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 20),
                    Text("Welcome back, you've been missed!",
                        style: Theme.of(context).textTheme.titleMedium),
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(children: [
                          AuthInput(
                            hintText: 'Email',
                            controller: _emailController,
                          ),
                          const SizedBox(height: 20),
                          AuthInput(
                            hintText: 'Password',
                            obscureText: true,
                            controller: _passwordController,
                          ),
                          const SizedBox(height: 20),
                          AuthButton(
                            text: 'Access',
                            onTap: _submitLogin,
                          ),
                        ])),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(
                              title: "CodeConnect",
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Not a member? Sign up',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _submitLogin() {
    final email = _emailController.text;
    final password = _passwordController.text;

    context.read<UserBloc>().add(UserLogin(email, password));
  }
}

class AuthInput extends StatelessWidget {
  final String hintText;
  final bool? obscureText;
  final TextEditingController? controller;

  const AuthInput({
    super.key,
    required this.hintText,
    this.obscureText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: TextField(
          controller: controller,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const AuthButton({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
