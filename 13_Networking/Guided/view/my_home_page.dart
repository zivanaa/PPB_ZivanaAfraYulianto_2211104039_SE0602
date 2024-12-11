import 'package:flutter/material.dart';
import 'package:pert13/view%20model/counter_controller.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
          // in the middle of the parent.
          child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              controller.counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/detail');
              },
              child: Text('Go to Detail'),
            )
          ],
        ),
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: controller.incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: controller.getsnackbar,
            tooltip: 'SnackBar',
            child: const Icon(Icons.chat),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: controller.decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: controller.getdialog,
            tooltip: 'Dialog',
            child: const Icon(Icons.notifications_active),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: controller.getbottomSheet,
            tooltip: 'Dialog ButtomSheet',
            child: const Icon(Icons.arrow_upward),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
