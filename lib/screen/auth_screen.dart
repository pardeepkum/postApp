import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_cubit.dart';
import '../bloc/auth_state.dart';
import 'home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final usernameController = TextEditingController();

  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(isLogin ? 'Login' : 'Sign Up',
          )),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen(username: state.user.username)),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isLogin)
                  Text('Name'),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(hintText: 'UserName',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        focusColor: Colors.black
                    ),
                  ),
                Text('Email'),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: 'Email',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      focusColor: Colors.black
                  ),
                ),
                Text('Email'),
                TextField(
                  controller: passController,
                  decoration: InputDecoration(hintText: 'Password',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      focusColor: Colors.black
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    child: Text(isLogin ? 'Login' : 'Sign Up'),
                    onPressed: () {
                      if (isLogin) {
                        authCubit.login(emailController.text, passController.text);
                      } else {
                        authCubit.signUp(
                          emailController.text,
                          passController.text,
                          usernameController.text,
                        );
                      }
                    },
                  ),
                ),
                Center(
                  child: TextButton(
                    child: Text(isLogin
                        ? 'Don\'t have an account? Sign up'
                        : 'Already have an account? Login'),
                    onPressed: () {
                      setState(() => isLogin = !isLogin);
                    },
                  ),
                ),
                if (state is AuthLoading) CircularProgressIndicator(),
              ],
            ),
          );
        },
      ),
    );
  }
}
