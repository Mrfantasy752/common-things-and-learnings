import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverPodTrial extends ConsumerWidget {
  const RiverPodTrial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    // final greeting = ref.watch(greetingsProvider);
    ref.listen<int>(counterProvider, ((previous, next) {
      if (next > 5) {
        showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: Text("Alert limit reached reset the provider"),
            );
          }),
        );
      }
    }));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(counter.toString()),
            // Text(greeting),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.state).state++,
      ),
    );
  }
}
