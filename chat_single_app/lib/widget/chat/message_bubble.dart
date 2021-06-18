import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class MessageBubble extends StatelessWidget {
  final bool isMe;
  final Key key;
  final String message;
  final String userName;
  final String userImage;
  MessageBubble(
      this.isMe, this.message, this.userName, this.userImage, this.key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Bubble(
          stick: true,
          key: key,
          color: isMe ? Colors.grey[300] : Colors.black,
          margin: BubbleEdges.all(10),
          padding: isMe
              ? BubbleEdges.fromLTRB(20, 5, 10, 5)
              : BubbleEdges.fromLTRB(10, 5, 10, 5),
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
        Positioned(
          top: -8,
          left: isMe ? null : 110,
          right: isMe ? 110 : null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
        ),
      ],
    );
  }
}
