import 'package:blog_explorer/data/models/BlogModel.dart';

abstract class BlogsState{}

class BlogsLoadingState extends BlogsState{}

class BlogsLoadedState extends BlogsState{
  final List<BlogModel> blogs;
  BlogsLoadedState(this.blogs);
}

class BlogsErrorState extends BlogsState{
  final String errorMessage;
  BlogsErrorState(this.errorMessage);
}