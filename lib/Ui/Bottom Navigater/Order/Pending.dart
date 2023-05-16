import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_club/Repository/ModelClass/OrderModel.dart';

import '../../../Bloc/OrderBloc/order_bloc.dart';
class PendingPage extends StatefulWidget {
  const PendingPage({Key? key}) : super(key: key);

  @override
  State<PendingPage> createState() => _PendingPageState();
}
late OrderModel orders;
class _PendingPageState extends State<PendingPage> {
  @override
  void initState() {
    BlocProvider.of<OrderBloc>(context).add(FetchOrders(ShopId: 1));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return BlocBuilder<OrderBloc, OrderState>(
  builder: (context, state) {
    if (state is OrderBlocLoading){
      return Center(child: CircularProgressIndicator());

    }
    if (state is OrderBlocLoaded){
      orders= BlocProvider.of<OrderBloc>(context).orderModel;

    return ListView.builder(
    itemCount: orders.payload!.data!.length,
      itemBuilder: (context, index) {

      return Column(
        children: [
          SizedBox(height: mheight*0.02,),
          Container(
            height:mheight*0.4,
            width: mwidth*0.85,
            decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            children: [
              SizedBox(height: mheight*0.02,),
              Text("Order No",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
              SizedBox(height: mheight*0.02,),
             SizedBox(
                 height: mheight*0.05,
                 width: mwidth*0.65,


                 child: Center(child: Text(orders.payload!.data![index].orderUniqueId.toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),))),
              SizedBox(height: mheight*0.01,),
              Text("ORDER TIME",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
              SizedBox(height: mheight*0.02,
                  width: mwidth*0.65,

              child: Center(
                child: Text(orders.payload!.data![index].createdAt.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
              ),),
              SizedBox(height: mheight*0.05,),
              Row(
                children: [SizedBox(width: mwidth*0.27,),
                  Text("Status :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                  Text("ACEPTED",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                ],
              ),
              SizedBox(height: mheight*0.02,),
              Padding(
                padding:  EdgeInsets.only(left: mwidth*0.035),
                child: Container(height: mheight*0.05,
                width: mwidth*0.6,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),color: Colors.red,),
                  child: Padding(
                    padding:  EdgeInsets.only(left: mwidth*0.1),
                    child: Row(
                      children: [
                        Text("View Order Details",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.white),),
                        SizedBox(width: mwidth*0.02,),
                        Icon(Icons.remove_red_eye,color: Colors.white,)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: mheight*0.02,),

              Row(
                children: [
                  SizedBox(width:mwidth*0.15,),
                  Text("TOTTAL AMOUNT :",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.grey),),
                  SizedBox(width:mwidth*0.09,),
                  Container(
                    height: mheight*0.03,
                    width: mwidth*0.3,
                    child: Center(
                      child: Text(orders.payload!.data![index].total.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                    ),
                  )
                ],
              )
            ],
          ),),
          SizedBox(height: mheight*0.02,)
        ],
      );
    });
  }if (state is OrderBlocError){
      return Center(child: Text("error"),);
    }else{return SizedBox();}}
)
    ;
  }
}
