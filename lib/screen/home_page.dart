
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (timer) {
      final countProvider = Provider.of<CountProvider>(context, listen: false);
      countProvider.updateCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Whole widget Build");
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text("Provider",),centerTitle: true,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Consumer<CountProvider>(
                builder: (context, value, child) {
                  //print("Only this widget Build");
                  return Text(
                    value.count.toString(), style: const TextStyle(fontSize: 50),
                  );
                },
              )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.updateCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
