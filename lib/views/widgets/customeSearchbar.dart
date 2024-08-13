import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 210, 202, 202),
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search wallpaper",
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  fillColor: Colors.black12,
                  border: InputBorder.none),
            ),
          ),
          InkWell(
              onTap: () {
                print("Search ");
              },
              child: Icon(
                Icons.search,
                color: Colors.blue,
              ))
        ],
      ),
    );
  }
}
