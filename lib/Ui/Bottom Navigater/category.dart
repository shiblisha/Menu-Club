import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_club/Bloc/CategoryBloc/category_bloc.dart';

import '../../Repository/ModelClass/CategoryModel.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

List<bool> _toggleValue = [];
late CategoryModel categories;

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(FetchCategory(shopId: 1));
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
            "category",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    "Add Category",
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
              child: Container(
                  height: mheight,
                  width: mwidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[300]),
                  child: BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                      if (state is CategoryblocLoading){
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is CategoryblocLoaded){
                        categories= BlocProvider.of<CategoryBloc>(context).categoryData;

                      return ListView.builder(
                          itemCount: categories.payload!.data!.length,
                          itemBuilder: (ctx, index) {
                            for (int i = 1; i <= 10; i++) {
                              _toggleValue.add(false);
                            }
                            return Row(
                              children: [
                                SizedBox(width: mwidth*0.02,),
                                SizedBox(
                                  height: mheight*0.03,
                                  width: mwidth*0.45,

                                  child: Text(
                                    categories.payload!.data![index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16),
                                  ),
                                ),

                                Text("Edit",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16)),
                                SizedBox(
                                  width: mwidth * 0.02,
                                ),
                                Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: mwidth * 0.2,
                                ),
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
                            );
                          });}
                      if (state is CategoryblocError){
                        return Center(
                          child: Text("Error"),
                        );
                      }else {
                        return
                            SizedBox();
                      }
                    },
                  )),
            )),
          ],
        ),
      ),
    );
  }
}
