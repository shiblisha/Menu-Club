import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_club/Ui/Bottom%20Navigater/More/subscription.dart';

import '../../../Bloc/StoreBloc/store_bloc.dart';
import '../Home/home.dart';
import 'outletInfo.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<StoreBloc, StoreState>(
  builder: (context, state) {
    if(state is StoreBlocLoading){
      return Center(child: CircularProgressIndicator(),);
    }
    if(state is StoreBlocLoaded){
      store = BlocProvider
          .of<StoreBloc>(context)
          .storeModel;
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/logo_red.png"),
              ),
            ),
            SizedBox(
              height: mheight * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(left: mwidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: mheight * 0.025,
                      width: mwidth * 0.5,
                      child: Text(
                      store.payload!.data!.storeName.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'title'),
                      )),
                  SizedBox(height:  mheight*0.01,),
                  Container(
                    height: mheight*0.15,
                    width: mwidth*0.9,
                    child: Text(
                      store.payload!.data!.description.toString(), style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,fontFamily: 'title'),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OutletInfo()));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: mwidth*0.06,),
                  Container(
                    height: mheight*0.03,
                    width: mwidth*0.78,
                    child: Text(
                      "Otlet Info",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ImageIcon(AssetImage("assets/next.png"))
                ],
              ),
            ),
            SizedBox(
              height: mheight * 0.03,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SubscriptionPage()));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: mwidth*0.06,),
                  Container(
                    height: mheight*0.03,
                    width: mwidth*0.78,
                    child: Text(
                      "Subscription",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ImageIcon(AssetImage("assets/next.png"))
                ],
              ),
            ),
          ],
        );}if(state is StoreBlocError){
      return (Center(
        child: Text("ERROR"),
      ));
    }else{
      return SizedBox();
    }
  },
),
      ),
    );
  }
}
