import 'package:blog_explorer_app/Screens/home.dart';
import 'package:blog_explorer_app/provider/favorite_provider.dart';
import 'package:blog_explorer_app/view_model_blogs/view_model_of_blogs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ViewModelBlogs(),
        ),
        ChangeNotifierProvider(create: (context) => FavoriteBlogs()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
