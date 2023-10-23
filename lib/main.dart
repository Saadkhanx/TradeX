import 'package:flutter/material.dart';
import 'package:trading_app/screens/profile.dart';
import 'package:trading_app/screens/trade.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trading App',
      theme: ThemeData(
        // colorScheme:
        //     ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget? content;
  List<Widget>screens=[
    TradeScreen(),

  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    content=ProfileScreen();
  }
    var navIndex = 1;
      void changeScreen(int index) {
    setState(() {
      navIndex= index;
      content=TradeScreen();

    });
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
          title: Text('TradeX', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.grey[800]),
      body: TradeScreen(),
      // bottomNavigationBar: BottomNavigationBar(
      //   items:const <BottomNavigationBarItem> [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.auto_graph,
      //       ),
      //       label: 'Trade',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_pin),
      //       label: 'Profile',
      //     )
      //   ],
      //   backgroundColor: Colors.grey[800],
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.white38,
      //   currentIndex: navIndex,
      //   selectedFontSize: 14,
      //   onTap: (index){changeScreen(index);},

      // ),
    );
  }
}

