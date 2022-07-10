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

  bool showNegativeButton = false;

  bool showNeutralButton = false;

  @override
  void initState() {
    DialogManager.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Dialogs'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(15),
              color: Colors.black.withOpacity(.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Message Dialog",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                  ),),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(value: showNegativeButton, onChanged: (b){
                        setState(() {
                          showNegativeButton = b!;
                        });
                      },),
                      const Text("Show Negative Button")
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(value: showNeutralButton, onChanged: (b){
                        setState(() {
                          showNeutralButton = b!;
                        });
                      },),
                      const Text("Show Neutral Button")
                    ],
                  ),

                  // const SizedBox(height: 5,),
                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(15,5,15,0),
                    child: TextButton(onPressed: (){

                      DialogManager.showMessageDialog(context,
                          messageDialogModel:
                          MessageDialogModel(title: "Welcome",
                          message: "This is a sample message dialog and this is the little gift we have to offer",
                          onPositiveClicked: (){
                          showSnackBar("Clicked Yes");
                          },
                          onNegativeClicked: (){
                            showSnackBar("Clicked No");
                          },
                          onNeutralClicked: (){
                            showSnackBar("Clicked Maybe");
                          },
                          positiveClickText: "Yes, Agree",
                          negativeClickText: showNegativeButton?"No, Ignore":null,
                          neutralClickText: showNeutralButton?"Maybe, Later":null));

                      },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue
                        ),
                        child: const Text("Show Message Dialog",
                          style: TextStyle(color: Colors.white,fontSize: 16),)),
                  ),

                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(15,20,15,20),
                    child: TextButton(onPressed: (){

                      DialogManager.showYesNoDialog(context, message: "Are you sure you are happy?", clickedYes: (){
                        showSnackBar("Clicked Yes");
                      },clickedNo: (){
                        showSnackBar("Clicked No");
                      });

                    },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue
                        ),
                        child: const Text("Show Yes/No Dialog",
                          style: TextStyle(color: Colors.white,fontSize: 16),)),
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(15,0,15,20),
                    child: TextButton(onPressed: (){

                      DialogManager.showSuccessDialog(context,
                          message: "Your image uploaded successfully", clickedYes: (){
                            showSnackBar("Clicked Ok");
                          });

                    },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue
                        ),
                        child: const Text("Show Success Dialog",
                          style: TextStyle(color: Colors.white,fontSize: 16),)),
                  ),

                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(15,0,15,20),
                    child: TextButton(onPressed: (){

                      DialogManager.showFailedDialog(context,
                          message: "Your image failed to upload", clickedYes: (){
                            showSnackBar("Clicked Ok");
                          });

                    },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue
                        ),
                        child: const Text("Show Failed Dialog",
                          style: TextStyle(color: Colors.white,fontSize: 16),)),
                  ),

                ],
              ),
            ),




          ],
        ),
      )
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void showSnackBar(String text){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text),
      duration: const Duration(seconds: 1),),);
  }
}
