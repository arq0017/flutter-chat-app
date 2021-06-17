
import 'package:chat_single_app/widget/auth/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  //! parameters
  final auth = FirebaseAuth.instance;
  var isLoading = false;

  //! methods
  void _submitAuthForm(
    String email,
    String username,
    String password,
    // is Login :: true - authentication : false - create Account
    bool isLogin,
    BuildContext context,
  ) async {
    var result;
    try {
      setState(() {
        isLoading = true;
      });

      if (isLogin) {
        result = await auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        result = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        User user = result.user;

        // Storing the extra user data
        var users = FirebaseFirestore.instance.collection('users');
        users.doc(user.uid).set({
          'username': username,
          'email': email,
        });
      }
    } on FirebaseAuthException catch (error) {
      var message = "An error occured , please try again ";
      if (error.message != null) {
        message = error.message!;
        print(error.message);
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message.toString()),
        backgroundColor: Theme.of(context).errorColor,
      ));
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthForm(_submitAuthForm, isLoading),
    );
  }
}
