import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../widgets//buttons/my_ads_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyAdvertisements extends StatefulWidget {
  const MyAdvertisements({Key? key}) : super(key: key);

  @override
  _MyAdvertisementsState createState() => _MyAdvertisementsState();
}

class _MyAdvertisementsState extends State<MyAdvertisements> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String userID;

  void setUserId() {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    userID = uid;
  }

  // Future<Map> getAdsFromFirebase() async {

  //   CollectionReference ads = _instance!.collection('ads');

  //   DocumentSnapshot snapshot = await ads.doc().get();

  //   var data = snapshot.data() as Map;

  //   return data;
  // }

  @override
  void initState() {
    super.initState();
    setUserId();
  }

  void _onClickPostNewAddButton(BuildContext ctx) {
    print("post new add");
    Navigator.of(ctx).pushNamed(
      '/post-add',
      arguments: {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              bottom: 20.0,
            ),
            child: Text(
              "RiyaPola",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: CustomPaint(
          size: Size(MediaQuery.of(context).size.width,
              (MediaQuery.of(context).size.width).toDouble()),
          painter: RPSCustomPainter(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //post add button
              Container(
                width: double.infinity,
                // alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    top: 30.0,
                  ),
                  child: Text(
                    'My Advertisements',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.transparent,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(offset: Offset(0, -20), color: Colors.white)
                        ],
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: Colors.white,
                        decorationThickness: 4),
                  ),
                ),
              ),

              //list view
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                // color: Colors.amber,
                child: StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection('ads').snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (!snapshot.hasData) {
                      return Text('Loading data ... Please Wait ...');
                    }
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
                    return Column(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return MyAdsButton(
                          id: document.reference.toString(),
                          addTitle: data['title'],
                          description: data['description'],
                          addImage: data['imageUrl'],
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // body:
      // StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection('ads').snapshots(),
      //   builder: (BuildContext context,
      //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
      //     if (!snapshot.hasData) {
      //       return Text('Loading data ... Please Wait ...');
      //     }
      //     if (snapshot.hasError) {
      //       return Text('Something went wrong');
      //     }
      //     return ListView(
      //       children: snapshot.data!.docs.map((DocumentSnapshot document) {
      //         Map<String, dynamic> data =
      //             document.data()! as Map<String, dynamic>;
      //         return ListTile(
      //           title: Text(data['category']),
      //         );
      //       }).toList(),
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onClickPostNewAddButton(context),
        tooltip: 'New Advertisement',
        child: const Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 125, 197, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.4);
    path_0.quadraticBezierTo(
        size.width * 0.85, size.height * 0.38, size.width, size.height * 0.9);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.quadraticBezierTo(0, size.height, 0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

    Paint paint_1 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_1 = Path();
    path_1.moveTo(0, size.height * 0.3);
    path_1.quadraticBezierTo(
        size.width * 0.9, size.height * 0.3, size.width, size.height * 0.9);
    path_1.lineTo(size.width, 0);
    path_1.lineTo(0, 0);
    path_1.quadraticBezierTo(0, size.height, 0, size.height);
    path_1.close();

    canvas.drawPath(path_1, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
