import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hand_mademodel_api/page/wp_fullscreen.dart';
import 'package:hand_mademodel_api/service/wallpaper_service.dart';

class WallpaperDetail extends StatelessWidget {
  final String imageUrl;
  final String photographar;
  final String alt;
  const WallpaperDetail({Key? key, required this.imageUrl, required this.photographar, required this.alt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Wallpaper',style: TextStyle(color: Colors.white, fontSize: 25),),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Hero(
                tag: '${imageUrl}',
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height*0.55,
                  width: double.infinity,
                  decoration:BoxDecoration(
                      image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(WpFullscreen(imageUrl: imageUrl,));
                        },
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff003049).withOpacity(0.8),
                          ),
                          child: Icon(Icons.fullscreen, size: 40, color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(child: Text("$alt", style: TextStyle(color: Colors.white, fontSize: 22),)),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person, size: 30,color: Colors.white,),
                      Text("  Photographer",style: TextStyle(color: Colors.white, fontSize: 20),)
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height*0.06,
                    width: MediaQuery.of(context).size.width*0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffedede9).withOpacity(0.3),
                    ),
                    child: Center(child: Text("$photographar", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),)),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.camera_alt_rounded, color: Colors.white,size: 30,),
                      Text("  Photo by",style: TextStyle(color: Colors.white, fontSize: 20) )
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.05,
                    width: MediaQuery.of(context).size.width*0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffedede9),
                    ),
                    child: Center(child: Text("pixcel", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),)),
                  )
                ],
              ),SizedBox(height: 20,),
              MaterialButton(
                color: Colors.white,
                  onPressed: (){
                    WallpaperService().openUrl(imageUrl);
                  },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("DOWNLOAD", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                    Icon(Icons.download, color: Colors.black,size: 30,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}