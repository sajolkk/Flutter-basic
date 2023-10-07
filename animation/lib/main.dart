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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _width = 100.0;
  var _height = 100.0;
  bool trigger = true;
  Decoration myDeco = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: Colors.deepPurpleAccent,
  );

  var myOpacity = 1.0;
  bool isVisible = true;
  String visibility = "Invisible";

  bool isFirst = true;
  String crossBtnText = "Image";

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                duration: Duration(seconds: 3),
                curve: Curves.slowMiddle,
                height: _height,
                width: _width,
                decoration: myDeco,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (trigger) {
                        _height = 200;
                        _width = 50;
                        trigger = false;
                        myDeco = BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepPurple.shade400,
                        );
                      } else {
                        _height = 100.0;
                        _width = 100.0;
                        trigger = true;
                        myDeco = BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.deepPurpleAccent,
                        );
                      }
                    });
                  },
                  child: Text('Animate')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedOpacity(
                opacity: myOpacity,
                curve: Curves.bounceInOut,
                duration: Duration(seconds: 2),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: myDeco,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (isVisible) {
                      myOpacity = 0.0;
                      visibility = "Visible";
                    } else {
                      myOpacity = 1.0;
                      visibility = "Invisible";
                    }
                    isVisible = !isVisible;
                  });
                },
                child: Text(visibility)),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedCrossFade(
                  sizeCurve: Curves.slowMiddle,
                  firstChild: Container(
                    height: 150,
                    width: 150,
                    color: Colors.deepPurple,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          // child: Text("Hey, I'm Sajal and my sweet niece Payal.", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),),
                        ),
                      ],
                    ),
                  ),
                  secondChild: Column(
                    children: [
                      Image.asset('assets/images/payel.jpg',
                        height: 200,
                        width: 200,
                      ),
                      Text("Hey, I'm Sajal and my sweet niece Payal.", style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w700),),
                    ],
                  ),
                  crossFadeState: isFirst? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  duration: Duration(seconds: 2)),

            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                setState(() {
                  if(isFirst){
                    crossBtnText = "Box";
                  }else{
                    crossBtnText = "Image";
                  }
                  isFirst = !isFirst;
                });
              }, child: Text(crossBtnText)),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
