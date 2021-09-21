import 'package:flutter/material.dart';

class HomeAdvertisementButton extends StatefulWidget {
  const HomeAdvertisementButton({Key? key}) : super(key: key);

  @override
  _HomeAdvertisementButtonState createState() =>
      _HomeAdvertisementButtonState();
}

class _HomeAdvertisementButtonState extends State<HomeAdvertisementButton> {
  String _title = "Tesla - Model 3";
  String _price = "2000 0000";
  String _location = "Colombo";

  //on click
  void _hadleClick() {
    print("hadle Click add");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _hadleClick,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: const EdgeInsets.only(
          right: 20.0,
          left: 20.0,
          top: 10.0,
          bottom: 10.0,
        ),
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //.
            //.
            //Title
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 30.0,
              ),
              child: Text(
                _title,
                style: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: "AguafinaScript",
                ),
              ),
            ),
            //.
            //.
            //Image
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              // height: 200,
              // color: Colors.amber,
              child: const Image(
                image: AssetImage(
                  'assets/images/tesla-model3.png',
                ),
              ),
            ),
            //.
            //.
            //Price and Location
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
              // color: Colors.amber,
              child: Row(
                children: [
                  //price
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 10.0,
                            // top: 10.0,
                          ),
                          child: Icon(
                            Icons.price_change_outlined,
                            color: Color(0xffB80000),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Rs." + _price,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff304FFE),
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //location
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              // top: 10.0,
                              ),
                          child: Icon(
                            Icons.location_on,
                            color: Color(0xff007000),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20.0,
                          ),
                          child: Text(
                            _location,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff304FFE),
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
