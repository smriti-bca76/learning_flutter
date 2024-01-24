import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/screens/sign_in/block/sign_in_block.dart';
import 'package:form_validation/screens/sign_in/sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 225, 234, 236),
        title: Text(
          'Welcome Screen',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => SignInBloc(),
                        child: SignInScreen(),
                      )),
            );
            // Handle sign-in with email
            print('Sign In with Email Pressed!');
          },
          child: Text(
            'Sign In with Email',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
