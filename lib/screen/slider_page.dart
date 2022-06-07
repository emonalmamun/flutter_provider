import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/slider_provider.dart';
import 'package:provider/provider.dart';
class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  //double value = 1.0;
  @override
  Widget build(BuildContext context) {
    print("Build");
    //final sliderProvider = Provider.of<SliderProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text("Provider",),centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<SliderProvider>(builder: (BuildContext context, value, Widget? child) {
              return Slider(
                  value: value.value,
                  onChanged: (val){
                    value.updateValue(val);
                  }
              );
            },
            ),
            Consumer<SliderProvider>(builder: (BuildContext context, value, Widget? child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value),
                      ),
                      child: const Center(child: Text("Container 1")),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(value.value),
                      ),
                      child: const Center(child: Text("Container 2",)),
                    ),
                  )
                ],
              );
            },
            ),
          ],
        ),
      ),
    );
  }
}
