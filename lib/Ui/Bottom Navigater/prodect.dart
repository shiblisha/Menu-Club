import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}
class _ProductPageState extends State<ProductPage> {
  List<bool> _toggleValue = [];
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(left: mwidth * 0.1),
            child: Text(
              "Product",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Container(
              height: mheight * 0.04,
              width: mwidth * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                    hintText: "Search"),
              ),
            ),
          ),
          SizedBox(
            height: mheight * 0.03,
          ),
          Padding(
            padding: EdgeInsets.only(left: mwidth * 0.03),
            child: Row(
              children: [
                SizedBox(
                  width: mwidth * 0.02,
                ),
                Container(
                  height: mheight * 0.03,
                  width: mwidth * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: mwidth * 0.03,
                ),
                Text(
                  "Add Product",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                )
              ],
            ),
          ),
                  SizedBox(
                    height: mheight * 0.05,
                  ),
                  Center(
                    child: Expanded(
                      child: Container(height: mheight,
                        width: mwidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[300]),
                        child: ListView.builder(itemCount: 3,
                          itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(height: mheight*0.02,),
                              Row(

                                children: [
                                  SizedBox(width: mwidth*0.02,),
                                  Container(
                                    height: mheight*0.1,
                                    width: mwidth*0.2,
                                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),),
                                    child: Image.asset("assets/burger.jpg",fit: BoxFit.cover,),
                                  ),
                                  SizedBox(width: mwidth*0.04,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: mheight*0.025,
                                          width: mwidth*0.3,
                                          child:Text("Item Name",style:TextStyle(fontWeight: FontWeight.w500,fontSize: 15),)),
                                      SizedBox(
                                        height: mheight*0.025,
                                        width: mwidth*0.3,
                            child:Text("₹ 2000",style:TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
                                      )
                                    ],
                                  ),   TextButton(
                                    onPressed: () { },
                                    child: Text("Edit",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 16,color: Colors.black)),
                                  ),
                                  SizedBox(
                                    width: mwidth * 0.02,
                                  ),
                                  Icon(
                                    Icons.edit,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: mwidth * 0.1,
                                  ),
                                  Switch(
                                    value: _toggleValue[index],
                                    onChanged: (value) {
                                      setState(() {
                                        _toggleValue[index] = value;
                                      });
                                      print(_toggleValue);
                                    },
                                    activeTrackColor: Colors.red[400],
                                    activeColor: Colors.red,
                                  ),
                                ],
                              ),
                            ],
                          );
                        },),

                      ),
                    ),
                  )

        ])));
  }
}
