import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/ProductBloc/product_bloc.dart';
import '../../Repository/ModelClass/productModel.dart';
import '../../main.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

List<bool> _toggleValue = [false,false,false];
ProductModel? products;
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
              BlocBuilder<ProductBloc, ProductState>(
    builder: (context, state) {
    if (state is ProductblocLoading){
    return Center(child: CircularProgressIndicator(),);

    }if (state is ProductblocLoaded){
    products= BlocProvider.of<ProductBloc>(context).productData;
    for (int i = 1; i <= products!.payload!.data!.length; i++) {
    _toggleValue.add(false);
    }
    return Container(height: mheight,
                width: mwidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[300]),
                child:SingleChildScrollView(
                  child: ListView.builder(itemCount:products!.payload!.data!.length ,shrinkWrap: true,
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
                                      child: Image.network(basePath+products!.payload!.data![index].imageUrl.toString(),fit: BoxFit.cover,),
                                    ),
                                    SizedBox(width: mwidth*0.04,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height: mheight*0.025,
                                            width: mwidth*0.3,
                                            child:Text(products!.payload!.data![index].name.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize: 15),)),
                                        SizedBox(
                                          height: mheight*0.025,
                                          width: mwidth*0.3,
                                          child:Text("₹${products!.payload!.data![index].price.toString()}",style:TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
                                        )
                                      ],
                                    ),   TextButton(
                                      onPressed: () {dialogBox(togleValue:  _toggleValue[index]); },
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
                          },

              ),
                )

              );
  }if(state is ProductblocError){
    return Text("Error");}else{return SizedBox();}
    }
)])));
  }
  Future<void> dialogBox({required bool togleValue}) async {



    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var size = MediaQuery.of(context).size;
        return WillPopScope(
          onWillPop: ()async=>false,
          child: AlertDialog(

              contentPadding: EdgeInsets.symmetric(
                vertical: mheight * 0.8,
              ),
              title:SizedBox(height: mheight*0.8,width: mwidth,
                child: ListView(shrinkWrap: true,
                  children: [
                    Row(children: [
                      SizedBox(width: mwidth*0.54,),
                      IconButton(icon: Icon(Icons.close,size: 25,), onPressed: () { Navigator.of(context).pop(); })
                    ],),
                    Row(
                      children: [
                        Text("is enablred",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                        Switch(
                          value: togleValue,
                          onChanged: (value) {
                            setState(() {
                              togleValue = value;
                            });
                            print(_toggleValue);
                          },
                          activeTrackColor: Colors.red[400],
                          activeColor: Colors.red,
                        ),
                      ],
                    ),Row(
                      children: [
                        Text("is Recomended",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                        Switch(
                          value: togleValue,
                          onChanged: (value) {
                            setState(() {
                              togleValue = value;
                            });
                            print(_toggleValue);
                          },
                          activeTrackColor: Colors.red[400],
                          activeColor: Colors.red,
                        ),
                      ],
                    ),Row(
                      children: [
                        Text("is Veg",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                        Switch(
                          value: togleValue,
                          onChanged: (value) {
                            setState(() {
                              togleValue = value;
                            });
                            print(_toggleValue);
                          },
                          activeTrackColor: Colors.red[400],
                          activeColor: Colors.red,
                        ),
                      ],
                    ),
                    SizedBox(height: mheight*0.01,),
                    Text("Category Name"),
                    Container(
                      height: mheight * 0.065,
                      width: mwidth * 0.9,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.02),
                        child: TextFormField(
                          decoration:  InputDecoration(
                            hintText: "Category Name",
                            hintStyle:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: mheight*0.01,),
                    Text("Item Name"),
                    Container(
                      height: mheight * 0.065,
                      width: mwidth * 0.9,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.02),
                        child: TextFormField(
                          decoration:  InputDecoration(
                            hintText: "Item Name",
                            hintStyle:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: mheight*0.01,),
                    Text("Price"),
                    Container(
                      height: mheight * 0.065,
                      width: mwidth * 0.9,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.02),
                        child: TextFormField(
                          decoration:  InputDecoration(
                            hintText: "Category Name",
                            hintStyle:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: mheight*0.01,),
                    Text("Cooking Time (Minutes)"),
                    Container(
                      height: mheight * 0.065,
                      width: mwidth * 0.9,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.02),
                        child: TextFormField(
                          decoration:  InputDecoration(
                            hintText: "Category Name",
                            hintStyle:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: mheight*0.01,),
                    Text("Discription"),
                    Container(
                      height: mheight * 0.065,
                      width: mwidth * 0.9,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.02),
                        child: TextFormField(
                          decoration:  InputDecoration(
                            hintText: "Item Discription",
                            hintStyle:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: mheight*0.01,),
                    Text("Photo"),
                    Container(
                      height: mheight*0.05,
                      width: mwidth*0.9,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.blue,),
                      child: Center(
                        child: Text("Select Photo"),
                      ),
                    ),
                    SizedBox(height: mheight*0.02,),
                    Padding(
                      padding:  EdgeInsets.only(left: mwidth*0.16,right: mwidth*0.16),
                      child: Container(
                        height: mheight*0.05,
                        width: mwidth*0.02,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.red,),
                        child: Center(
                          child: Text("Save"),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
        );
      },
    );
  }

  }

