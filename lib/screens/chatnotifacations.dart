import 'package:flutter/material.dart';

class my_notications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Chat Notifications')),
      body: BodyLayout(),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

@override
Widget _myListView(BuildContext context) {
  //on click
  void _hadleClick(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      '/my-chats',
    );
  }

  final titles = [
    'Notification 01',
    'Notification 02',
    'Notification 03',
    'Notification 04',
    'Notification 05',
    'Notification 06',
    'Notification 07',
    'Notification 08',
    'Notification 09'
  ];

  final icons = [
    Icons.notification_important,
    Icons.notification_important,
    Icons.notification_important,
    Icons.notification_important,
    Icons.notification_important,
    Icons.notification_important,
    Icons.notification_important,
    Icons.notification_important,
    Icons.notification_important,
  ];

  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      return Card(
        //                           <-- Card widget
        child: ListTile(
          leading: Icon(
            icons[index],
            color: Colors.yellow.shade600,
          ),
          title: Text(titles[index]),
          onTap: () => _hadleClick(context),
        ),
      );
    },
  );
}
