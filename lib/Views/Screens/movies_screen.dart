import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_tutorial/view_model/controllers/movies_controller/movies_controller.dart';
import 'package:getx_api_tutorial/view_model/enums/enums.dart';
import 'package:getx_api_tutorial/view_model/services/movie_services.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({super.key});

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  @override
  void initState() {
    super.initState();
    MovieServices().getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<MoviesController>(builder: (controller) {
      return GetData(
          status: controller.movies.status,
          data: controller.movies.data != null
              ? ListView.builder(
                  itemCount: controller.movies.data!.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(controller.movies.data![i].name),
                      leading: Image.network(
                          controller.movies.data![i].image_thumbnail_path),
                    );
                  })
              : const SizedBox());
    }));
  }
}

class GetData extends StatelessWidget {
  final StatusEnum status;
  final Widget data;
  const GetData({super.key, required this.status, required this.data});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case StatusEnum.ERROR:
        return const Center(child: Text("something went wrong"));
      case StatusEnum.LOADING:
        return const Center(child: CircularProgressIndicator.adaptive());
      case StatusEnum.SUCCESS:
        return data;
      default:
        return const SizedBox();
    }
  }
}
