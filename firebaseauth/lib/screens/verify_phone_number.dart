import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebaseauth/cubits/auth_cubit.dart';
import 'package:firebaseauth/cubits/auth_state.dart';
import 'package:firebaseauth/screens/home_screen.dart';

class VerifyPhoneNumberScreen extends StatelessWidget {
  TextEditingController otpController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Verify phone number"),
        ),
        body: SafeArea(
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: otpController,
                    maxLength: 6,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "6-Digit-OTP",
                        counterText: ""),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                    if (state is AuthLoggedInState) {
                      Navigator.popUntil(context, (route) => route.isFirst);
                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => HomeScreen()));
                    } else if (state is AuthErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(state.error),
                        duration: Duration(milliseconds: 600),
                      ));
                    }
                  }, builder: (context, State) {
                    if (State is AuthLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CupertinoButton(
                        onPressed: () {
                          BlocProvider.of<AuthCubit>(context)
                              .verifyOTP(otpController.text);
                        },
                        color: Colors.blue,
                        child: Text('Verify'),
                      ),
                    );
                  })
                ],
              ),
            )
          ]),
        ));
  }
}
