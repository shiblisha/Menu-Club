import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_club/Bloc/CategoryBloc/category_bloc.dart';
import 'package:menu_club/main.dart';

import '../../../Repository/ModelClass/CategoryModel.dart';
import 'CategoryDialog.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

List<bool> _toggleValue = [];
late CategoryModel categories;

final picker = ImagePicker();
TextEditingController name = TextEditingController();

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(FetchCategory(shopId: 1));
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CategoryDialog()));},

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
              Center(child: Expanded(
                child: SizedBox(
                  child: BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                      if (state is CategoryblocLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is CategoryblocLoaded) {
                        categories =
                            BlocProvider
                                .of<CategoryBloc>(context)
                                .categoryData;
                        var size = MediaQuery
                            .of(context)
                            .size;
                        final double itemHeight = mheight * 0.25;
                        final double itemWidth = size.width / 2.5;

                        return GridView.count(
                            childAspectRatio: (itemWidth / itemHeight),
                            padding: EdgeInsets.only(
                                top: mheight * 0.026,
                                left: mwidth * 0.02,
                                right: mwidth * 0.015),
                            crossAxisCount: 3,
                            mainAxisSpacing: mwidth * 0.05,
                            // Vertical spacing
                            crossAxisSpacing: mwidth * 0.05,
                            // Horizontal spacing

                            shrinkWrap: true,
                            children:
                            List.generate(categories.payload!.data!.length,
                                growable: false, (index) {
                                  return Card(
                                    elevation: 2.2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      height: mheight * 0.2,
                                      // Set the desired image height
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xff95BDC6).withOpacity(
                                            0.22),
                                      ),
                                      child: Stack(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: mheight * 0.002,),
                                              Center(
                                                child: Container(
                                                  width: mwidth * 0.266,

                                                  height: mheight * 0.13,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .only(
                                                          topLeft: Radius
                                                              .circular(10),
                                                          topRight:
                                                          Radius.circular(10))),
                                                  // Set the desired height
                                                  child: Image.network(
                                                    basePath +
                                                        categories.payload!
                                                            .data![index]
                                                            .imageUrl
                                                            .toString(),
                                                    fit: BoxFit
                                                        .fill, // Adjust the fit property as needed
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: mwidth * 0.02),
                                                child: Text(
                                                  categories.payload!
                                                      .data![index].name,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    fontFamily: 'title',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Positioned(
                                              left: mwidth * 0.17,
                                              child: Image.asset(
                                                "assets/edit.png",
                                                height: mheight * 0.05,
                                              ))
                                        ],
                                      ),
                                    ),
                                  );
                                }));
                      }
                      if (state is CategoryblocError) {
                        return Center(
                          child: Text("Error"),
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

}

