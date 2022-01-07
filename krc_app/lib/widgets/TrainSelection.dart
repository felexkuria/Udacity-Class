import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BookingSeceletion extends StatefulWidget {
  BookingSeceletion({Key? key}) : super(key: key);

  @override
  State<BookingSeceletion> createState() => _BookingSeceletionState();
}

class _BookingSeceletionState extends State<BookingSeceletion> {
  String dropDownValue = "Select";
  final List<String> _trainType = ["Inter County", 'Express'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Train Type",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Material(
          child: DropdownButton<String>(
            value: _trainType.isNotEmpty ? null : dropDownValue,
            disabledHint: const Text(" Can't Select"),

            hint: const Text("Select.."),
            icon: const Icon(Icons.arrow_downward),
            style: const TextStyle(color: Colors.black),
            // onChanged: null,
            onChanged: (String? newValue) {
              setState(() {
                dropDownValue = newValue!;
              });
            },
            items: _trainType.map((e) {
              return DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
