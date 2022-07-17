import 'package:dialogpack_example/input_dialog_sample.dart';
import 'package:dialogpack_example/list_dialog_sample.dart';
import 'package:dialogpack_example/message_dialog_sample.dart';
import 'package:dialogpack_example/sample_widget_input_test.dart';
import 'package:flutter/material.dart';
import 'package:dialogpack/dialogpack.dart';

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
        title: const Text('Dialog Pack'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              height: 40,
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(15,30,15,20),
              child: TextButton(onPressed: (){
                Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (context, _, __) {
                      return const MessageDialogSample();
                    }));
              },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue
                  ),
                  child: const Text("Message Dialog Sample",
                    style: TextStyle(color: Colors.white,fontSize: 16),)),
            ),
            Container(
              height: 40,
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(15,0,15,20),
              child: TextButton(onPressed: (){
                Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (context, _, __) {
                      return const ListDialogSample();
                    }));
              },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue
                  ),
                  child: const Text("List Dialog Sample",
                    style: TextStyle(color: Colors.white,fontSize: 16),)),
            ),

         Container(
              height: 40,
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(15,0,15,20),
              child: TextButton(onPressed: (){
                Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (context, _, __) {
                      return const InputDialogSample();
                    }));
              },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue
                  ),
                  child: const Text("Input Dialog Sample",
                    style: TextStyle(color: Colors.white,fontSize: 16),)),
            ),


          ],
        ),
      )
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void showSnackBar(var text){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$text"),
      duration: const Duration(seconds: 1),),);
  }

  Widget checkButton(bool defaultValue,String text,Function() onChecked){
    return GestureDetector(
      onTap: (){
        onChecked();
      },
      child: Container(color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(value: defaultValue, onChanged: (b){
              onChecked();
            },),
            Text(text)
          ],
        ),
      ),
    );
  }
}





