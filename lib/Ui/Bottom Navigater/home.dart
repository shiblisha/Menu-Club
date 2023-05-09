import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: mwidth * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mheight * 0.1,
            ),
             Text(
              "Hello!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: mheight * 0.04,
            ),
            Row(
              children: [
                 CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/logo_red.png"),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: mwidth*0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Store Name",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: mheight*0.01,),
                      SizedBox(
                        height: mheight*0.05,
                        width: mwidth*0.4,
                        child: Text(
                          "Dehdfvkvkfdsvvkjsfdikkjrfvubkjdcksdoiufvriuuuuuudisfgisdlbfvyuuvfosyvsvfuosdvsesdhbo ",
                          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),
                        ),
                      ),
                      SizedBox(height: mheight*0.02,)
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: mheight*0.08,),
            Padding(
              padding:  EdgeInsets.only(left: mwidth*0.05),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(

                    children: [
                      SizedBox(height: mheight*0.05,),
                      Text("   No.of\nProducts",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
                    ],
                  ),
                  SizedBox(
                    height: mheight*0.2,
                    width: mwidth*0.2,
                    child:VerticalDivider(
                      thickness: 3,
                      color: Colors.grey,
                    ) ,
                  ),
                  SizedBox(width: mwidth*0.05,),
                  Column(
                    children: [
                      SizedBox(height: mheight*0.08,),
                      Text("25",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),)
                    ],
                  )
                ]
                ,
              ),
            ),
            SizedBox(height: mheight*0.1,),
            Row(
              children: [
                Container(
                  height: mheight*0.17,
                  width: mwidth*0.42,
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(width: mwidth*0.05,),
                Container(height: mheight*0.06,
                width: mwidth*0.4,
               decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),color: Colors.red),
                child: const Center(child: Text("Download\n      Qr",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)),)
              ],
            ),


          ],
        ),
      ),
    );
  }
}
