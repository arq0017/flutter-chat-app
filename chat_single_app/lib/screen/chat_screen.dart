import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat'),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('/chats/XOI1yvWVhY88MLV4MYSf/messages')
                .snapshots(),
            builder: (ctx, AsyncSnapshot<QuerySnapshot> streamSnapShot) {
              if (streamSnapShot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              final documents = streamSnapShot.data!.docs;
              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (ctx, i) => Container(
                  padding: EdgeInsets.all(10),
                  child: Text(documents[i]['text']),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            FirebaseFirestore.instance
                .collection('/chats/XOI1yvWVhY88MLV4MYSf/messages')
                .add({
                  'text' : 'Yahoo' , 
                }); 
          },
        ),
      ),
    );
  }
}
