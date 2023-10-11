import 'package:blog_explorer/presentation/cubits/internet_cubits/internet_cubit.dart';
import 'package:blog_explorer/presentation/cubits/internet_cubits/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogWidget extends StatelessWidget {
  BlogWidget({
    super.key,
    required this.title,
    required this.onPress,
    this.image_url,
  });

  String? title;
  String? image_url;

  VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: onPress,
        child: Card(
          color: const Color(0xFF303030),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: BlocBuilder<InternetCubit,InternetState>(builder: (context,state){
                    if(state is InternetNotConnectedState){
                      return Image.asset(
                          image_url.toString());
                    }
                    return Image.network(
                        image_url.toString());
                  },),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
