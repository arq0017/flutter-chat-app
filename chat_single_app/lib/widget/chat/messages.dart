import 'package:chat_single_app/widget/chat/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('time', descending: true)
            .snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapShot) {
          if (chatSnapShot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          final document = chatSnapShot.data!.docs;
          return ListView.builder(
            reverse: true,
            itemCount: document.length,
            itemBuilder: (ctx, index) {
              var obtainedUserId = document[index]['userId'];
              var currentUser = FirebaseAuth.instance.currentUser!.uid;
              bool isMe = obtainedUserId == currentUser ? true : false;
              return MessageBubble(
                isMe,
                document[index]['text'],
                document[index]['username'],
                ValueKey(document[index].id),
              );
            },
          );
        });
  }
}
