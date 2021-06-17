import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  @override
  _NewMessagesState createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  var _enteredMessage = '';
  var _msgController = TextEditingController();
  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    var user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    FirebaseFirestore.instance.collection('chat').add({
      'text': _enteredMessage,
      'time': Timestamp.now(),
      'userId': user.uid,
      'username': userData['username'],
    });
    _msgController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.all(9),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
                controller: _msgController,
                decoration: InputDecoration(labelText: 'Send a message...'),
                onChanged: (value) {
                  setState(() {
                    _enteredMessage = value;
                  });
                }),
          ),
          IconButton(
              color: Theme.of(context).primaryColor,
              onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
              icon: Icon(Icons.send))
        ],
      ),
    );
  }
}
