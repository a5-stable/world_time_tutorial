import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  child: Text('Edit Location'),
              )
            ]
          )
      ),
    );
  }
}

// stateful widget lifecycle
// initState(): runs once when the widget is created
// build(): runs multiple times, every time the state object changes
// setState(): runs every time the state object changes
// dispose(): runs once when the widget is removed from the tree
