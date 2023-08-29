import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/screen/home_screen.dart';
import '/screen/base.dart';

import '/screen/release_screen.dart';
import '/screen/explore_screen.dart';
import '/screen/profile_screen.dart';

void main() {
  runApp(MyApp());
}


List _widgetOptions = [
  HomeUI(), //Text('Index 0: Home'),
  ExploreScreen(),
  ReleaseScreen(),
  Center(child: Text('Index 3: Likes')),
  ProfileScreen(),
];



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram UI',
      theme: ThemeData(                              
        primarySwatch: Colors.blue,
      ),
      home: BaseUI(widgetOptions: _widgetOptions,)
    );
  }
}

