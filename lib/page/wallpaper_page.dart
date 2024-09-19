import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:hand_mademodel_api/model/wallpaper_model.dart';
import 'package:hand_mademodel_api/page/search_page.dart';
import 'package:hand_mademodel_api/page/wallpaper_detail.dart';
import 'package:hand_mademodel_api/service/wallpaper_service.dart';

class WallpaperPage extends StatefulWidget {
  const WallpaperPage({super.key});

  @override
  State<WallpaperPage> createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  List<Tab> categories = [
    Tab(
      text: "JUICE",
    ),Tab(
      text: "FLOWER",
    ),Tab(
      text: "FOOD",
    ),Tab(
      text: "ANIMALS",
    ),Tab(
      text: "ARTS",
    ),Tab(
      text: "PHONES",
    ),
  ];

  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";
  bool searchMode = false;


  SearchService _searchService = SearchService();


  void searchImages(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      searchMode = true;
    });
  }


  void resetSearch() {
    setState(() {
      searchMode = false;
      _searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "WallPaper",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          bottom: TabBar(
            tabs: categories,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blueAccent
            ),
            unselectedLabelColor: Colors.white,
            isScrollable: true,
            indicatorWeight: 0,
            dividerColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.white,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search wallpapers...",
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  disabledBorder: InputBorder.none ,
                  suffixIcon: searchMode
                      ? IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: resetSearch, // Clear search
                  )
                      : null,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                style: TextStyle(color: Colors.black
                ),
                onSubmitted: (value) {
                  searchImages(value); // Trigger search on input
                },
              ),
            ),

            Expanded(
              child: searchMode
                  ? SearchResults(_searchQuery) // Show search results
                  : TabBarView(
                children: categories.map((tab) => costomGridView(tab)).toList(),
              ),

            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<WallpaperModel>> costomGridView(Tab tab) {
    return FutureBuilder<List<WallpaperModel>>(
      future: WallpaperService().fetchWallpaperData(tab.text!.toLowerCase()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text("No data found"));
        } else {
          return MasonryGridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final photo = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => WallpaperDetail(imageUrl: photo.imgURL,photographar: photo.photographar,alt: photo.alt,));
                  },
                  child: Hero(
                    tag: '${photo.imgURL}',
                    child: Container(
                      height: (index % 3 + 2) * 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(
                              int.parse(photo.avaColor.replaceAll("#", "0xff"))),
                          image: DecorationImage(
                              image: NetworkImage("${photo.imgURL}"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                );
              });
        }
      },
    );
  }
}