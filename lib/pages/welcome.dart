import 'package:digital_safe/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome'), // screen title
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        SizedBox(
          height: 400,
          child: Image.asset('assets/safe.jpg'),),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.pink),
          ),
          onPressed: () async {
            
           await  screenLock(context: context, correctString: "1234",canCancel: false );// authentication for the app happens here
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Home())); // once you authenticate succesfully you will be redirected to the Home screen 
          },
          child: Text('Enter Digital Safe',style: TextStyle(color: Colors.white),),
        ),
      ],)
    );
  }
}
