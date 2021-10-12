import 'package:flutter/material.dart';

class HomeAdvertisementButton extends StatefulWidget {
  final String id, addTitle, location, price, addImage;

  HomeAdvertisementButton({
    Key? key,
    required this.id,
    required this.addTitle,
    required this.price,
    required this.location,
    required this.addImage,
  }) : super(key: key);

  @override
  _HomeAdvertisementButtonState createState() =>
      _HomeAdvertisementButtonState();
}

class _HomeAdvertisementButtonState extends State<HomeAdvertisementButton> {
  // String _id = "123";
  // String _title = "Tesla - Model 3";
  // String _price = "2000 0000";
  // String _location = "Colombo";

  //on click
  void _hadleClick(BuildContext ctx) {
    // print("hadle Click add");
    print(widget.id);
    Navigator.of(ctx).pushNamed(
      '/view-add',
      arguments: {
        'id': widget.id,
        'title': widget.addTitle,
        'price': widget.price,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _hadleClick(context),
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
                widget.addTitle,
                style: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 20,
                  // fontFamily: "AguafinaScript",
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
              child: Image.network(widget.addImage),
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
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          child: Text(
                            "Rs." + widget.price,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff304FFE),
                              fontSize: 16.0,
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
                            widget.location,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff304FFE),
                              fontSize: 16.0,
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
