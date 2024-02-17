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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
        useMaterial3: false,
      
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
  int _counter = 0;
  bool _hide = false;

  void _Visible() {
  setState(() {
    _hide = !_hide;
  });
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),

        actions: <Widget>[

          

        ],
      ),
      body:SingleChildScrollView(
      child: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
        
children: <Widget>[
  Padding(
    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
    child: SizedBox(
      height: 85,
      width: 85,
      child: ClipOval(
        child: Image.asset(
          "assets/flutterlogo.png",
          fit: BoxFit.cover,
        ),
      ),
    ),
  ),
   Padding(
   padding: EdgeInsets.fromLTRB(30.0, 20.0, 20.0, 0.0),
    child: TextField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Email',
    ),
  ),
   ),
   Padding(
        padding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 0.0),
    child: TextField(
       obscureText: _hide,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Password',
      suffixIcon: IconButton(
        icon: Icon(Icons.remove_red_eye_rounded),
        onPressed: _Visible)

    ),
  ),
   ),
     
Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 5.0, 0.0),
child: Align(
  alignment: Alignment.bottomRight,
  child: ElevatedButton(
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
   
  ),
  child: Text(
    'Login',
    
  ),
  onPressed: () {},
)
),
),

   Text(
    'New User? Create Account',
    style: const TextStyle(fontWeight: FontWeight.bold),
  ),
   Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0), 
   child: Text(
    'Forgot Password?',
    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan[800]),
  ),
   ),

   
],



          
          
        ),
       
      ),
      ),
    );
  }
}    
      
