import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app/repository/auth_repository.dart';
import 'package:post_app/repository/post_repository.dart';
import 'package:post_app/screen/auth_screen.dart';

import 'bloc/auth_cubit.dart';
import 'bloc/post_directory/post_cubit.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authRepo = AuthRepository();
  final postRepo = PostRepository();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => AuthCubit(authRepo)),
        BlocProvider<PostCubit>(create: (_) => PostCubit(postRepo)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Social App',
        home: AuthScreen(),
      ),
    );
  }
}

//
// {
// "name": "functions",
// "scripts": {
// "lint": "eslint --ext .js,.ts .",
// "build": "tsc",
// "build:watch": "tsc --watch",
// "serve": "npm run build && firebase emulators:start --only functions",
// "shell": "npm run build && firebase functions:shell",
// "start": "npm run shell",
// "deploy": "firebase deploy --only functions",
// "logs": "firebase functions:log"
// },
// "engines": {
// "node": "22"
// },
// "main": "lib/index.js",
// "dependencies": {
// "firebase-admin": "^13.2.0",
// "firebase-functions": "^4.4.1"
// },
// "devDependencies": {
// "@typescript-eslint/eslint-plugin": "^5.12.0",
// "@typescript-eslint/parser": "^5.12.0",
// "eslint": "^8.9.0",
// "eslint-config-google": "^0.14.0",
// "eslint-plugin-import": "^2.25.4",
// "firebase-functions-test": "^3.4.1",
// "typescript": "^4.9.0"
// },
// "private": true
// }