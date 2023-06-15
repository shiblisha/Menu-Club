import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Bloc/CategoryBloc/category_bloc.dart';
import '../../../Bloc/UpdateCategoryBloc/update_category_bloc.dart';
import 'category.dart';

class UpdateCategory extends StatefulWidget {
  final int categoryid;
  final int Is_active;
  final String image;
  final String name;

  const UpdateCategory(
      {Key? key, required this.categoryid, required this.Is_active, required this.name, required this.image})
      : super(key: key);

  @override
  State<UpdateCategory> createState() => _UpdateCategoryState();
}

bool toggleValue = false;
File? _image;
TextEditingController name = TextEditingController();

class _UpdateCategoryState extends State<UpdateCategory> {
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
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)),
        contentPadding: EdgeInsets.symmetric(
          vertical: mheight * 0.8,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: mwidth * 0.54,
                ),
                IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ],
            ),


            SizedBox(
              height: mheight * 0.01,
            ),
            Container(
              height: mheight * 0.065,
              width: mwidth * 0.9,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.only(left: mwidth * 0.02),
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    hintText: "Category Name",
                    hintStyle: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mheight * 0.01,
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
                  child: Image.asset("assets/upload image.png",


                  ),
                ),
              )
                  : Container(
                height: mheight * 0.3,
                width: mwidth * 0.6,
                child: Image.file(
                  _image!.absolute,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: mwidth * 0.04,),
                Padding(
                  padding: EdgeInsets.only(top: mheight * 0.02),
                  child: Text('Enabled', style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'title'),),
                ),
                SizedBox(width: mwidth * 0.3,),
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
              ],),
            SizedBox(
              height: mheight * 0.02,
            ),
            BlocListener<UpdateCategoryBloc, UpdateCategoryState>(
              listener: (context, state) {
                if (state is UpdateCategoryBlocLoading) {
                  showDialog(
                      context: context,
                      builder: (BuildContext a) =>
                      const Center(child: CircularProgressIndicator()));
                }
                if (state is UpdateCategoryBlocLoaded) {
                  print('loaded');
                  BlocProvider.of<CategoryBloc>(context).add(FetchCategory(shopId: 1));
                  Navigator.of(context).pop();
                }
                if (state is UpdateCategoryBlocError) {
                  showDialog(
                      context: context,
                      builder: (BuildContext a) =>
                      const Center(child: Text("ERROR")));
                }
              },
              child: GestureDetector(
                onTap: () {
                  BlocProvider
                      .of<UpdateCategoryBloc>(context)
                      .add(FetchUpdateCategory(ShopId: 1,
                      image_extension: '',
                      is_active: widget.Is_active,
                      image: widget.image,
                      name: widget.name,
                      CategoryId
                      :widget.categoryid));
                  },
                child: Center(
                  child: Container(
                    height: mheight * 0.05,
                    width: mwidth * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text("Update",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight
                            .w400, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
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

  void dispose() {
    _image = null;
    super.dispose();
  }
}
