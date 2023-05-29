import 'package:flutter/material.dart';
class OutletInfo extends StatefulWidget {
  const OutletInfo({Key? key}) : super(key: key);

  @override
  State<OutletInfo> createState() => _OutletInfoState();
}

class _OutletInfoState extends State<OutletInfo> {
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: Text(
        "Otlet Info",
        style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,),
      ),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: mheight * .06,
          ),
          Padding(
            padding: EdgeInsets.only(left: mwidth * 0.04, right: mwidth * 0.03),
            child: TextFormField(validator: (value) {
              if (value == null ||
                  value.isEmpty) {
                return 'Field Should Not Be Empty';
              }
              return null;
            },
              // controller: breed,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: "Store Name",
                labelStyle: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color: Colors.black),
                hintText: 'Add Breed ',
                hintStyle: TextStyle(fontSize: 14),
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
