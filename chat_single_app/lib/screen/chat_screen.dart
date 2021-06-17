import 'package:chat_single_app/widget/chat/messages.dart';
import 'package:chat_single_app/widget/chat/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Chat'),
          actions: [
            DropdownButton(
              icon: Icon(
                Icons.more_vert,
              ),
              underline: Container(
                height: 0,
              ),
              dropdownColor: Theme.of(context).accentColor,
              items: [
                DropdownMenuItem(
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.logout_rounded),
                        Text('Logout'),
                      ],
                    ),
                  ),
                  value: 'Logout',
                )
              ],
              onChanged: (itemIdentifier) {
                if (itemIdentifier == 'Logout') {
                  FirebaseAuth.instance.signOut();
                }
              },
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Messages(),
              ),
              NewMessages(),
            ],
          ),
        ),
      ),
    );
  }
}
