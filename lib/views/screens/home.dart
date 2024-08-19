import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpaper_app/controller/wallpaperapi.dart';
import 'package:wallpaper_app/model/model.dart';
import 'package:wallpaper_app/views/widgets/CustomAppBar.dart';
import 'package:wallpaper_app/views/widgets/catlog.dart';
import 'package:wallpaper_app/views/widgets/customeSearchbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Photosmodel> trandingWallPaper = [];

  getTrandingWallpaper() async {
    trandingWallPaper = await ApiOP.getTrendingWallpaper('nature');
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTrandingWallpaper();
  }

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
                height: 1000,
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 13,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 400),
                  itemCount: trandingWallPaper.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(15)),
                      height: 800,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                            height: 800,
                            width: 50,
                            fit: BoxFit.cover,
                            trandingWallPaper[index].imagsrc),
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
