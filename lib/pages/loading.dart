import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  static String time = 'loading...';

  void setupWorldTime() async {
    WorldTime worldtime = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await worldtime.getTime();
    setState(() {
      time = worldtime.time.toString();
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
      body: Padding(
          padding: EdgeInsets.all(50.0),
          child: Text(time),
      ),
    );
  }
}
