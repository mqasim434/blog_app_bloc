import 'package:blog_explorer/presentation/cubits/blog_cubits/blog_cubit.dart';
import 'package:blog_explorer/presentation/cubits/internet_cubits/internet_cubit.dart';
import 'package:blog_explorer/presentation/screens/blogs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(),
        ),
        BlocProvider<BlogCubit>(
          create: (context) => BlogCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlogsScreen(),
      ),
    );
  }
}
//
// import 'package:http/http.dart' as http;
//
// void fetchBlogs() async {
//   final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
//   final String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';
//
//   try {
//     final response = await http.get(Uri.parse(url), headers: {
//       'x-hasura-admin-secret': adminSecret,
//     });
//
//     if (response.statusCode == 200) {
//       // Request successful, handle the response data here
//       print('Response data: ${response.body}');
//     } else {
//       // Request failed
//       print('Request failed with status code: ${response.statusCode}');
//       print('Response data: ${response.body}');
//     }
//   } catch (e) {
//     // Handle any errors that occurred during the request
//     print('Error: $e');
//   }
// }
//
// void main() {
//   fetchBlogs();
// }
