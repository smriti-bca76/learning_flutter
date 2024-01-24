import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebaseauth/cubits/auth_cubit.dart';
import 'package:firebaseauth/cubits/auth_state.dart';
import 'package:firebaseauth/screens/sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Screen",
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoggedOutState) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(context,
                      CupertinoPageRoute(builder: (context) => SignInScreen()));
                }
              },
              builder: (context, state) {
                return CupertinoButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).logOut();
                  },
                  child: Text("Log Out"),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
