import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Bloc/StoreBloc/store_bloc.dart';
import '../../Repository/ModelClass/StoreModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
String qrBase ="https://menuclub.uk/store/";
String shopName1 = '';
String descripton1 = "";
late StoreModel store;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    shopName();
    BlocProvider.of<StoreBloc>(context).add(FetchStore(ShopId: 1));
    // TODO: implement initState
    super.initState();
  }

  void shopName() async {
    final preferences = await SharedPreferences.getInstance();

    shopName1 = preferences.getString('shopname')!;
    descripton1 = preferences.getString('description')!;
  }

  @override
  Widget build(BuildContext context) {
    print(shopName1.toString());
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: mwidth * 0.08),
        child: BlocBuilder<StoreBloc, StoreState>(
          builder: (context, state) {
            if (state is StoreBlocLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is StoreBlocLoaded) {
              store = BlocProvider.of<StoreBloc>(context).storeModel;
              String qrCodeUrl=qrBase+store.payload!.data!.viewId.toString();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mheight * 0.07,
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/logo_red.png"),
                    ),
                  ),
                  SizedBox(height: mheight*0.02,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello ${shopName1.toString()},',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600,fontFamily:'title'),
                      ),
                      SizedBox(
                        height: mheight * 0.01,
                      ),
                      SizedBox(
                        height: mheight * 0.07,
                        width: mwidth * 0.8,
                        child: Text(
                          descripton1.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14,fontFamily: 'title'),
                        ),
                      ),
                      SizedBox(
                        height: mheight * 0.02,
                      )
                    ],
                  ),
                    Text("Analytics",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,fontFamily: 'title'),),
                  SizedBox(height: mheight*0.02,),
                  Row(children: [
                    Container(
                      height: mheight*0.11,
                      width: mwidth*0.23,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Color(0xffF3F3F3)),
                    child: Padding(
                      padding:  EdgeInsets.only(left: mwidth*0.01,top: mheight*0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("assets/1.png",height:mheight*0.025,),
                          SizedBox(height: mheight*0.01,),
                          Center(child: Text("23",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,fontFamily: 'title'),)),
                          SizedBox(height: mheight*0.01,),

                          Center(child: Text("Products ",style:TextStyle(fontSize: 14,fontFamily: 'title',fontWeight: FontWeight.w500),))
                        ],
                      ),
                    ),),
                    SizedBox(width: mwidth*0.08,),
                    Container(
                      height: mheight*0.11,
                      width: mwidth*0.23,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Color(0xffF3F3F3)),
                      child: Padding(
                        padding:  EdgeInsets.only(left: mwidth*0.01,top: mheight*0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/2.png",height:mheight*0.025,),
                            SizedBox(height: mheight*0.01,),
                            Center(child: Text("23",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,fontFamily: 'title'),)),
                            SizedBox(height: mheight*0.01,),

                            Center(child: Text("Pending ",style:TextStyle(fontSize: 14,fontFamily: 'title',fontWeight: FontWeight.w500),))
                          ],
                        ),
                      ),),
                    SizedBox(width: mwidth*0.08,),
                    Container(
                      height: mheight*0.11,
                      width: mwidth*0.23,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Color(0xffF3F3F3)),
                      child: Padding(
                        padding:  EdgeInsets.only(left: mwidth*0.01,top: mheight*0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/3.png",height:mheight*0.025,),
                            SizedBox(height: mheight*0.01,),
                            Center(child: Text("23",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,fontFamily: 'title'),)),
                            SizedBox(height: mheight*0.01,),

                            Center(child: Text("Orders ",style:TextStyle(fontSize: 14,fontFamily: 'title',fontWeight: FontWeight.w500),))
                          ],
                        ),
                      ),)
                  ],),
                  SizedBox(height: mheight*0.02,),
                  Text("Store Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                  SizedBox(height: mheight*0.05,),
                  Center(
                    child: QrImage(
                      data: qrCodeUrl,
                      version: QrVersions.auto,
                      size: mwidth*0.42,
                    ),
                  ),
                 SizedBox(height: mheight*0.04,),
                  GestureDetector(onTap: (){
                   // printDoc();
                  },
                    child: Center(
                      child: Container(
                        height: mheight * 0.06,
                        width: mwidth * 0.65,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.red),
                        child: const Center(
                            child: Text(
                          "Download Qr Code",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500,color: Color(0xffFFFFFF)),
                        )),
                      ),
                    ),
                  ),
                ],
              );
            }
            if (state is StoreBlocError) {
              return Center(
                child: Text("Error"),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }

}
