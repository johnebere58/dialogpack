import 'package:dialogpack/dialogpack.dart';
import 'package:flutter/material.dart';

class SampleWidget extends StatefulWidget {
  // final String title;
  const SampleWidget({Key? key}) : super(key: key);

  @override
  _SampleWidgetState createState() => _SampleWidgetState();
}

class _SampleWidgetState extends State<SampleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: TextButton(
            onPressed: () {
              DialogManager.showSimpleMessageDialog(context,
                  message: "This is a simple message dialog", title: "Welcome",
              dialogEntrance: DialogEntrance.slide_down);
            },
            child: const Text("Click Me"),
          ),
        ),
      ),
    );
  }
}
