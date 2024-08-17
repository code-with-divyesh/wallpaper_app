import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpaper_app/views/widgets/CustomAppBar.dart';
import 'package:wallpaper_app/views/widgets/catlog.dart';
import 'package:wallpaper_app/views/widgets/customeSearchbar.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _HomeState();
}

class _HomeState extends State<Category> {
  List<String> NavBarItem = [
    "Nature and Landscapes",
    "Minimalist and Abstract",
    "Cityscapes and Architecture",
    "Space and Astronomy",
    "Fantasy and Sci-Fi",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1.0,
        title: CustomAppBar(
          word1: "Wallpaper",
          word2: " Guru",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    "https://images.pexels.com/photos/1054218/pexels-photo-1054218.jpeg"),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black38,
                ),
                Positioned(
                  left: 120,
                  top: 40,
                  child: Column(
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      ),
                      Text(
                        "Mountains",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 7, vertical: 20),
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 400),
                  itemCount: 6,
                  itemBuilder: ((context, index) {
                    return Container(
                      height: 800,
                      width: 50,
                      color: Colors.yellow,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                            height: 800,
                            width: 50,
                            fit: BoxFit.cover,
                            "https://images.pexels.com/photos/6307488/pexels-photo-6307488.jpeg?auto=compress&cs=tinysrgb&w=600"),
                      ),
                    );
                  }),
                )),
          ],
        ),
      ),
    );
  }
}
