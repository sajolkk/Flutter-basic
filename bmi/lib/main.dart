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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculate your BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.indigo.shade200;
  var resultColor = Colors.deepPurple;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(child: Text(widget.title, style: TextStyle(color: Colors.white),)),
      ),
      body: Container(
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('BMI', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),)),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: wtController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Enter your Weight (in kgs)'),
                  prefixIcon: Icon(Icons.line_weight),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ftController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Enter your Height (in Feet)'),
                  prefixIcon: Icon(Icons.height),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: inController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Enter your Height (in Inch)'),
                  prefixIcon: Icon(Icons.height),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                var wt = wtController.text.toString();
                var ft = ftController.text.toString();
                var inch = inController.text.toString();

                if(wt != "" && ft != "" && inch != ""){
                  var iWt = int.parse(wt);
                  var iFt = int.parse(ft);
                  var iInch = int.parse(inch);

                  var tInch = (iFt * 12) + iInch;
                  var toCm = (tInch * 2.54);
                  var totalM = toCm / 100;

                  var bmi = iWt / (totalM * totalM);
                  var msg = "";
                  if(bmi > 25){
                    msg = "You're Over Weight!";
                    bgColor = Colors.orange.shade200;
                    resultColor = Colors.red;
                  }else if(bmi<18){
                    msg = "You're Under Weight!";
                    bgColor = Colors.red.shade200;
                    resultColor = Colors.red;
                  }else{
                    msg = "You're Healthy.";
                    resultColor = Colors.deepPurple;
                    bgColor = Colors.green.shade200;
                  }

                  result = "$msg \nYour BMI is: ${bmi.toStringAsFixed(2)}";
                }else{
                  resultColor = Colors.red;
                  bgColor = Colors.white70;
                  result = "Please fill all the required required field!";
                }
                setState(() {

                });

              }, child: Text('Calculate', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(result, style: TextStyle(fontSize: 19, color: resultColor, fontWeight: FontWeight.w700),),
            ),
          ],
        ),
      ),
    );
  }
}
