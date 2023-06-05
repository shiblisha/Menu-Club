import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:menu_club/Ui/Bottom%20Navigater/Order/orderDetails.dart';

import '../../../Bloc/OrderBloc/order_bloc.dart';
import '../../../Repository/ModelClass/OrderModel.dart';
class ComplettedPage extends StatefulWidget {
  const ComplettedPage({Key? key}) : super(key: key);

  @override
  State<ComplettedPage> createState() => _ComplettedPageState();
}
late OrderModel orders;
List<dynamic>completed=[];
class _ComplettedPageState extends State<ComplettedPage> {
  void initState() {
    BlocProvider.of<OrderBloc>(context).add(FetchOrders(ShopId: 1));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return BlocBuilder<OrderBloc, OrderState>(builder: (context, state) {
      if (state is OrderBlocLoading) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is OrderBlocLoaded) {
        orders = BlocProvider.of<OrderBloc>(context).orderModel;
        for (int i = 0; i < orders.payload!.data!.length; i++) {
          if (orders.payload!.data![i].status == 2) {
            completed.add(orders.payload!.data![i]);
          }
        }


        return ListView.builder(
            itemCount: completed.length,
            itemBuilder: (context, index) {
              String isoDate =
              completed[index].createdAt.toString();
              DateTime dateTime = DateTime.parse(isoDate);

              String formattedDateTime =
              DateFormat('yyyy-MM-dd HH:mm').format(dateTime);



              return Column(
                children: [
                  SizedBox(
                    height: mheight * 0.02,
                  ),
                  Card(elevation: 1,
                    child: Container(
                      height: mheight * 0.15,
                      width: mwidth * 0.85,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: mwidth * 0.02, top: mheight * 0.005),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Order No: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      fontFamily: 'title'),
                                ),
                                Text(
                                    completed[index].orderUniqueId
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        fontFamily: 'title'))
                              ],
                            ),
                            SizedBox(
                              height: mheight * 0.005,
                            ),
                            Text(
                              formattedDateTime.toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'title'),
                            ),
                            SizedBox(
                              height: mheight * 0.005,
                            ),
                            Row(
                              children: [
                                Text(
                                  '₹${completed[index].total}/-',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'title',
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: mwidth * 0.02,
                                ),
                                Text(
                                  "Completed",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      fontFamily: 'title',
                                      color: Color(0XFFF2994A)),
                                ),
                              ],
                            ),


                            TextButton(
                                onPressed: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (ctx) => OrderDetails(orderId: completed[index].id, total: completed[index].total,)));},
                                child: Text(
                                  "View Details",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'title',color: Color(0xffFF0000)),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.02,
                  )
                ],
              );}
            );
      }
      if (state is OrderBlocError) {
        return Center(
          child: Text("error"),
        );
      } else {
        return SizedBox();
      }
    });
  }
}
