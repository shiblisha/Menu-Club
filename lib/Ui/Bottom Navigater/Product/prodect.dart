import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:menu_club/Ui/fluttertoast.dart';
import 'package:menu_club/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Bloc/AddProdductBloc/add_product_bloc.dart';
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
bool toggle1 = false;
bool toggle2 = false;
ProductModel? products;
File? _image;
TextEditingController productName = TextEditingController();
TextEditingController price = TextEditingController();
TextEditingController time = TextEditingController();
TextEditingController description = TextEditingController();
TextEditingController productName1 = TextEditingController();
TextEditingController price1 = TextEditingController();
TextEditingController time1 = TextEditingController();
TextEditingController description1 = TextEditingController();
String shopId = '';

class _ProductPageState extends State<ProductPage> {
  void initState() {
    super.initState();
    shopName();
  }

  void shopName() async {
    final preferences = await SharedPreferences.getInstance();
    setState(() {
      shopId = preferences.getString('shopId')!;
    });
    BlocProvider.of<ProductBloc>(context)
        .add(FetchProduct(shopId: int.parse(shopId)));
  }

  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
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
                    _showBottomSheet1(context);
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
                        BlocProvider.of<ProductBloc>(context).productData;

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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  ?.payload!.data![index].name,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'title',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          SizedBox(
                                            height: mheight * 0.03,
                                            width: mwidth * 0.45,
                                            child: Text(
                                              "₹ ${products?.payload!.data![index].price}/-",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'title',
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          RatingBar.builder(
                                              itemCount: 5,
                                              initialRating: 3,
                                              allowHalfRating: true,
                                              itemSize: 15,
                                              itemBuilder: (ctx, index) => Icon(
                                                    Icons.star,
                                                    color: Color(0xffFFC113),
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
                                                    _toggleValue[index] == false
                                                        ? BlocProvider.of<UpdateProductBloc>(context).add(FetchUpdateProduct(
                                                            shopId: int.parse(
                                                                shopId),
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
                                                        : BlocProvider.of<UpdateProductBloc>(context).add(FetchUpdateProduct(
                                                            shopId: int.parse(
                                                                shopId),
                                                            is_recommended: 1,
                                                            is_veg: 1,
                                                            cooking_time: 1,
                                                            category_id: 270,
                                                            is_active: 1,
                                                            image_extension: '',
                                                            image: '',
                                                            description:
                                                                products!
                                                                    .payload!
                                                                    .data![
                                                                        index]
                                                                    .description,
                                                            price: products!
                                                                .payload!
                                                                .data![index]
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
                                                    fontWeight: FontWeight.w500,
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
                                              _showBottomSheet(
                                                  context,
                                                  products!.payload!
                                                      .data![index].name
                                                      .toString(),
                                                  products!.payload!
                                                      .data![index].price
                                                      .toString(),
                                                  products!.payload!
                                                      .data![index].cookingTime
                                                      .toString(),
                                                  products!.payload!
                                                      .data![index].description
                                                      .toString(),
                                                  index);
                                            },
                                            child: Image.asset(
                                              "assets/edit.png",
                                              height: mheight * 0.04,
                                            )),
                                        SizedBox(
                                          height: mheight * 0.07,
                                        ),
                                        ImageIcon(
                                            AssetImage("assets/enabled.png"),
                                            size: 15,
                                            color: _toggleValue[index] == true
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

  void _showBottomSheet(BuildContext context, String productname1, String Price,
      String Time, String Descrption, int index) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    print(Time);
    setState(() {
      productName.text = productname1;
      price.text = Price;
      time.text = Time;
      description.text = Descrption;
    });
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        bool toggleValue = false;
        bool toggleValue1 = false;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return WillPopScope(
              onWillPop: () async => false,
              child: Container(
                  height: mheight * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white),
                  child: ListView(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: mwidth * 0.02, top: mheight * 0.02),
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
                                    isEmpty: state.value == null ||
                                        state.value!.isEmpty,
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
                                controller: productName,
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
                                      isEmpty: state.value == null ||
                                          state.value!.isEmpty,
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
                                    keyboardType: TextInputType.phone,
                                    controller: price,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Price",
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          fontFamily: 'title',
                                          color: Color(0xff4B4B4B)),
                                    ),
                                  ),
                                ))
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
                                controller: time,
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
                                controller: description,
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
                        Row(children: [
                          SizedBox(
                            width: mwidth * 0.05,
                          ),
                          Text(
                            'Enabled',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'title'),
                          ),
                          Switch(
                            activeTrackColor: Colors.red[400],
                            activeColor: Colors.red,
                            value: toggleValue,
                            onChanged: (value) {
                              setState(() {
                                toggleValue = value;
                              });
                            },
                          ),
                          SizedBox(
                            width: mwidth * 0.3,
                          ),
                          Text(
                            'Enabled',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'title'),
                          ),
                          Switch(
                            activeTrackColor: Colors.red[400],
                            activeColor: Colors.red,
                            value: toggleValue1,
                            onChanged: (value) {
                              setState(() {
                                toggleValue1 = value;
                              });
                            },
                          ),
                        ]),
                        SizedBox(
                          height: mheight * 0.02,
                        ),
                        Center(
                            child: BlocListener<UpdateProductBloc,
                                UpdateProductState>(
                          listener: (context, state) {
                            if (state is UpdateProductblocLoading) {
                              Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state is UpdateProductblocLoaded) {
                              BlocProvider.of<ProductBloc>(context)
                                  .add(FetchProduct(shopId: int.parse(shopId)));
                              Navigator.of(context).pop();
                            }
                            if (state is UpdateProductblocError) {
                              ToastMessage()
                                  .toastmessage(message: 'Somthing went wrong');
                            }
                          },
                          child: GestureDetector(
                            onTap: () {
                              BlocProvider.of<UpdateProductBloc>(context).add(
                                  FetchUpdateProduct(
                                      shopId: int.parse(shopId),
                                      is_recommended: products!
                                          .payload!.data![index].isRecommended,
                                      is_veg:
                                          products!.payload!.data![index].isVeg,
                                      cooking_time: int.parse(time.text),
                                      category_id: products!
                                          .payload!.data![index].categoryId,
                                      is_active: products!
                                          .payload!.data![index].isActive,
                                      image_extension: null.toString(),
                                      image: products!
                                          .payload!.data![index].imageUrl,
                                      description: description.text,
                                      price: int.parse(price.text),
                                      name: productName.text,
                                      ItemId:
                                          products!.payload!.data![index].id));
                            },
                            child: Container(
                              height: mheight * 0.05,
                              width: mwidth * 0.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xffFF0000),
                              ),
                              child: Center(
                                child: Text('Update',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'title',
                                        color: Color(0xffffffff))),
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ])),
            );
          },
        );
      },
    );
  }

  void _showBottomSheet1(BuildContext context,) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        bool toggleValue = false;
        bool toggleValue1 = false;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return WillPopScope(
              onWillPop: () async => false,
              child: Container(
                  height: mheight * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white),
                  child: ListView(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: mwidth * 0.02, top: mheight * 0.02),
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
                                    isEmpty: state.value == null ||
                                        state.value!.isEmpty,
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
                                controller: productName1,
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
                                      isEmpty: state.value == null ||
                                          state.value!.isEmpty,
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
                                  controller: price1,
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
                                controller: description1,
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
                        Row(children: [
                          SizedBox(
                            width: mwidth * 0.05,
                          ),
                          Text(
                            'Enabled',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'title'),
                          ),
                          Switch(
                            activeTrackColor: Colors.red[400],
                            activeColor: Colors.red,
                            value: toggleValue,
                            onChanged: (value) {
                              setState(() {
                                toggleValue = value;
                              });
                            },
                          ),
                          SizedBox(
                            width: mwidth * 0.3,
                          ),
                          Text(
                            'Enabled',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'title'),
                          ),
                          Switch(
                            activeTrackColor: Colors.red[400],
                            activeColor: Colors.red,
                            value: toggleValue1,
                            onChanged: (value) {
                              setState(() {
                                toggleValue1 = value;
                              });
                            },
                          ),
                        ]),
                        SizedBox(
                          height: mheight * 0.02,
                        ),
                        Center(
                            child:
                                BlocListener<AddProductBloc, AddProductState>(
                          listener: (context, state) {
                                   if(state is AddProductblocLoading){
                                     Center(child: CircularProgressIndicator(),);
                                   }if(state is AddProductblocLoaded){

                                   }
                          },
                          child: GestureDetector(onTap: (){
                            BlocProvider.of<AddProductBloc>(context).add(
                               FetchAddProduct(shopId: 1, is_recommended: 1, is_veg: 1, cooking_time: int.parse(time1.text), category_id: 140, is_active: 1, image_extension: '', image: '', description: description1.text, price:int.parse( price1.text), name: productName1.text,)
                            );},
                            child: Container(
                              height: mheight * 0.05,
                              width: mwidth * 0.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xffFF0000),
                              ),
                              child: Center(
                                child: Text('Update',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'title',
                                        color: Color(0xffffffff))),
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ])),
            );
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
