import 'package:chat_single_app/screen/auth_screen.dart';
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
                    primarySwatch: Colors.blue,
                    primaryColor: Colors.red[700],
                    accentColor: Color(0xFFE7622F),
                    cardColor: Colors.black,
                  ),
                  home: AuthScreen(),
                )
              : Center(child: CircularProgressIndicator()),
    );
  }
}
