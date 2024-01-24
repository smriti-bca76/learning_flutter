import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/screens/sign_in/block/sign_in_block.dart';
import 'package:form_validation/screens/sign_in/block/sign_in_event.dart';
import 'package:form_validation/screens/sign_in/block/sign_in_state.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 225, 234, 236),
        title: Text("Sign in Screen"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(SignTextChangedEvent(
                      emailController.text, passwordController.text));
                },
                decoration: InputDecoration(
                  hintText: 'Email Address',
                ),
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              TextField(
                controller: passwordController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(SignTextChangedEvent(
                      emailController.text, passwordController.text));
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(
                height: 20,
                width: 20,
              ),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return CupertinoButton(
                    onPressed: () {
                      if (state is SignInValidState) {
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInSubmitted(
                                emailController.text, passwordController.text));
                      }
                    },
                    color:
                        (state is SignInValidState) ? Colors.blue : Colors.grey,
                    child: Text('SignIn'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
