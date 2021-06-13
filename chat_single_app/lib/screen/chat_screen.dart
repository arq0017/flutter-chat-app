import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat'),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, i) => Container(
            padding: EdgeInsets.all(10),
            child: Text('Hello'),
          ),
        ),
      ),
    );
  }
}
