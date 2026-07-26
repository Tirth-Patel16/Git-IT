import 'package:flutter/material.dart';

void main() {
  runApp(const SeatLYApp());
}

class SeatLYApp extends StatelessWidget {
  const SeatLYApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 16, 185, 129),
        appBar: AppBar(title: Text('SeatLY')),
        body: Column(
          children: [
            const SizedBox(height: 20),
        Center(
          child: Container(
            height: 77,
            width: 330,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 212, 175, 55),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Column(
                  children: [Text("Total",style: TextStyle(
    fontWeight: FontWeight.bold,
  ),
), SizedBox(height: 4), Text("48",style: TextStyle(
    fontWeight: FontWeight.bold,
  ),
)],
                ),
                Column(
                  children: [
                    Text("Available",style: TextStyle(
    fontWeight: FontWeight.bold,
  ),
),
                    SizedBox(height: 4),
                    Text("32",style: TextStyle(
    fontWeight: FontWeight.bold,
  ),
),
                  ],
                ),
                Column(
                  children: [Text("Booked",style: TextStyle(
    fontWeight: FontWeight.bold,
  ),
), SizedBox(height: 4), Text("10",style: TextStyle(
    fontWeight: FontWeight.bold,
  ),
)],
                ),
                Column(
                  children: [Text("Selected",style: TextStyle(
    fontWeight: FontWeight.bold,
  ),
), SizedBox(height: 4), Text("6",style: TextStyle(
    fontWeight: FontWeight.bold,
  ),
)],
                ),
              ],
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}
