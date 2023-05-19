import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          SizedBox(
            width: mwidth * 0.32,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mheight * 0.02,
              ),
              Text(
                "Order NO",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Text(
                "ORD-125-452541516546516",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              )
            ],
          ),
          SizedBox(
            width: mwidth * 0.02,
          ),
          SizedBox(
            width: mwidth * 0.02,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mheight * 0.02,
            ),
            Container(
              height: mheight,
              width: mwidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: Color(0xffEAEAEA),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mheight * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.35),
                    child: Row(
                      children: [
                        Text("Status: ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15)),
                        Text(
                          "Acepted",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Color(0xffFF0000)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.2),
                    child: Row(
                      children: [
                        Text("ORDER TYPE: ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20)),
                        Text(
                          "Acepted",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Color(0xffFF0000)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.2),
                    child: Row(
                      children: [
                        Text("ORDER TIME: ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20)),
                        Text(
                          "Acepted",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Color(0xffFF0000)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.14),
                    child: Row(
                      children: [
                        Container(
                          height: mheight * 0.04,
                          width: mwidth * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xffFF0000),
                          ),
                          child: Center(
                            child: Text(
                              "Reject",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: mwidth * 0.07,
                        ),
                        Container(
                          height: mheight * 0.04,
                          width: mwidth * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xffFF0000),
                          ),
                          child: Center(
                            child: Text(
                              "Ready to Serve",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.03),
                    child: Text(
                      "Comments",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.03),
                    child: Container(
                        height: mheight * 0.1,
                        width: mwidth * 0.9,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Padding(
                          padding:  EdgeInsets.only(left: mwidth*0.01,top: mheight*0.01,right: mwidth*0.01),
                          child: Text(
                            "The section used mention customers comments about their foods",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        )),
                  ),
                  Expanded(
                    child: ListView.builder(itemCount: 5,
                      itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(height: mheight*0.02,),
                          Container(
                            height: mheight*0.08,
                            width: mwidth*0.9,
                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(28), color: Color(0xffffffff),),
                            child: Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: mwidth*0.035,top: mheight*0.004),
                                  child: Row(
                                    children: [
                                      Text("Meals",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                      SizedBox(width: mwidth*0.55,),
                                      Text("₹60",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: mheight*0.02,),
                                Text("QTY: 2",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600))
                              ],
                            ),
                          ),
                        ],
                      );
                    },),
                  )],
              ),
            )
          ],
        ),
      ),
    );
  }
}
