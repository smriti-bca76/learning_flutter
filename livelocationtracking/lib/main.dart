import 'package:flutter/material.dart';
import 'package:livelocationtracking/navigation_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: false,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController latController = TextEditingController();
  TextEditingController lngController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Live Location',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your location',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: latController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Latittude'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: lngController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Latitude'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NavigationScreen(
                          double.parse(latController.text),
                          double.parse(lngController.text))));
                },
                child: Text(
                  'Get Directions',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
    //);
  }
}
