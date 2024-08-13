import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpaper_app/views/widgets/CustomAppBar.dart';
import 'package:wallpaper_app/views/widgets/catlog.dart';
import 'package:wallpaper_app/views/widgets/customeSearchbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CustomSearchBar()),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 30,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CatLog();
                },
              ),
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
