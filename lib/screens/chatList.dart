import 'package:flutter/material.dart';

class my_chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'My Chats';

    //on click
    void _hadleClick(BuildContext ctx) {
      Navigator.of(ctx).pushNamed(
        '/single-chat-view',
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightBlue,
              backgroundImage: AssetImage('assets/images/u1.png'),
            ),
            title: Text(
              'Sadun Lakshitha',
            ),
            subtitle: Text('yeah thats good'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => _hadleClick(context),
          ),
          new Divider(
            height: 1.0,
            indent: 1.0,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightBlue,
              backgroundImage: AssetImage('assets/images/u2.png'),
            ),
            title: Text('Rasitha Ekanayake'),
            subtitle: Text('last price is Rs7899'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => _hadleClick(context),
            onLongPress: () {
              Text('Data');
            },
          ),
          new Divider(
            height: 1.0,
            indent: 1.0,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightBlue,
              backgroundImage: AssetImage('assets/images/u3.png'),
            ),
            title: Text('Ayodhya Wijemanya'),
            subtitle: Text('How much do you have ?'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => _hadleClick(context),
          ),
          new Divider(
            height: 1.0,
            indent: 1.0,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightBlue,
              backgroundImage: AssetImage('assets/images/u4.png'),
            ),
            title: Text(
              'Nilan Nawaloka',
            ),
            subtitle: Text('Interesting'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => _hadleClick(context),
          ),
          new Divider(
            height: 1.0,
            indent: 1.0,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightBlue,
              backgroundImage: AssetImage('assets/images/u1.png'),
            ),
            title: Text('Kumara Dasanayake'),
            subtitle: Text('sorry its not available'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          new Divider(
            height: 1.0,
            indent: 1.0,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightBlue,
              backgroundImage: AssetImage('assets/images/u2.png'),
            ),
            title: Text('Jayantha suga dasa'),
            subtitle: Text('Congratulations'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          new Divider(
            height: 1.0,
            indent: 1.0,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightBlue,
              backgroundImage: AssetImage('assets/images/u3.png'),
            ),
            title: Text('periya Appa'),
            subtitle: Text('Dont play with me okay'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          new Divider(
            height: 1.0,
            indent: 10.0,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightBlue,
              backgroundImage: AssetImage('assets/images/u4.png'),
            ),
            title: Text('Osan Rayan'),
            subtitle: Text('Credit card payment available'),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    );
  }
}
