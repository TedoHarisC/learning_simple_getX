import 'package:d_input/d_input.dart';
import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RealtimeInputApp extends StatefulWidget {
  const RealtimeInputApp({super.key});

  @override
  State<RealtimeInputApp> createState() => _RealtimeInputAppState();
}

class _RealtimeInputAppState extends State<RealtimeInputApp> {
  // this is how to call controller in GetX (for being a variable)
  final realtimeInputController = Get.put(RealtimeInputController());

  @override
  void initState() {
    //digunakan untuk print bagian ketika melakukan pemanggilan basic
    DMethod.printBasic('initState() - RealtimeInputApp');
    super.initState();
  }

  @override
  void dispose() {
    // To delete value of state (using force even if it's permanent state will be deleted)
    // the function on dispose deleted state it's for avoid memory leaked
    //Get.delete<RealtimeInputController>(force: true);
    // its can be another alternatif for deleted state (and the delete code was on the controller)
    realtimeInputController.clearState();
    DMethod.printBasic('dispose() - RealtimeInputApp');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DMethod.printBasic('build() - RealtimeInputApp');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realtime Input App'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DInput(
            controller: TextEditingController(),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            radius: BorderRadius.circular(30),
            onChanged: (value) {
              realtimeInputController.input = value!;
            },
          ),
          const SizedBox(height: 20),
          Obx(() {
            return Text(
              realtimeInputController.input,
              style: Theme.of(context).textTheme.displaySmall,
            );
          }),
        ],
      ),
    );
  }
}

//Controller for GetX state management
class RealtimeInputController extends GetxController {
  final _input = ''.obs;
  String get input => _input.value;
  set input(String n) => _input.value = n;

  clearState() {
    Get.delete<RealtimeInputController>(force: true);
  }
}
