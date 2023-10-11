// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:blog_explorer_app/Screens/details.dart';
import 'package:blog_explorer_app/Screens/favorite.dart';
import 'package:blog_explorer_app/Widgets/blogs_card.dart';
import 'package:blog_explorer_app/constants/my_colors.dart';
import 'package:blog_explorer_app/provider/favorite_provider.dart';
import 'package:blog_explorer_app/view_model_blogs/view_model_of_blogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ViewModelBlogs>(context, listen: false).fetchData();
    final classInstancee = Provider.of<ViewModelBlogs>(context);
    final favoriteProvider = Provider.of<FavoriteBlogs>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(239, 246, 209, 142),
      appBar: AppBar(
        backgroundColor: appColor,
        title: Container(
          margin: EdgeInsets.only(right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.explore,
                color: Colors.black,
              ),
              Text(
                " Blog Explorer ",
                style: TextStyle(fontFamily: 'BoldFont', color: Colors.black),
              ),
            ],
          ),
        ),
        centerTitle: true,
        leading: Stack(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => FavoriteScreen())));
                },
                icon: Icon(
                  Icons.favorite_outline_rounded,
                  color: Colors.black,
                )),
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: favoriteProvider.allfavoriteblogs.isEmpty
                      ? appColor
                      : Color.fromARGB(255, 220, 69, 69),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child:
                      Text(favoriteProvider.allfavoriteblogs.length.toString()),
                ),
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;

            if (connected) {
              return new ListView.builder(
                  itemCount: classInstancee.blogsList.length,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => DetailsScreen(
                                        currentBlog:
                                            classInstancee.blogsList[index],
                                      ))));
                        },
                        child: BlogCard(
                          theTitle: classInstancee.blogsList[index].title,
                          url: classInstancee.blogsList[index].imgurl,
                        ),
                      ),
                    );
                  });
            } else {
              return new Center(
                child: Text(
                  "Oops! there is no internet",
                  style: TextStyle(
                    fontFamily: "BoldFont",
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              );
            }
          },
          child: Center(
              child: CircularProgressIndicator(
            color: Colors.black,
          ))),
    );
  }
}
