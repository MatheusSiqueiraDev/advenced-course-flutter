import 'package:flutter/material.dart';
import 'package:gerenciado_estado_geral/controllers/state_observable.dart';
import 'package:gerenciado_estado_geral/provider/counter.dart';

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
      ),
      home: const MyHomePage(title: 'Gerenciamento de Estado Geral'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Counter counterProvider = Counter();
  final StateObservable<int> stateCount = StateObservable<int>(0);

  @override
  void initState() {
    counterProvider.addEventListener(callBack);
    stateCount.addEventListener(callBack);
    super.initState();
  }

  void callBack() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '${counterProvider.counterValue}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text('State Observable'),
            Text(
              '${stateCount.state}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () => stateCount.state++, 
              child: Text('Apertar')
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterProvider.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods./ This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    counterProvider.removeEventListener(callBack);
    stateCount.removeEventListener(callBack);
    super.dispose();
  }
}
