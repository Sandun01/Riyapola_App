import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riyapola_app/widgets/chat/message_bubble.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (ctx, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('chat')
                .orderBy('createdAt', descending: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final documents = snapshot.data!.docs;
              User? user = FirebaseAuth.instance.currentUser;
              return ListView.builder(
                reverse: true,
                itemCount: documents.length,
                itemBuilder: (ctx, index) => MessageBubble(
                  documents[index]['text'],
                  documents[index]['userId'],
                  documents[index]['userId'] == user?.uid,
                  // key: ValueKey(documents[index].documentID),
                ),
              );
            });
      },
    );
  }
}
