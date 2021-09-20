import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Expandable FAB'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final isDialOpen = ValueNotifier(false);


  @override
  Widget build(BuildContext context) {
    return WillPopScope(  //back property in app
      onWillPop: () async{
        if(isDialOpen.value){
          isDialOpen.value = false;
          return false;
        }
        else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.black,
        overlayColor: Colors.brown,
        overlayOpacity: 0.4,
        spacing: 12,
        spaceBetweenChildren: 12,
        closeManually: true,
        openCloseDial: isDialOpen,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.mail),
            label: 'Mail',
            onTap: () => showToast('Selected Mail..'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.verified_user),
            label: 'Security',
          ),
          SpeedDialChild(
            child: const Icon(Icons.add_photo_alternate_outlined),
            label: 'Gallery',
          ),
        ],
        ),
      ),
    );

  }
}

showToast(String message) {
  Fluttertoast.cancel();
     Fluttertoast.showToast(msg:message,fontSize :18);
}
