import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var number1 = TextEditingController();
  var number2 = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Simple Calculator',
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: Colors.deepPurpleAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: number1,
                decoration: InputDecoration(
                  hintText: 'Enter Number One',
                  fillColor: Colors.deepPurple[150],
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: number2,
                decoration: InputDecoration(
                  hintText: 'Enter Number Two',
                  fillColor: Colors.deepPurple[150],
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {
                    var no1 = int.parse(number1.text.toString());
                    var no2 = int.parse(number2.text.toString());
                    var sum = no1 + no2;
                    result = "The sum of $no1 and $no2 is $sum";
                    setState(() {

                    });
                  }, child: Text('Add (+)')),
                  ElevatedButton(onPressed: () {
                    var no1 = int.parse(number1.text.toString());
                    var no2 = int.parse(number2.text.toString());
                    var sub = no1 - no2;
                    result = "The substraction $no1 and $no2 is $sub";
                    setState(() {

                    });
                  }, child: Text('Sub (-)')),
                  ElevatedButton(onPressed: () {
                    var no1 = int.parse(number1.text.toString());
                    var no2 = int.parse(number2.text.toString());
                    var mult = no1 * no2;
                    result = "The multiplication $no1 and $no2 is $mult";
                    setState(() {

                    });
                  }, child: Text('Mult (*)')),
                  ElevatedButton(onPressed: () {
                    var no1 = int.parse(number1.text.toString());
                    var no2 = int.parse(number2.text.toString());
                    var div = no1 / no2;
                    result = "The division $no1 and $no2 is ${div.toStringAsFixed(2)}";
                    setState(() {

                    });
                  }, child: Text('Div (/)')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                result,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
