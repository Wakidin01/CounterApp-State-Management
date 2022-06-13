import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Obx(() => Text("Tekan: ${c.count}"))),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Container(
          margin: EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'CounterApp State Management GetX',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                    child: const Text("-> 2"),
                    onPressed: () => Get.to(Kedua())),
                const SizedBox(height: 20),
                ElevatedButton(
                    child: const Text("-> 3"),
                    onPressed: () => Get.to(Ketiga())),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Kedua extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
        appBar: AppBar(title: Text("Hal 2")),
        body: Center(
            child: Text(
          "${c.count}",
          style: const TextStyle(fontSize: 50, color: Colors.brown),
        )));
  }
}

class Ketiga extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(
        appBar: AppBar(title: Text("Hal 3")),
        body: Center(
            child: Text(
          "${c.count}",
          style: const TextStyle(fontSize: 50, color: Colors.brown),
        )));
  }
}
