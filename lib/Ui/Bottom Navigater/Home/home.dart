import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_club/Ui/Bottom%20Navigater/Home/printableData.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Bloc/StoreBloc/store_bloc.dart';
import '../../../Repository/ModelClass/StoreModel.dart';
import '../../../main.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
String qrBase ="https://menuclub.uk/store/";
String shopName1 = '';
String descripton1 = "";
String shopId='';
late StoreModel store;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    await shopName();
    if (shopId.isNotEmpty) {
      final int? shopIdValue = int.tryParse(shopId);
      if (shopIdValue != null) {
        BlocProvider.of<StoreBloc>(context).add(FetchStore(ShopId: shopIdValue));
      } else {
        print('Invalid shopId: $shopId'); // Print the invalid shopId for debugging
      }
    } else {
      print('ShopId is empty'); // Print a message if shopId is empty
    }
  }

  Future<void> shopName() async {
    final preferences = await SharedPreferences.getInstance();

    shopName1 = preferences.getString('shopname')!;
    descripton1 = preferences.getString('description')!;
    shopId = preferences.getString('shopId') ?? '';
  }

  late String qrCodeUrl;
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery
        .of(context)
        .size
        .width;
    var mheight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: mwidth * 0.08),
        child: BlocBuilder<StoreBloc, StoreState>(
          builder: (context, state) {
            if (state is StoreBlocLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is StoreBlocLoaded) {
              store = BlocProvider
                  .of<StoreBloc>(context)
                  .storeModel;
              if (store.payload != null && store.payload!.data != null) {
                qrCodeUrl = qrBase +
                    store.payload!.data!.viewId.toString();
              } else {
                qrCodeUrl = '';
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mheight * 0.07,
                  ),
                  const Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/logo_red.png"),
                    ),
                  ),
                  SizedBox(height: mheight * 0.02,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello ${shopName1.toString()},',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'title'),
                      ),
                      SizedBox(
                        height: mheight * 0.01,
                      ),
                      SizedBox(
                        height: mheight * 0.07,
                        width: mwidth * 0.8,
                        child: Text(
                          descripton1.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: 'title'),
                        ),
                      ),
                      SizedBox(
                        height: mheight * 0.02,
                      )
                    ],
                  ),
                  const Text("Analytics", style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'title'),),
                  SizedBox(height: mheight * 0.02,),
                  Row(children: [
                    Container(
                      height: mheight * 0.11,
                      width: mwidth * 0.23,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffF3F3F3)),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.01,
                            top: mheight * 0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/1.png", height: mheight * 0.025,),
                            SizedBox(height: mheight * 0.01,),
                            const Center(child: Text("23", style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'title'),)),
                            SizedBox(height: mheight * 0.01,),

                            const Center(child: Text("Products ",
                              style: TextStyle(fontSize: 14,
                                  fontFamily: 'title',
                                  fontWeight: FontWeight.w500),))
                          ],
                        ),
                      ),),
                    SizedBox(width: mwidth * 0.08,),
                    Container(
                      height: mheight * 0.11,
                      width: mwidth * 0.23,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffF3F3F3)),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.01,
                            top: mheight * 0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/2.png", height: mheight * 0.025,),
                            SizedBox(height: mheight * 0.01,),
                            const Center(child: Text("23", style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'title'),)),
                            SizedBox(height: mheight * 0.01,),

                            const Center(child: Text("Pending ",
                              style: TextStyle(fontSize: 14,
                                  fontFamily: 'title',
                                  fontWeight: FontWeight.w500),))
                          ],
                        ),
                      ),),
                    SizedBox(width: mwidth * 0.08,),
                    Container(
                      height: mheight * 0.11,
                      width: mwidth * 0.23,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffF3F3F3)),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.01,
                            top: mheight * 0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/3.png", height: mheight * 0.025,),
                            SizedBox(height: mheight * 0.01,),
                            const Center(child: Text("23", style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'title'),)),
                            SizedBox(height: mheight * 0.01,),

                            const Center(child: Text("Orders ",
                              style: TextStyle(fontSize: 14,
                                  fontFamily: 'title',
                                  fontWeight: FontWeight.w500),))
                          ],
                        ),
                      ),)
                  ],),
                  SizedBox(height: mheight * 0.02,),
                  const Text("Store Details", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),),
                  SizedBox(height: mheight * 0.05,),
                  Center(
                    child: QrImageView(
                      data: qrCodeUrl,
                      version: QrVersions.auto,
                      size: mwidth * 0.42,
                    ),
                  ),
                  SizedBox(height: mheight * 0.04,),
                  GestureDetector(onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            PrintableData(path: qrCodeUrl,)));
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
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFFF)),
                            )),
                      ),
                    ),
                  ),
                ],
              );
            }
            if (state is StoreBlocError) {
              return const Center(
                child: Text("Error"),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
