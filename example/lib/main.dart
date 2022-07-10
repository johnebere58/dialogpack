import 'package:flutter/material.dart';
import 'package:simpledialog/simpledialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Dialog Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key}):super(key:key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    DialogManager.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simle Dialogs'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(onPressed: (){
              DialogManager.showMessageDialog(context,
                  messageDialogModel:
              MessageDialogModel(message: "Hellow Just testing"));
            },
                style: TextButton.styleFrom(
                  primary: Colors.blue
                ),
                child: const Text("Show Message Dialog",
                  style: TextStyle(color: Colors.white),)),

            const SizedBox(height: 10,),
          ],
        ),
      )
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
