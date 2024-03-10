import 'package:flutter/material.dart';
import 'package:myproject/provider/example_one_provider.dart';
import 'package:provider/provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  // print(value);
                  value.setValue(val);
                });
          }),
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.yellow.withOpacity(value.value)),
                      child: const Center(child: Text('Container 1'))),
                ),
                Expanded(
                  child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.indigoAccent.withOpacity(value.value)),
                      child: Center(
                          child: Text(
                        'Container 2',
                        style: TextStyle(
                            color: Colors.red.withOpacity(value.value)),
                      ))),
                )
              ],
            );
          }),
        ],
      ),
    );
  }
}
