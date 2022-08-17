
import 'package:digital_safe/pages/welcome.dart';
import 'package:flutter/material.dart'; // this is where the stateful awidgets come from

void main() async{
WidgetsFlutterBinding.ensureInitialized(); // binding of all widgets so that all the processes start correctly
  runApp(const MyApp()); // this is the starting point of the app
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // removes debug banner on the right side of the app
      title: 'Digital Safe', // App title to be shown i user desktop
      theme: ThemeData(
        primarySwatch: Colors.grey, // pink color for most of the widgets in the app
      ),
      home: const Welcome(), // My app class returns the welcome page for the user
    );
  }
}

