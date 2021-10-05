import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message, this.isSameUser);
  final String message;
  final bool isSameUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isSameUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: isSameUser
                ? Colors.grey[300]
                : Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft:
                    !isSameUser ? Radius.circular(0) : Radius.circular(12),
                bottomRight:
                    isSameUser ? Radius.circular(0) : Radius.circular(12)),
          ),
          width: 140,
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Text(
            message,
            style: TextStyle(
              color: isSameUser ? Colors.black : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
