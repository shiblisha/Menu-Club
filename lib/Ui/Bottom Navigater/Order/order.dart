import 'package:flutter/material.dart';
import 'package:menu_club/Ui/Bottom%20Navigater/Order/canceled.dart';

import 'Pending.dart';
import 'completted.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

int position = 0;
List <Widget>screens=[
  PendingPage(),
  ComplettedPage(),
  CanceledPage()
];
class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: mwidth * 0.06),
          child: Text(
            'Order History',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: mwidth * 0.085,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    position = 0;
                  });
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => PendingPage()));
                },
                child: Text("Pending",
                    style: position == 0
                        ? TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.red)
                        : TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
              ),
              SizedBox(
                width: mwidth * 0.085,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    position = 1;
                  });
                  // Navigator.push(context,
                  // MaterialPageRoute(builder: (context) => ComplettedPage()));
                },
                child: Text("Completed",
                    style: position == 1
                        ? TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.red)
                        : TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
              ),
              SizedBox(
                width: mwidth * 0.085,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    position = 2;
                  });
                  // Navigator.push(context,
                  // MaterialPageRoute(builder: (context) => CanceledPage()));
                },
                child: Text("Canceled",
                    style: position == 2
                        ? TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.red)
                        : TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
              ),
            ],
          ),Expanded(child: screens[position])
        ]
      ),
    );
  }
}
