import 'package:flutter/material.dart';

const String URL =
    'https://www.google.com/search?q=background+image+flutter&rlz=1C1CHBD_enLK923LK923&sxsrf=AOaemvJX8c_Qgl3iat8CCyyVh0aOs0rwJg:1632165366641&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiqmJLnoY7zAhVDWH0KHRgFAqQQ_AUoAXoECAEQAw&biw=1270&bih=1030&dpr=1.25#imgrc=zuaP7nP1p0KUvM';

class Feedbacks extends StatefulWidget {
  const Feedbacks({Key? key}) : super(key: key);

  @override
  _FeedbacksState createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/Vector 5.png')),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(30.0),
              leading: Icon(Icons.account_circle_outlined, size: 50.0),
              subtitle: Text(
                'Aydoya Ratnayake',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              title: Text(
                'seller profile',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: double.infinity,
            height: 110.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              readOnly: true,
              initialValue: "Ayodya",
              decoration: const InputDecoration(
                icon: const Icon(Icons.person_outline_outlined,
                    color: Colors.black),
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                labelText: "Full Name",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              style: TextStyle(
                color: Colors.black,
              ),
              onSaved: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              readOnly: true,
              initialValue: "dsfsdf",
              decoration: const InputDecoration(
                icon: const Icon(Icons.mobile_friendly_outlined,
                    color: Colors.black),
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                labelText: "Mobile Number",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              style: TextStyle(
                color: Colors.black,
              ),
              onSaved: (value) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              readOnly: true,
              initialValue: "blablabla@blabla.blabla",
              decoration: const InputDecoration(
                icon: const Icon(Icons.email_outlined, color: Colors.black),
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
              style: TextStyle(
                color: Colors.black,
              ),
              onSaved: (value) {},
            ),
          ),
        ],
      ),
    ));
  }
}
