import 'package:blog_explorer/data/models/BlogModel.dart';
import 'package:blog_explorer/data/remote/repositories/blogs_repository.dart';
import 'package:blog_explorer/presentation/cubits/blog_cubits/blog_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogCubit extends Cubit<BlogsState>{
  BlogCubit() : super(BlogsLoadingState()){
    fetchBlogs();
  }

  BlogsRepository blogsRepository = BlogsRepository();

void fetchBlogs() async{
    try{
      List<BlogModel> blogs = await blogsRepository.fetchBlogs();
      print(blogs[0].title);
      emit(BlogsLoadedState(blogs));
    }catch(e){
      emit(BlogsErrorState(e.toString()));
    }

  }
}
