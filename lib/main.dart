import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'count_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('カウンター'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Consumer<CountModel>(builder: (context, model, child) {
                  return Text(
                    '${model.counter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
              ),
            ],
          ),
        ),
        floatingActionButton: Consumer<CountModel>(builder: (context, model, child) {
            return FloatingActionButton(
              onPressed: () {
                model.incrementCounter;
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          }
        ),
      ),
    );
  }
}
