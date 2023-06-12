import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Categorys/category.dart';
class OutletInfo extends StatefulWidget {
  const OutletInfo({Key? key}) : super(key: key);

  @override
  State<OutletInfo> createState() => _OutletInfoState();
}
File? _image;

class _OutletInfoState extends State<OutletInfo> {
  @override
  Widget build(BuildContext context) {

    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Row(
               children: [
                 IconButton(
                     onPressed: () {
                       Navigator.of(context).pop();
                     },
                     icon: Icon(
                       Icons.arrow_back,
                       color: Colors.black,
                     )),
                 Center(
                     child: Text(
                       "Order Details",
                       style: TextStyle(
                           fontFamily: 'title',
                           fontWeight: FontWeight.w600,
                           fontSize: 20,
                           color: Color(0xff000000)),
                     )),
               ],
             ),
              SizedBox(height: mheight*0.02,),
              Center(
                child: Container(
                  height: mheight*0.06,
                  width: mwidth*0.9,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding:  EdgeInsets.only(left: mwidth*0.02),
                    child: TextFormField(validator: (value) {
                      if (value == null ||
                          value.isEmpty) {
                        return 'Field Should Not Be Empty';
                      }
                      return null;
                    },
                      // controller: breed,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                       hintText: "Store Name",
                        hintStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:  Color(0xff4B4B4B)),
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: mheight*0.02,),
              Center(
                child: GestureDetector(
                  onTap: () {
                    getGalleryImage();
                  },
                  child: _image == null
                      ? SizedBox(
                        height: mheight * 0.15,
                        width: mwidth * 0.9,
                        child: Image.asset("assets/upload logo.png",


                        ),
                      )
                      : SizedBox(
                    height: mheight * 0.3,
                    width: mwidth * 0.6,
                       child: Image.file(
                      _image!.absolute,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: mheight*0.02,),
              Center(
                child: Container(
                  height: mheight*0.06,
                  width: mwidth*0.9,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding:  EdgeInsets.only(left: mwidth*0.02),
                    child: TextFormField(validator: (value) {
                      if (value == null ||
                          value.isEmpty) {
                        return 'Field Should Not Be Empty';
                      }
                      return null;
                    },
                      // controller: breed,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:  Color(0xff4B4B4B)),
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: mheight*0.02,),
              Center(
                child: Container(
                  height: mheight*0.06,
                  width: mwidth*0.9,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding:  EdgeInsets.only(left: mwidth*0.02),
                    child: TextFormField(validator: (value) {
                      if (value == null ||
                          value.isEmpty) {
                        return 'Field Should Not Be Empty';
                      }
                      return null;                },
                      // controller: breed,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: "Contact Number",
                        hintStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:  Color(0xff4B4B4B)),
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: mheight*0.02,),
              Center(
                child: Container(
                  height: mheight*0.13,
                  width: mwidth*0.9,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding:  EdgeInsets.only(left: mwidth*0.02),
                    child: TextFormField(validator: (value) {
                      if (value == null ||
                          value.isEmpty) {
                        return 'Field Should Not Be Empty';
                      }
                      return null;                },
                      // controller: breed,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: "Address",
                        hintStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:  Color(0xff4B4B4B)),
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: mheight*0.02,),
              Center(
                child: Container(
                  height: mheight*0.13,
                  width: mwidth*0.9,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding:  EdgeInsets.only(left: mwidth*0.02),
                    child: TextFormField(validator: (value) {
                      if (value == null ||
                          value.isEmpty) {
                        return 'Field Should Not Be Empty';
                      }
                      return null;                },
                      // controller: breed,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: "Description",
                        hintStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color:  Color(0xff4B4B4B)),
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: mheight*0.02,),
              Center(child:
                GestureDetector(
                  onTap: () {

                  },
                  child: Center(
                    child: Container(
                      height: mheight*0.06,
                      width: mwidth*0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text("Save"),
                      ),
                    ),
                  ),
                ),

              ),
              SizedBox(height: mheight*0.05,)
            ],
          ),
        ),
      ),
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
  @override
  void dispose() {
    _image = null;
    super.dispose();
  }
}
