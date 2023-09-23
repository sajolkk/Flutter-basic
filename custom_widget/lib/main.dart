import 'package:custom_widget/ui_helper/text_theme.dart';
import 'package:custom_widget/widget/rounded_btn.dart';
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
      home: const MyHomePage(title: 'Custom Widget'),
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
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            // call cartitem widget
            CartItem(),

            // call contact widget
            Contact(),

            // call sub item widget
            SubItem(),

            // buttons
            Buttons(),

            // call bottom menu
            BottomMenu(),
          ],
        ),
      ),
    );
  }
}

// cart item class
class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
          color: Colors.greenAccent,
          child: ListView.builder(
            itemBuilder: (context, index) => SizedBox(
              width: 100,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
        ));
  }
}

// contact class
class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        color: Colors.blue,
        child: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
              ),
              title: Text('Name'),
              subtitle: Text('Mobile No'),
              trailing: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
          itemCount: 10,
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }
}

// button
class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RoundedButton(
              btnName: 'Login',
              btnIcon: Icon(
                Icons.login,
                color: Colors.white70,
              ),
              callback: () {
                print('Login');
              },
              textStyle: mTextStyle2(
                  textColor: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          RoundedButton(
            btnName: 'Register',
            btnIcon: Icon(
              Icons.create,
              color: Colors.white,
            ),
            textStyle: mTextStyle2(
                textColor: Colors.white, fontWeight: FontWeight.w500),
            callback: (){
              print("Register");
            },
          ),

        ],
      ),
    );
  }
}

// sub item class
class SubItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          color: Colors.deepPurple,
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10, top: 15, bottom: 15),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.green,
                ),
                child: Center(
                    child: Text(
                  "${index + 1}",
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )),
              ),
            ),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
        ));
  }
}

// bottom menu class
class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.greenAccent,
                    child: Center(
                        child: Text(
                      "${index + 1}",
                      style: TextStyle(color: Colors.deepPurple, fontSize: 30),
                    )),
                  );
                },
                itemCount: 6,
              ),
            )));
  }
}
