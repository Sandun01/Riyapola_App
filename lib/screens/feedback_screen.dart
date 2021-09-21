import 'package:flutter/material.dart';

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
            child: CustomPaint(
      size: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context)
              .size
              .height
              .toDouble()), 
      painter: RPSCustomPainter(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            // decoration: BoxDecoration(
            //   image: const DecorationImage(
            //       fit: BoxFit.fill,
            //       image: AssetImage('assets/images/Vector 5.png')),
            // ),
            child: ListTile(
              contentPadding: EdgeInsets.all(30.0),
              leading: Icon( Icons.account_circle_outlined, color:Colors.white,size: 50.0),
              subtitle: Text(
                'Aydoya Ratnayake',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              title: Text(
                'seller profile',
                style: TextStyle(
                  color: Colors.white,
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
              initialValue: "0123456789",
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
    )));
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.1942502);
    path_0.quadraticBezierTo(size.width * 0.8689236, size.height * 0.2340715,
        size.width, size.height * 0.9945610);
    path_0.quadraticBezierTo(
        size.width, size.height * 0.7459207, size.width, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.1942502);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
