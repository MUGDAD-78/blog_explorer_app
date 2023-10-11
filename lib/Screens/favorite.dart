import 'package:blog_explorer_app/constants/my_colors.dart';
import 'package:blog_explorer_app/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteBlogs>(context);
    return Scaffold(
        backgroundColor: const Color.fromARGB(239, 246, 209, 142),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
          backgroundColor: appColor,
          title: const Text(
            "Favorites",
            style: TextStyle(fontFamily: "BoldFont", color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: favoriteProvider.allfavoriteblogs.isEmpty
            ? const Center(
                child: Text(
                  "Favorites is empty",
                  style: TextStyle(
                    fontFamily: "BoldFont",
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: favoriteProvider.allfavoriteblogs.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 10),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              offset: const Offset(
                                0.0,
                                10.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: -6.0,
                            ),
                          ],
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.35),
                              BlendMode.multiply,
                            ),
                            image: NetworkImage(favoriteProvider
                                .allfavoriteblogs[index].imgurl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                favoriteProvider.allfavoriteblogs[index].title,
                                style: const TextStyle(
                                    fontSize: 25, fontFamily: "NormalFont"),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 11,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 55,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(99, 250, 85, 85),
                          ),
                          child: IconButton(
                              onPressed: () {
                                favoriteProvider.removeItem(
                                    favoriteProvider.allfavoriteblogs[index]);
                              },
                              icon: const Icon(Icons.delete_outline_rounded)),
                        ),
                      ),
                    ],
                  );
                }));
  }
}
