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
            SizedBox(height: mheight*0.06,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("   No.of\nProducts",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)
              ]
              ,
            )
          ],
        ),
      ),
    );
  }
}
