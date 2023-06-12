import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'category.dart';
class CategoryDialog extends StatefulWidget {
  const CategoryDialog({Key? key}) : super(key: key);

  @override
  State<CategoryDialog> createState() => _CategoryDialogState();
}
bool toggle = false;
File? _image;

TextEditingController name = TextEditingController();
class _CategoryDialogState extends State<CategoryDialog> {
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
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
              SizedBox(
                height: mheight * 0.02,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Enabled',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,fontFamily: 'title'),),
              ],),
              SizedBox(
                height: mheight * 0.02,
              ),
              GestureDetector(
                onTap: () {

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
                      child: Text("Save"),
                    ),
                  ),
                ),
              ),
            ],
          )),
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
  void dispose() {
    _image = null;
    super.dispose();
  }
}
