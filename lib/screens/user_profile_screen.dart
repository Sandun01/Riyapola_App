import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double iconsize =35;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _username;
  late bool _passwordVisible = true;
  void initState() {
    _passwordVisible = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width,(MediaQuery.of(context).size.width).toDouble()),
              painter: RPSCustomPainter(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // decoration: BoxDecoration(
                    //   image: const DecorationImage(
                    //       fit: BoxFit.fill,
                    //       image: AssetImage('assets/images/Vector 5.png')),
                    // ),
                    child: ListTile(
                      contentPadding: EdgeInsets.only(left: 30.0,top: 50.0,right:30.0,bottom: 20.0),
                      leading: Icon( Icons.account_circle_rounded, color:Colors.white,size: 50.0),
                      title: Text(
                        'Ayodhya Ratnayake',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Welcome to Riyapola',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
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
                                child: Text("Logout",style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: Colors.red.shade900),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:20.0,top:0.0,right: 20.0,bottom: 0.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 5),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                icon: const Icon(Icons.person,color: Colors.black),
                                hintText: 'Full Name',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                labelText: "Full Name",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Usename cannot be empty';
                                }
                                return null;
                              },
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              onSaved: (value){
                                _username = value.toString();
                              },
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                icon: const Icon(Icons.mobile_friendly,color: Colors.black),
                                hintText: 'Mobile Number',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                labelText: "Mobile Number",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Usename cannot be empty';
                                }
                                return null;
                              },
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              onSaved: (value){
                                _username = value.toString();
                              },
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                icon: const Icon(Icons.email,color: Colors.black),
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Usename cannot be empty';
                                }
                                return null;
                              },
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              onSaved: (value){
                                _username = value.toString();
                              },
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              // controller: _userPasswordController,
                              obscureText: !_passwordVisible,//This will obscure text dynamically
                              decoration: const InputDecoration(
                                icon: const Icon(Icons.password,color: Colors.black),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                // suffixIcon: Icon(Icons.visibility),
                                // suffixIcon: IconButton(
                                //   icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off,
                                //     // color: Theme.of(context).primaryColorDark,
                                //   ),
                                //   onPressed: () {
                                //     setState(() {
                                //       _passwordVisible = !_passwordVisible;
                                //     }),
                                //   },
                                // ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Password cannot be empty';
                                }
                                else if (value.length < 6) {
                                  return 'Password must be more than 6 characters';
                                }
                                return null;
                              },
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              //
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              // controller: _userPasswordController,
                              obscureText: !_passwordVisible,//This will obscure text dynamically
                              decoration: const InputDecoration(
                                icon: const Icon(Icons.password,color: Colors.black),
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                labelText: "Confirm Password",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                // suffixIcon: Icon(Icons.visibility),
                                // suffixIcon: IconButton(
                                //   icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off,
                                //     // color: Theme.of(context).primaryColorDark,
                                //   ),
                                //   onPressed: () {
                                //     setState(() {
                                //       _passwordVisible = !_passwordVisible;
                                //     }),
                                //   },
                                // ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Password cannot be empty';
                                }
                                else if (value.length < 6) {
                                  return 'Password must be more than 6 characters';
                                }
                                return null;
                              },
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              //
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              // controller: _userPasswordController,
                              obscureText: !_passwordVisible,//This will obscure text dynamically
                              decoration: const InputDecoration(
                                icon: const Icon(Icons.password,color: Colors.black),
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                labelText: "Confirm Password",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                // suffixIcon: Icon(Icons.visibility),
                                // suffixIcon: IconButton(
                                //   icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off,
                                //     // color: Theme.of(context).primaryColorDark,
                                //   ),
                                //   onPressed: () {
                                //     setState(() {
                                //       _passwordVisible = !_passwordVisible;
                                //     }),
                                //   },
                                // ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Password cannot be empty';
                                }
                                else if (value.length < 6) {
                                  return 'Password must be more than 6 characters';
                                }
                                return null;
                              },
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              //
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 125, 197, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path_0 = Path();
    path_0.moveTo(0,size.height*0.4);
    path_0.quadraticBezierTo(size.width*0.85,size.height*0.38,size.width,size.height*0.9);
    path_0.lineTo(size.width,0);
    path_0.lineTo(0,0);
    path_0.quadraticBezierTo(0,size.height,0,size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


    Paint paint_1 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path_1 = Path();
    path_1.moveTo(0,size.height*0.3);
    path_1.quadraticBezierTo(size.width*0.9,size.height*0.3,size.width,size.height*0.9);
    path_1.lineTo(size.width,0);
    path_1.lineTo(0,0);
    path_1.quadraticBezierTo(0,size.height,0,size.height);
    path_1.close();

    canvas.drawPath(path_1, paint_1);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
