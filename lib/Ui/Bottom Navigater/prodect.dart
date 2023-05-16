import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_club/Repository/ModelClass/ProductModel.dart';

import '../../Bloc/ProductBloc/product_bloc.dart';
import '../../main.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

List<bool> _toggleValue = [];
late ProductModel products;
class _ProductPageState extends State<ProductPage> {
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(FetchProduct(shopId: 1));
    super.initState();
  }
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
                        child: BlocBuilder<ProductBloc, ProductState>(
  builder: (context, state) {
    if (state is ProductblocLoading){
      return Center(child: CircularProgressIndicator(),);

    }if (state is ProductblocLoaded){
      for (int i = 1; i <= products.payload!.data!.length; i++) {
        _toggleValue.add(false);
      }
      products= BlocProvider.of<ProductBloc>(context).productData;
    return ListView.builder(itemCount:products.payload!.data!.length ,
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
                                    child: Image.network(basePath+products.payload!.data![index].imageUrl.toString(),fit: BoxFit.cover,),
                                  ),
                                  SizedBox(width: mwidth*0.04,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: mheight*0.025,
                                          width: mwidth*0.3,
                                          child:Text(products.payload!.data![index].name.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize: 15),)),
                                      SizedBox(
                                        height: mheight*0.025,
                                        width: mwidth*0.3,
                            child:Text("₹${products.payload!.data![index].price.toString()}",style:TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
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
                                    width: mwidth * 0.01,
                                  ),
                                  Icon(
                                    Icons.edit,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                 SizedBox(width: mwidth*0.05),
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
                        },);}if (state is ProductblocError){
      return Center(child: Text("Error"),);
    }else {return SizedBox();}
  },
),

                      ),
                    ),
                  )

        ])));
    }
  

  }

