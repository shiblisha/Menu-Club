import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:menu_club/main.dart';
import '../../../Bloc/ProductBloc/product_bloc.dart';
import '../../../Bloc/UpdateProducts/update_product_bloc.dart';
import '../../../Repository/ModelClass/productModel.dart';
import '../Categorys/category.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

List<bool> _toggleValue = [];
bool toggle = false;
bool toggle1=false;
bool toggle2=false;
ProductModel? products;
File? _image;


class _ProductPageState extends State<ProductPage> {
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(FetchProduct(shopId: 1));
    super.initState();
  }

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: mheight * 0.04,
            ),
            Row(
              children: [
                SizedBox(
                  width: mwidth * 0.05,
                ),
                Container(
                  height: mheight * 0.05,
                  width: mwidth * 0.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        hintText: "Search your spot",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: 'title',
                            color: Color(0xffA7A7A7))),
                  ),
                ),
                SizedBox(
                  width: mwidth * 0.05,
                ),
                GestureDetector(
                  onTap: () {
                    // showModalBottomSheet<void>(
                    //   backgroundColor:
                    //   Colors.transparent,
                    //   isScrollControlled: true,
                    //   context: context,
                    //   builder: (BuildContext ctx) {
                    //     return WillPopScope(
                    //       onWillPop: () async =>
                    //       false,
                    //       child: Container(
                    //           height: mheight * 0.9,
                    //           child: bottomSheet1()),
                    //     );
                    //   },
                    // );
                  },
                  child: Container(
                    height: mheight * 0.04,
                    width: mwidth * 0.09,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(color: Colors.black)),
                    child: Center(
                      child: Icon(
                        Icons.add,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: mheight * 0.05,
            ),
            Center(
              child: SizedBox(
                height: mheight * 0.78,
                child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is ProductblocLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is ProductblocLoaded) {
                        products =
                            BlocProvider
                                .of<ProductBloc>(context)
                                .productData;
                        return ListView.builder(
                          itemCount: products?.payload!.data!.length,
                          itemBuilder: (context, index) {
                            for (int i = 0;
                            i < products!.payload!.data!.length;
                            i++) {
                              _toggleValue.add(false);
                            }

                            return Column(
                              children: [
                                Card(
                                  elevation: 2,
                                  child: Container(
                                    height: mheight * 0.15,
                                    width: mwidth * 0.9,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Container(
                                          height: mheight * 0.149,
                                          width: mwidth * 0.33,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(4)),
                                          child: Image.network(
                                            basePath +
                                                products?.payload!.data![index]
                                                    .imageUrl,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: mheight * 0.01,
                                              left: mwidth * 0.02),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: mheight * 0.03,
                                                width: mwidth * 0.45,
                                                child: Text(
                                                  products
                                                      ?.payload!.data![index]
                                                      .name,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: 'title',
                                                      fontWeight: FontWeight
                                                          .w600),
                                                ),
                                              ),
                                              SizedBox(
                                                height: mheight * 0.03,
                                                width: mwidth * 0.45,
                                                child: Text(
                                                  "₹ ${products?.payload!
                                                      .data![index].price}/-",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: 'title',
                                                      fontWeight: FontWeight
                                                          .w500),
                                                ),
                                              ),
                                              RatingBar.builder(
                                                  itemCount: 5,
                                                  initialRating: 3,
                                                  allowHalfRating: true,
                                                  itemSize: 15,
                                                  itemBuilder: (ctx, index) =>
                                                      Icon(
                                                        Icons.star,
                                                        color: Color(
                                                            0xffFFC113),
                                                      ),
                                                  onRatingUpdate: (value) {
                                                    if (kDebugMode) {
                                                      print(value);
                                                    }
                                                  }),
                                              Row(
                                                children: [
                                                  Transform.scale(
                                                    scale: 0.8,
                                                    // Adjust the scale value to change the size of the switch
                                                    child: Switch(
                                                      value: _toggleValue[index],
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _toggleValue[index] =
                                                              value;
                                                        });
                                                        _toggleValue[index] ==
                                                            false
                                                            ? BlocProvider.of<
                                                            UpdateProductBloc>(
                                                            context).add(
                                                            FetchUpdateProduct(
                                                                shopId: 1,
                                                                is_recommended: 1,
                                                                is_veg: 1,
                                                                cooking_time: 1,
                                                                category_id: 270,
                                                                is_active: 1,
                                                                image_extension: '',
                                                                image: '',
                                                                description: products!
                                                                    .payload!
                                                                    .data![index]
                                                                    .description,
                                                                price: products!
                                                                    .payload!
                                                                    .data![index]
                                                                    .price,
                                                                name: products!
                                                                    .payload!
                                                                    .data![index]
                                                                    .name,
                                                                ItemId: 1854))
                                                            : BlocProvider.of<
                                                            UpdateProductBloc>(
                                                            context)
                                                            .add(
                                                            FetchUpdateProduct(
                                                                shopId: 1,
                                                                is_recommended:
                                                                1,
                                                                is_veg: 1,
                                                                cooking_time: 1,
                                                                category_id:
                                                                270,
                                                                is_active: 1,
                                                                image_extension:
                                                                '',
                                                                image: '',
                                                                description: products!
                                                                    .payload!
                                                                    .data![
                                                                index]
                                                                    .description,
                                                                price: products!
                                                                    .payload!
                                                                    .data![
                                                                index]
                                                                    .price,
                                                                name: products!
                                                                    .payload!
                                                                    .data![index]
                                                                    .name,
                                                                ItemId: 1854));

                                                        print(_toggleValue);
                                                      },
                                                      activeTrackColor:
                                                      Colors.red[400],
                                                      activeColor: Colors.red,
                                                    ),
                                                  ),
                                                  Text(
                                                    _toggleValue[index] == true
                                                        ? "Enabled"
                                                        : "Disabled",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight
                                                            .w500,
                                                        fontFamily: 'home'),
                                                  ),
                                                  SizedBox(
                                                    width: mwidth * 0.12,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  _showBottomSheet(context);


                                                },
                                                child: Image.asset(
                                                  "assets/edit.png",
                                                  height: mheight * 0.04,
                                                )),
                                            SizedBox(
                                              height: mheight * 0.07,
                                            ),
                                            ImageIcon(
                                                AssetImage(
                                                    "assets/enabled.png"),
                                                size: 15,
                                                color: _toggleValue[index] ==
                                                    true
                                                    ? Colors.green
                                                    : Colors.red)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: mheight * 0.02,
                                ),
                              ],
                            );
                          },
                        );
                      }
                      if (state is ProductblocError) {
                        return Center(
                          child: Text('Error'),
                        );
                      } else {
                        return SizedBox();
                      }
                    }),
              ),
            )
          ]),
        ),
      ),
    );
  }


  void _showBottomSheet(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        bool toggleValue = false;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(constraints:
                BoxConstraints(minHeight: mheight*0.65),
                height: MediaQuery.of(context).size.height * 0.9,
              child: ListView(
                children: [
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    EdgeInsets.only(left: mwidth * 0.02, top: mheight * 0.02),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.02,
                  ),
                  Center(
                    child: Container(
                      height: mheight * 0.053,
                      width: mwidth * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.02),
                        child: FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Category Name",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: 'title',
                                  color: Color(0xff4B4B4B),
                                ),
                              ),
                              isEmpty: state.value == null || state.value!.isEmpty,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: state.value,
                                  isDense: true,
                                  onChanged: (newValue) {
                                    // Update the value when the selection changes
                                    state.didChange(newValue);
                                  },
                                  items: <String>[
                                    'Option 1',
                                    'Option 2',
                                    'Option 3',
                                  ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.02,
                  ),
                  Center(
                    child: Container(
                      height: mheight * 0.053,
                      width: mwidth * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.02),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Product Name",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: 'title',
                                  color: Color(0xff4B4B4B))),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.02,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: mwidth * 0.05,
                      ),
                      Container(
                        height: mheight * 0.053,
                        width: mwidth * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: mwidth * 0.02),
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Veg",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    fontFamily: 'title',
                                    color: Color(0xff4B4B4B),
                                  ),
                                ),
                                isEmpty: state.value == null || state.value!.isEmpty,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: state.value,
                                    isDense: true,
                                    onChanged: (newValue) {
                                      // Update the value when the selection changes
                                      state.didChange(newValue);
                                    },
                                    items: <String>[
                                      'Veg',
                                      'Non Veg',
                                    ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: mwidth * 0.09,
                      ),
                      Container(
                        height: mheight * 0.053,
                        width: mwidth * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: mwidth * 0.02),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Price",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    fontFamily: 'title',
                                    color: Color(0xff4B4B4B))),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: mheight * 0.02,
                  ),
                  Center(
                    child: Container(
                      height: mheight * 0.053,
                      width: mwidth * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.02),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Preparation Time (Min.)",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: 'title',
                                  color: Color(0xff4B4B4B))),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.02,
                  ),
                  Center(
                    child: Container(
                      height: mheight * 0.15,
                      width: mwidth * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.02),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Description",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: 'title',
                                  color: Color(0xff4B4B4B))),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      getGalleryImage();
                    },
                    child: _image == null
                        ? Center(
                      child: Container(
                        height: mheight * 0.15,
                        width: mwidth * 0.9,
                        child: Image.asset(
                          "assets/upload image.png",
                        ),
                      ),
                    )
                        : Center(
                      child: Container(
                        height: mheight * 0.3,
                        width: mwidth * 0.6,
                        child: Image.file(
                          _image!.absolute,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.02,
                  ),
                  ListTile(
                    title: Text('Toggle'),
                    trailing: Switch(
                      value: toggleValue,
                      onChanged: (value) {
                        setState(() {
                          toggleValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ]));
          },
        );
      },
    );
  }

  Future<void> getGalleryImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('no image found');
      }
    });
  }


}
