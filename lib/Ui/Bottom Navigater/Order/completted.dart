import 'package:flutter/material.dart';
class ComplettedPage extends StatefulWidget {
  const ComplettedPage({Key? key}) : super(key: key);

  @override
  State<ComplettedPage> createState() => _ComplettedPageState();
}

class _ComplettedPageState extends State<ComplettedPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Container(
        color: Colors.red,height: 10,width: 10,
      );
  }
    );}}
