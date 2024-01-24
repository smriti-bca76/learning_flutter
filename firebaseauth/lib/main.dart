import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseauth/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebaseauth/cubits/auth_cubit.dart';
import 'package:firebaseauth/cubits/auth_state.dart';
import 'package:firebaseauth/screens/home_screen.dart';
import 'package:firebaseauth/screens/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (oldstate, newstate) {
            return oldstate is AuthInitialState;
          },
          builder: (context, state) {
            if (state is AuthLoggedInState) {
              return HomeScreen();
            } else if (state is AuthLoggedOutState) {
              return SignInScreen();
            } else {
              return Scaffold();
            }
          },
        ),
      ),
    );
  }
}
