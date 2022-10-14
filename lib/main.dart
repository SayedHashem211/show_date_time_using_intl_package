import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Show Date & Time Using intl Package',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DateApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DateApp extends StatefulWidget {
  const DateApp({Key? key}) : super(key: key);

  @override
  State<DateApp> createState() => _DateAppState();
}

class _DateAppState extends State<DateApp> {
  String weekDay = "";
  String date = "";
  String timeNow = "";

  changeEverySec() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        weekDay = DateFormat("EEEE").format(DateTime.now());
        date = DateFormat("MMMM d, y").format(DateTime.now());
        timeNow = DateFormat('hh : mm : ss a').format(DateTime.now());
      });
    });
  }

  @override
  initState() {
    super.initState();
    changeEverySec();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Time & Date App",
          style: TextStyle(
              fontSize: 40, color: Colors.white38, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 57, 73, 80),
      ),
      backgroundColor: const Color.fromARGB(255, 33, 40, 43),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today's Date is $weekDay",
              style: const TextStyle(
                  fontSize: 38,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 22,
            ),
            Text(
              date,
              style: const TextStyle(
                  fontSize: 38,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 22,
            ),
            Text(
              timeNow,
              style: const TextStyle(
                  fontSize: 38,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
