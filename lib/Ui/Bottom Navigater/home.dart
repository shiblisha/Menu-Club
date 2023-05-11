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
                        padding: EdgeInsets.only(left: mwidth * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shopName1.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: mheight * 0.01,
                            ),
                            SizedBox(
                              height: mheight * 0.07,
                              width: mwidth * 0.58,
                              child: Text(
                                descripton1.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 13),
                              ),
                            ),
                            SizedBox(
                              height: mheight * 0.02,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: mheight * 0.08,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.05),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: mheight * 0.05,
                            ),
                            Text(
                              "   No.of\nProducts",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mheight * 0.2,
                          width: mwidth * 0.2,
                          child: VerticalDivider(
                            thickness: 3,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: mwidth * 0.05,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: mheight * 0.08,
                            ),
                            Text(
                              store.payload!.data!.productCount.toString(),
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w700),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.1,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(15)),
                        height: mheight*0.2,
                        width: mwidth*0.4,
                        child: QrImage(
                          data: qrCodeUrl,
                          version: QrVersions.auto,
                          size: mwidth*0.4,
                        ),
                      ),
                      SizedBox(
                        width: mwidth * 0.05,
                      ),
                      GestureDetector(onTap: (){
                       // printDoc();
                      },
                        child: Container(
                          height: mheight * 0.06,
                          width: mwidth * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red),
                          child: const Center(
                              child: Text(
                            "Download\n      Qr",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          )),
                        ),
                      )
                    ],
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
