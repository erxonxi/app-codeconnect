import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/user/user_bloc.dart';
import 'screens/login/login_screen.dart';
import 'services/user_service.dart';
import 'services/user_service_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserService _userService = UserServiceApi();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(_userService),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const LoginScreen(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
