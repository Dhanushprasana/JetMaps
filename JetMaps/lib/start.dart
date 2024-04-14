import 'package:flutter/material.dart';
import 'package:jetmaps/main.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jet Maps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyScaffold()),
        );
      },
      child: Container(
        height: 500, // specify the height you want
        width: 400, // specify the width you want

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/What.jpg'), // Replace 'assets/start_page.png' with your image path
          ),
        ),
      ),
    );
  }
}


