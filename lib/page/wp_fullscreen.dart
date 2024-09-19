import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WpFullscreen extends StatefulWidget {
  final String imageUrl;
  const WpFullscreen({super.key, required this.imageUrl});

  @override
  _WpFullscreenState createState() => _WpFullscreenState();
}

class _WpFullscreenState extends State<WpFullscreen> {
  bool isFavorited = false; // To track whether the icon is "favorited"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Full Screen",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Hero(
            tag: '${widget.imageUrl}',
            child: Container(
              padding: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height * 0.99,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorited = !isFavorited; // Toggle the favorite status
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: isFavorited ? Colors.red : Colors.black, // Change color based on the state
                        size: 40,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}