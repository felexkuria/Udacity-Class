import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/model/likes.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Likes(), child: const ProviderApp()));
}

class ProviderApp extends StatelessWidget {
  const ProviderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: Colors.lightGreen.shade100, primarySwatch: Colors.green),
      home: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello World has ${context.read<Likes>().likes} likes",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  context.read<Likes>().isToggled();
                },
                icon: const Icon(Icons.favorite_border),
                label: const Text("Like")),
          ],
        ),
      ),
    );
  }
}
