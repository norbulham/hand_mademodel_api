
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:hand_mademodel_api/model/wallpaper_model.dart';
import 'package:hand_mademodel_api/service/wallpaper_service.dart';
class SearchResults extends StatelessWidget {
  final String query;
  const SearchResults(this.query, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchService _searchService = SearchService();
    return FutureBuilder<List<WallpaperModel>>(
        future: _searchService.fetchWallpapersByQuery(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data found'));
          } else {
            return MasonryGridView.count(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              itemBuilder: (context, index) {
                final photos = snapshot.data![index];
                return Hero(
                  tag: "${photos.imgURL}",
                  child: InkWell(
                    onTap: () {
                      Get.toNamed("/details", arguments: photos);
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: (index % 3 + 2) * 100,
                      decoration: BoxDecoration(
                        color: Color(int.parse(
                            photos.avaColor.replaceAll('#', '0xff'))),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage('${photos.imgURL}'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }
        );
  }
}

