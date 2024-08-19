import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';

class CounterAppSetstate extends StatefulWidget {
  const CounterAppSetstate({super.key});

  @override
  State<CounterAppSetstate> createState() => _CounterAppSetstateState();
}

class _CounterAppSetstateState extends State<CounterAppSetstate> {
  int counter = 1;

  @override
  void initState() {
    //digunakan untuk print bagian ketika melakukan pemanggilan basic
    DMethod.printBasic('initState() - CounterAppSetState');
    super.initState();
  }

  @override
  void dispose() {
    DMethod.printBasic('dispose() - CounterAppSetState');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DMethod.printBasic('build() - CounterAppSetState');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.filled(
              onPressed: () {
                counter -= 1;
                // Change state without state management (to trigger change for state)
                setState(() {});
              },
              icon: const Icon(Icons.remove),
            ),
            const SizedBox(width: 20),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(width: 20),
            IconButton.filled(
              onPressed: () {
                counter += 1;
                // Change state without state management (To Trigger change for state)
                setState(() {});
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

// kelemahan dari set state adalah aplikasi akan berat karena perubahan state di
// ubah dengan semua yang ada di method build
// bukan hanya angka pada counter nya saja (Sehingga kedepannya akan memberatkan)
// dalam perubahan nya
