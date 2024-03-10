import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myproject/provider/count_provider.dart';
import 'package:myproject/provider/count_provider.dart';
import 'package:provider/provider.dart';

class StatefulScreen extends StatefulWidget {
  const StatefulScreen({super.key});

  @override
  State<StatefulScreen> createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  @override
  void initState() {
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);

    Timer.periodic(const Duration(seconds: 2), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Consumer<CountProvider>(
            builder: (context, value, child) {
              print('this widget builds');
              return Text(
                value.x.toString(),
                style: const TextStyle(fontSize: 50),
              );
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
