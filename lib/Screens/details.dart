// ignore_for_file: prefer_const_constructors, must_be_immutable, use_build_context_synchronously

import 'package:blog_explorer_app/constants/my_colors.dart';
import 'package:blog_explorer_app/models/blog_items_model.dart';
import 'package:blog_explorer_app/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  BlogItems currentBlog;
  DetailsScreen({super.key, required this.currentBlog});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool likebuttoninCorner = false;
  @override
  Widget build(BuildContext context) {
    final classInstancee = Provider.of<FavoriteBlogs>(context);
    return Scaffold(
        backgroundColor: Color.fromARGB(239, 246, 209, 142),
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(fontFamily: "BoldFont", color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: appColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    widget.currentBlog.imgurl,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  widget.currentBlog.title,
                  style: TextStyle(
                      fontFamily: "BoldFont",
                      fontWeight: FontWeight.w800,
                      fontSize: 25),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                onPressed: () async {
                  await classInstancee.addItem(widget.currentBlog);
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(appColor),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 65, vertical: 16)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
                ),
                child: const Text(
                  "Add To Favorite",
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontFamily: "BoldFont"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
