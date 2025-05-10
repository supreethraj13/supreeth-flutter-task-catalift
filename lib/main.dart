import 'package:catalift_assignment/firebase_options.dart';
import 'package:catalift_assignment/provider/auth_provider.dart';
import 'package:catalift_assignment/screen/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main () async {
  runApp(const MainApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MaterialApp(
        title: 'Catalift',
        home: loginscreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
