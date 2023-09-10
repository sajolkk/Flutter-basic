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
      home: const MyHomePage(title: 'Grid View'),
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

  callBack(){
    print('You clicked me!!!');
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var arrayColors = [
      Colors.redAccent,
      Colors.green,
      Colors.blueGrey,
      Colors.orange,
      Colors.greenAccent,
      Colors.blueAccent,
      Colors.amberAccent,
      Colors.deepPurple,
      Colors.cyan,
      Colors.redAccent,
      Colors.green,
      Colors.blueGrey,
      Colors.orange,
      Colors.greenAccent,
      Colors.blueAccent,
      Colors.amberAccent,
      Colors.deepPurple,
      Colors.cyan,
      Colors.blue,
      Colors.lightBlue,
      Colors.cyanAccent,
      Colors.pink,
      Colors.purple,
      Colors.pinkAccent,
    ];


    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      // GridView.count(crossAxisCount: 4
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 450,
              child: GridView.extent(
                maxCrossAxisExtent: 150,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: [
                  for (int i = 0; i < arrayColors.length; i++)
                    Container(
                      color: arrayColors[i],
                      child: Center(
                        child: Text(
                          "${i + 1} of ${arrayColors.length}",
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  Container(
                    color: Colors.deepPurple,
                    child: Center(child: Text('I am trying to learn Flutter.')),
                  ),
                  Container(
                    color: Colors.lightGreenAccent,
                    child: ElevatedButton(
                        onPressed: callBack,
                        child: Text('Click Me...')
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 325,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5
                ),
                itemBuilder: (context, index) {
                  return Container(color: arrayColors[index],);
                }, itemCount: arrayColors.length,),
          )
        ],
      ),
    );
  }
}
