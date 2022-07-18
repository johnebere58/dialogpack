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
              DialogManager.showSimpleListDialog(context,
                  items: [
                    "Apple", "Ball", "Cake"
                  ],
                  onItemSelected: (dynamic result){
                  showSnackBar(result);
              },returnIndexes: true);
            },
            child: const Text("Click Me"),
          ),
        ),
      ),
    );
  }

  void showSnackBar(var text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$text"),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
