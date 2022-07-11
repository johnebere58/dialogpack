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

  bool useDarkMode = false;
  bool showNegativeButton = false;
  bool showNeutralButton = false;

  bool searchalble = false;
  bool multipleseclection = false;
  bool returnIndex = false;

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
              margin: const EdgeInsets.fromLTRB(15,15,15,0),
              color: Colors.black.withOpacity(.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Message Dialog",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                  ),),
                  const SizedBox(height: 5,),
                  checkButton(useDarkMode, "Use Dark Mode", (){
                    setState(() {
                      useDarkMode = !useDarkMode;
                      if(useDarkMode)DialogManager.switchToDarkMode();
                      if(!useDarkMode)DialogManager.switchToLightMode();
                    });
                  }),
                 checkButton(showNegativeButton, "Show Negative Button", (){
                    setState(() {
                      showNegativeButton = !showNegativeButton;
                    });
                  }),
                 checkButton(showNeutralButton, "Show Neutral Button", (){
                    setState(() {
                      showNeutralButton = !showNeutralButton;
                    });
                  }),

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

            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.fromLTRB(15,15,15,0),
              color: Colors.black.withOpacity(.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("List Dialog",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                  ),),
                  const SizedBox(height: 5,),
                  checkButton(useDarkMode, "Use Dark Mode", (){
                    setState(() {
                      useDarkMode = !useDarkMode;
                      if(useDarkMode)DialogManager.switchToDarkMode();
                      if(!useDarkMode)DialogManager.switchToLightMode();
                    });
                  }),
                  checkButton(searchalble, "Searchable List", (){
                    setState(() {
                      searchalble = !searchalble;
                    });
                  }),
                  checkButton(multipleseclection, "Allow Multiple Selection", (){
                    setState(() {
                      multipleseclection = !multipleseclection;
                    });
                  }),
                  checkButton(returnIndex, "Return indexes", () {
                    setState(() {
                      returnIndex = !returnIndex;
                    });
                  }
                  ),
                  // const SizedBox(height: 5,),
                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(15,5,15,0),
                    child: TextButton(onPressed: (){

                      DialogManager.showSimpleListDialog(context,
                          items: ["Wallet","Phone","Clock","Coffee"],
                          searchable: searchalble,
                          maxSelections: multipleseclection?3:1,
                          returnIndexes: returnIndex,
                          onItemSelected: (dynamic item){
                             showSnackBar(item);
                          });

                    },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue
                        ),
                        child: const Text("Show Simple List Dialog",
                          style: TextStyle(color: Colors.white,fontSize: 16),)),
                  ),

                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(15,20,15,20),
                    child: TextButton(onPressed: (){

                      DialogManager.showComplexListDialog(context,
                          items: [
                            ListItem(title: "Wallet", subtitle: "How much is in this wallet"),
                            ListItem(title: "Phone", subtitle: "This is my phone"),
                            ListItem(title: "Clock", subtitle: "Please check the time for me"),
                            ListItem(title: "Coffee",  subtitle: "I need a cup of coffee"),
                          ],
                          searchable: searchalble,
                          maxSelections: multipleseclection?3:1,
                          returnIndexes: returnIndex,
                          onItemSelected: (dynamic item){
                            if(multipleseclection && !returnIndex){
                              showSnackBar("${List.generate(item.length, (index) => item[index].title)}");
                            }else {
                              showSnackBar(item);
                            }
                          });

                    },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue
                        ),
                        child: const Text("Show Complex List Dialog 1",
                          style: TextStyle(color: Colors.white,fontSize: 16),)),
                  ),


                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(15,0,15,20),
                    child: TextButton(onPressed: (){

                      DialogManager.showComplexListDialog(context,
                          items: [
                            ListItem(title: "Wallet", icon: Icons.wallet,),
                            ListItem(title: "Phone", icon: Icons.phone_android,),
                            ListItem(title: "Clock", icon: Icons.access_time_outlined,),
                            ListItem(title: "Coffee", icon: Icons.coffee,),
                          ],
                          searchable: searchalble,
                          maxSelections: multipleseclection?3:1,
                          returnIndexes: returnIndex,
                          onItemSelected: (dynamic item){
                            if(multipleseclection && !returnIndex){
                              showSnackBar("${List.generate(item.length, (index) => item[index].title)}");
                            }else {
                              showSnackBar(item);
                            }
                          });

                    },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue
                        ),
                        child: const Text("Show Complex List Dialog 2",
                          style: TextStyle(color: Colors.white,fontSize: 16),)),
                  ),


                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(15,0,15,20),
                    child: TextButton(onPressed: (){

                      DialogManager.showComplexListDialog(context,
                          items: [
                            ListItem(title: "Wallet", icon: Icons.wallet, subtitle: "How much is in this wallet"),
                            ListItem(title: "Phone", icon: Icons.phone_android, subtitle: "This is my phone"),
                            ListItem(title: "Clock", icon: Icons.access_time_outlined, subtitle: "Please check the time for me"),
                            ListItem(title: "Coffee", icon: Icons.coffee, subtitle: "I need a cup of coffee"),
                          ],
                          searchable: searchalble,
                          maxSelections: multipleseclection?3:1,
                          returnIndexes: returnIndex,
                          onItemSelected: (dynamic item){
                            if(multipleseclection && !returnIndex){
                              showSnackBar("${List.generate(item.length, (index) => item[index].title)}");
                            }else {
                              showSnackBar(item);
                            }
                          });

                    },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue
                        ),
                        child: const Text("Show Complex List Dialog 3",
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

  void showSnackBar(var text){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$text"),
      duration: const Duration(seconds: 1),),);
  }
}
