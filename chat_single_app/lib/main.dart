import 'package:chat_single_app/screen/auth_screen.dart';
import 'package:chat_single_app/screen/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.done
              ? MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  darkTheme: ThemeData(
                    brightness: Brightness.dark,
                    accentColor: Colors.blue,
                    primaryColor: Colors.red,
                    primarySwatch: Colors.amber,
                    cardColor: Colors.black,
                  ),
                  home: StreamBuilder(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (ctx, snapshot) {
                        if (snapshot.hasData) return ChatScreen();
                        return AuthScreen();
                      }),
                )
              : Center(child: CircularProgressIndicator()),
    );
  }
}
