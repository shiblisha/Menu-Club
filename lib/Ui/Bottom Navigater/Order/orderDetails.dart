import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:menu_club/Bloc/OrderDetailsBloc/order_details_bloc.dart';

import '../../../Repository/ModelClass/OrderDetailsModel.dart';

class OrderDetails extends StatefulWidget {
  final int orderId;
  final String total;
  const OrderDetails({Key? key,required this.orderId,required this.total}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

late OrderDetailsModel orders;

class _OrderDetailsState extends State<OrderDetails> {
  void initState() {
    BlocProvider.of<OrderDetailsBloc>(context)
        .add(FetchOrdersDetails(orderId: widget.orderId));

    super.initState();
  }

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
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          Center(
              child: Text(
            "Order Details",
            style: TextStyle(
                fontFamily: 'title',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Color(0xff000000)),
          )),
          SizedBox(
            width: mwidth * 0.43,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mheight * 0.008,
              ),
              Image.asset(
                "assets/printer.png",
                width: mwidth * 0.08,
              ),
              Text(
                "Print",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'title',
                    color: Color(0xff000000)),
              )
            ],
          ),
          SizedBox(
            width: mwidth * 0.04,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: mwidth * 0.03),
          child: BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
            builder: (context, state) {
              if (state is OrderDetailsBlocLoading) {
                return SizedBox();
              }
              if (state is OrderDetailsBlocLoaded) {
                orders = BlocProvider.of<OrderDetailsBloc>(context).orderModel;

                String isoDate = orders.payload!.data!.createdAt.toString();
                DateTime dateTime = DateTime.parse(isoDate);

                String formattedDateTime =
                    DateFormat('yyyy-MM-dd,  HH:mm').format(dateTime);

                return Padding(
                  padding: EdgeInsets.only(left: mwidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: mheight * 0.01,
                      ),
                      Row(
                        children: [
                          Text(
                            "Oreder :",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'title'),
                          ),
                          Text(
                            orders.payload!.data!.orderUniqueId.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'title'),
                          ),
                          SizedBox(
                            width: mwidth * 0.1,
                          ),
                          Text(
                            "Acepted",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'title',
                                color: Color(0xffF2994A)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: mheight * 0.01,
                      ),
                      Text(
                        formattedDateTime.toString(),
                        style: TextStyle(
                            fontFamily: 'title',
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: mheight * 0.01,
                      ),
                      Text(
                        "Dine in",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: 'title'),
                      ),
                      SizedBox(
                        height: mheight * 0.01,
                      ),
                      Row(
                        children: [
                          Container(
                            height: mheight * 0.06,
                            width: mwidth * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xffFF0000),
                            ),
                            child: Center(
                              child: Text(
                                "Ready to serve",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'title',
                                    color: Color(0xffffffff)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: mwidth * 0.1,
                          ),
                          Container(
                            height: mheight * 0.06,
                            width: mwidth * 0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Color(0xffFF0000))),
                            child: Center(
                              child: Text(
                                "Reject",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'title',
                                    color: Color(0xffFF0000)),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: mheight * 0.04),
                      Container(
                        height: mheight * 0.15,
                        width: mwidth * 0.9,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: EdgeInsets.only(left: mwidth * 0.02),
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              hintText: "Add Comment",
                              hintStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffA7A7A7),
                                  fontFamily: "title"),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mheight * 0.02,
                      ),
                      Text(
                        "Customer Details",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'home',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: mheight * 0.02,
                      ),
                      Row(
                        children: [
                          Text("Name",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'home',
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            width: mwidth * 0.15,
                          ),
                          Text(": ${orders.payload!.data!.customerName}",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'home',
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: mheight * 0.01,
                      ),
                      Row(
                        children: [
                          Text("Table No.",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'home',
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            width: mwidth * 0.09,
                          ),
                          Text(": ${orders.payload!.data!.tableNo}",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'home',
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: mheight * 0.01,
                      ),
                      Row(
                        children: [
                          Text("Contact No",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'home',
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            width: mwidth * 0.06,
                          ),
                          Text(": ${orders.payload!.data!.customerPhone}",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'home',
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: mheight * 0.04,
                      ),
                      Row(
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'home',
                                fontSize: 14),
                          ),
                          SizedBox(
                            width: mwidth * 0.22,
                          ),
                          Text(
                            "Quantity",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'home',
                                fontSize: 14),
                          ),
                          SizedBox(
                            width: mwidth * 0.22,
                          ),
                          Text(
                            "Price",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'home',
                                fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mheight * 0.01,
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                          height: mheight * 0.2,
                          child: ListView.builder(
                            itemCount: orders.payload!.data!.orderDetails!.length + 1,
                            itemBuilder: (BuildContext context, int index) {

                              if (index < orders.payload!.data!.orderDetails!.length) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: mwidth * 0.31,
                                          height: mheight * 0.05,
                                          child: Text(
                                            orders.payload!.data!.orderDetails![index].name.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'home',
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: mwidth * 0.035),
                                        SizedBox(
                                          width: mwidth * 0.31,
                                          height: mheight * 0.05,
                                          child: Text(
                                            orders.payload!.data!.orderDetails![index].quantity.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'home',
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: mwidth * 0.025),
                                        SizedBox(
                                          width: mwidth * 0.25,
                                          height: mheight * 0.03,
                                          child: Text(
                                            "₹${orders.payload!.data!.orderDetails![index].price.toString()}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'home',
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: Colors.grey,
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Total Amount',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'home',
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(  "₹${widget.total}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'home',
                                            fontSize: 16,
                                          ),),
                                        SizedBox(width: mwidth*0.14,)
                                      ]
                                    ),

                                  ],
                                );
                              }
                            },
                          )
                      ),
                    ],
                  ),
                );
              }
              if (state is OrderDetailsBlocError) {
                return Center(
                  child: Text("Error"),
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
