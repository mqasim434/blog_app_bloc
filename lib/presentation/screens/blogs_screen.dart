import 'package:blog_explorer/presentation/cubits/blog_cubits/blog_cubit.dart';
import 'package:blog_explorer/presentation/cubits/blog_cubits/blog_state.dart';
import 'package:blog_explorer/presentation/cubits/internet_cubits/internet_cubit.dart';
import 'package:blog_explorer/presentation/cubits/internet_cubits/internet_state.dart';
import 'package:blog_explorer/presentation/screens/blog_details_screen.dart';
import 'package:blog_explorer/presentation/widgets/app_bar.dart';
import 'package:blog_explorer/presentation/widgets/blog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/BlogModel.dart';
import 'package:blog_explorer/data/local/blogsList.dart';

class BlogsScreen extends StatelessWidget {
  BlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1B1B),
      appBar: buildAppBar('Blogs'),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnectedState) {
                    return BlocBuilder<BlogCubit, BlogsState>(
                      builder: (context, state) {
                        if (state is BlogsLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is BlogsLoadedState) {
                          print('---------------- ${state.blogs.length}');
                          return ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              BlogModel currentBlog = state.blogs[index];
                              return BlogWidget(
                                // title: currentBlog.title.toString(),
                                title: 'HELLO',
                                image_url: 'https://4.bp.blogspot.com/-UVv_Gm8bwk0/V1Q4Pbw_API/AAAAAAAAAAQ/6r26zheTE-IATDmTJUB7wnxVXue90NxUwCLcB/s1600/resize-blogger-popular-posts-thumbnail-image.png',
                                onPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BlogDetailsScreen(blog: currentBlog),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text('Error Occurred'),
                          );
                        }
                      },
                    );
                  }
                  if (state is InternetNotConnectedState) {
                    return ListView.builder(
                        itemCount: blogsList.length,
                        itemBuilder: (context, index) {
                          return BlogWidget(
                            title: blogsList[index]['name'].toString(),
                            image_url: 'assets/images/blog_thumb.png',
                            onPress: () {
                              // Navigator.push(context, route)
                            },
                          );
                        });
                  }
                  return const Center(
                      child: Text(
                    'Loading...',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ));
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocBuilder<InternetCubit, InternetState>(
                    builder: (context, state) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    color: (state is InternetConnectedState)
                        ? Colors.green
                        : Colors.red,
                    child: (state is InternetConnectedState)
                        ? const Text(
                            'Internet is Connected',
                            textAlign: TextAlign.center,
                          )
                        : const Text(
                            'Internet is not Connected',
                            textAlign: TextAlign.center,
                          ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
