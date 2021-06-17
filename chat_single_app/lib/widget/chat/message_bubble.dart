
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class MessageBubble extends StatelessWidget {
  final bool isMe;
  final Key key;
  final String message;
  final String userName;
  MessageBubble(
      this.isMe, this.message, this.userName,  this.key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 0,
        left: 120,
        child: CircleAvatar(),
      ),
      Bubble(
        stick: true,
        key: key,
        color: isMe ? Colors.grey[50] : Colors.black,
        margin: BubbleEdges.all(10),
        elevation: 5,
        alignment: isMe ? Alignment.topRight : Alignment.topLeft,
        nip: isMe ? BubbleNip.rightTop : BubbleNip.leftTop,
        child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                '@' + userName,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
              Text(message,
                  style: TextStyle(
                    color: isMe ? Colors.black : Colors.white,
                  )),
            ]),
      ),
    ]);
  }
}
