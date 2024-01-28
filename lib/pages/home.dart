import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

   Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ?? false ? Colors.blue : Colors.indigo[700]!;

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/${bgImage}')
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/location');
                      },
                      child: Text(
                        'Edit Location',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    )
                  )
                ]
              ),
            ),
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
