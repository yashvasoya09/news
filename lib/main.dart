import 'package:flutter/material.dart';
import 'package:news/screen/provider/news%20provider.dart';
import 'package:news/screen/view/dash%20Screen.dart';
import 'package:news/screen/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [ChangeNotifierProvider(create: (context) => newsProvider(),)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
              '/':(context) => homeScreen(),
              'dashScreen':(context) => dashScreen(),
        },
      ),
    ),
  );
}
