import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: '/1',
      routes: {
        '/1': (context) => const MyHomePage(title: 'Hal 1'),
        '/2': (context) => const Halaman2(),
        '/3': (context) => const Halaman3(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'CounterApp State Management Default',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(height: 14),
              ElevatedButton(
                child: const Text('Hal 2'),
                onPressed: () {
                  Navigator.pushNamed(context, '/2',
                      arguments: Data('$_counter', 'Hal 2'));
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Hal 3'),
                onPressed: () {
                  Navigator.pushNamed(context, '/3',
                      arguments: Data('$_counter', 'Hal 3'));
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Tambahkan',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Halaman2 extends StatelessWidget {
  const Halaman2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(args.count,
                style: const TextStyle(fontSize: 60, color: Colors.brown)),
          ),
        ],
      ),
    );
  }
}

class Halaman3 extends StatelessWidget {
  const Halaman3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(args.count,
                style: const TextStyle(fontSize: 60, color: Colors.brown)),
          ),
        ],
      ),
    );
  }
}

class Data {
  final String title;
  final String count;

  Data(this.count, this.title);
}
