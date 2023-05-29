import 'package:flutter/material.dart';
import 'package:menu_club/Ui/Bottom%20Navigater/More/outletInfo.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
            height: mheight*0.3,
              width: mwidth,
              child: Padding(
                padding:  EdgeInsets.only(top: mheight*0.07),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: mwidth*0.05,),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("assets/logo_red.png"),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: mwidth*0.02),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: mheight*0.02,),
                        SizedBox(
                          height: mheight*0.03,
                            width: mwidth*0.6,
                            child: Text("Demo Store",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),)),
                        SizedBox(height: mheight*0.01,),
                        SizedBox(
                          width: mwidth*0.6,
                          height: mheight*0.1,
                          child: Text("This is a demo store for reference purpose only. none of orders and products are not real. Thankyou",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                        )
                      ],),
                    )

                  ],
                ),
              ),
            ),
            SizedBox(height: mheight*0.05,),
            Center(
              child: GestureDetector(onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OutletInfo()));},
                child: Container(height: mheight*0.08,
                width: mwidth*0.85,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xffD9D9D9)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: mwidth*0.2,),
                    Image.asset("assets/primary.png",height: mheight*0.035,width: mwidth*0.08,),
                    SizedBox(width: mwidth*0.05,),
                    Text("Otlet Info",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),)
                  ],
                ),),
              ),
            ),
            SizedBox(height: mheight*0.03,),
            Center(
              child: Container(height: mheight*0.08,
                width: mwidth*0.85,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xffD9D9D9)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: mwidth*0.2,),
                    Image.asset("assets/card.png",height: mheight*0.035,width: mwidth*0.08,),
                    SizedBox(width: mwidth*0.05,),
                    Text("Subscription",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),)
                  ],
                ),),
            ),
            SizedBox(height: mheight*0.03,),
            Center(
              child: Container(height: mheight*0.08,
                width: mwidth*0.85,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xffD9D9D9)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: mwidth*0.2,),
                    Image.asset("assets/logout.png",height: mheight*0.035,width: mwidth*0.08,),
                    SizedBox(width: mwidth*0.05,),
                    Text("Logout",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),)
                  ],
                ),),
            ),
          ],
        ),
      ),
    );
  }
}
