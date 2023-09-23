import 'package:flutter/material.dart';
import 'package:switching_screen/main.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switching Screen'),
      ),
      body: Center(
        child: Container(
          color: Colors.deepPurpleAccent,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text('Welcome to my app', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500),),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Home Page')));
                  },
                  child: Text('Got to Home Page')),
            ],
          ),
        ),
      ),
    );
  }
}
