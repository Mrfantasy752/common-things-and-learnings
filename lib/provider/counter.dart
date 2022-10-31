import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterPart extends StatelessWidget {
  const CounterPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CounterApp"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have pressed this many times",
              textScaleFactor: 1.5,
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            Consumer<CounterModel>(builder: (context, counter, child) {
              return Text(counter.value.toString());
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Provider.of<CounterModel>(context, listen: false).increment();
        // context.watch<CounterModel>().increment();
      }),
    );
  }
}

class CounterModel extends ChangeNotifier {
  int value = 0;
  increment() {
    value++;
    notifyListeners();
  }
}
