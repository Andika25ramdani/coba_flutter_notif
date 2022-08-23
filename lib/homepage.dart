import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  joinMeeting() async {
    var options = JitsiMeetingOptions(room: 'apadongmeeting')
      ..serverURL = 'https://gpu-esmp.jumpa.id/';
    await JitsiMeet.joinMeeting(options);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Container(
        color: Colors.amber,
        child: Center(
            child: ElevatedButton(
          onPressed: joinMeeting,
          child: const Text('home'),
        )),
      ),
    );
  }
}
