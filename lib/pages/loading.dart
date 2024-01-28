import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime worldtime = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await worldtime.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldtime.location,
      'flag': worldtime.flag,
      'time': worldtime.time,
      'isDaytime': worldtime.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
          padding: EdgeInsets.all(50.0),
          child: Center(
            child: SpinKitRotatingCircle(
              color: Colors.white,
              size: 50.0,
            ),
          ),
      ),
    );
  }
}
