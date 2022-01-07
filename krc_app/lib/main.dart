import 'package:flutter/material.dart';

import 'widgets/TrainSelection.dart';

void main() {
  runApp(KrcApp());
}

class KrcApp extends StatefulWidget {
  @override
  State<KrcApp> createState() => _KrcAppState();
}

class _KrcAppState extends State<KrcApp> {
//  const KrcApp({Key? key}) : super(key: key);
  final List<String> _stations = [
    "Nairobi Teriminus",
    'One',
    'Two',
    'Free',
    'Four'
  ];

  String _string = "Select";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      )),
      home: Column(
        children: [
          Container(
            height: 100,
            color: const Color(0x0fffffff),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    "data:image/jpeg;base64,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",
                    fit: BoxFit.cover,
                    height: 50,
                  ),
                  Text(
                    'Book  a Train',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'Stations',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'About Us',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'Contact Us',
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
            ),
          ),
          Container(
              height: 250,
              color: const Color(0xFF821323),
              child: Center(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Madaraka Express -Online Booking",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BookingSeceletion(),
                        // BookingSeceletion(),
                        // BookingSeceletion(),
                        Container(
                          color: Colors.orange,
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Book A Train",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
