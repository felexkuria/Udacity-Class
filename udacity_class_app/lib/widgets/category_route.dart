// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:udacity_class_app/model/uunit.dart';
import 'package:udacity_class_app/widgets/category.dart';

// TODO: Check if we need to import anything

// TODO: Define any constants

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatefulWidget {
  const CategoryRoute({Key? key}) : super(key: key);

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  State<CategoryRoute> createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  /// Returns a list of mock [Unit]s.
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Create a list of the eight Categories, using the names and colors
    // from above. Use a placeholder icon, such as `Icons.cake` for each
    // Category. We'll add custom icons later.

    // TODO: Create a list view of the Categories
    final listView = Container(
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: CategoryRoute._categoryNames.length,
        itemBuilder: (BuildContext context, int index) {
          return Category(
            iconData: Icons.cake,
            string: CategoryRoute._categoryNames[index],
            color: CategoryRoute._baseColors[index],
            units: _retrieveUnitList(CategoryRoute._categoryNames[index]),
          );
        },
      ),
    );

    // TODO: Create an App Bar
    final appBar = AppBar(
      elevation: 0.0,
      backgroundColor: Colors.green[100],
      title: Text(
        "Unit Converter",
        style: Theme.of(context).textTheme.headline6,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: appBar,
      body: listView,
    );
  }
}
