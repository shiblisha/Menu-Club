import 'package:flutter/material.dart';
class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
      ),
      body: const Center(child: Text("COMING SOON",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),),
    );
  }
}
