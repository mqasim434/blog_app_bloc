import 'package:blog_explorer/data/models/BlogModel.dart';
import 'package:blog_explorer/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class BlogDetailsScreen extends StatelessWidget {
  BlogDetailsScreen({super.key, required this.blog});

  BlogModel blog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1B1B),
      appBar: buildAppBar('Blog Details'),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  blog.title.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Image.network('https://4.bp.blogspot.com/-UVv_Gm8bwk0/V1Q4Pbw_API/AAAAAAAAAAQ/6r26zheTE-IATDmTJUB7wnxVXue90NxUwCLcB/s1600/resize-blogger-popular-posts-thumbnail-image.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                blog.title.toString(),
                style: const TextStyle(color: Colors.white,fontSize: 18,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
