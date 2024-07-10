import 'package:flutter/material.dart';

class StateRestorationExample extends StatefulWidget {
  const StateRestorationExample({super.key});

  @override
  State<StateRestorationExample> createState() =>
      _StateRestorationExampleState();
}

class _StateRestorationExampleState extends State<StateRestorationExample>
    with RestorationMixin {
  RestorableTextEditingController nameController =
      RestorableTextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("State Restoration")),
      body: Column(
        children: [
          TextFormField(
            controller: nameController.value,
            decoration: const InputDecoration(hintText: "Name"),
          ),
        ],
      ),
    );
  }

  @override
  String? get restorationId => "state_example";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(nameController, "first_name");
  }
}
