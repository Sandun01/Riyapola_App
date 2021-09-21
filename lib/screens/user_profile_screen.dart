import 'package:flutter/material.dart';

const double iconsize = 30;

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height.toDouble()),
            painter: RPSCustomPainter(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(30.0),
                    leading: Icon(Icons.account_circle_outlined,
                        color: Colors.white, size: 50.0),
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 75,
                        height:90,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle_outline,
                                size: iconsize,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text("Post Ad",style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 75,
                        height:90,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.near_me_outlined,
                                size: iconsize,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text("My Ads",style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 75,
                        height:90,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.account_circle_outlined,
                                size: iconsize,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text("Edit Profile",style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 75,
                        height:90,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.power_settings_new_outlined,
                                size: iconsize,
                                color: Colors.red.shade900,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text("Logout",style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
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
                      icon:
                          const Icon(Icons.email_outlined, color: Colors.black),
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
          )
        ],
      ),
    ));
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
    path_0.moveTo(0, size.height * 0.33);
    path_0.quadraticBezierTo(size.width * 0.7371429, size.height * 0.2772917,
        size.width, size.height * 0.7);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.quadraticBezierTo(
        0, size.height * 0.0822917, 0, size.height * 0.2541667);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

    Paint paint_1 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_1 = Path();
    path_1.moveTo(0, size.height * 0.25);
    path_1.quadraticBezierTo(size.width * 0.7785714, size.height * 0.2327083,
        size.width, size.height * 0.7);
    path_1.lineTo(size.width, 0);
    path_1.lineTo(0, 0);
    path_1.quadraticBezierTo(
        0, size.height * 0.0610417, 0, size.height * 0.1908333);
    path_1.close();

    canvas.drawPath(path_1, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
