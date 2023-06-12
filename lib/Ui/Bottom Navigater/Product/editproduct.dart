import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Categorys/category.dart';
class EditProduct extends StatefulWidget {
 final  bool togglevalue;
  const EditProduct({Key? key, required this.togglevalue}) : super(key: key);

  @override
  State<EditProduct> createState() => _EditProductState();
}


File? _image;
class _EditProductState extends State<EditProduct> {

  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery.of(context).size.width;
    var mheight = MediaQuery.of(context).size.height;
bool toggle=widget.togglevalue;
print(toggle);
      return Container(
        height: mheight * 17.9,
        width: mwidth * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          color: Colors.white,
        ),
        child: ListView(children: [
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
              Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    // Adjust the scale value to change the size of the switch
                    child: Switch(
                      value: toggle,
                      onChanged: (value) {
                        setState(() {
                          toggle = value;
                          print(toggle);
                        });
                      },
                      activeTrackColor: Colors.red[400],
                      activeColor: Colors.red,
                    ),
                  ),
                  Text(
                    toggle == true ? "Enabled" : "Disabled",
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
        ]),
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