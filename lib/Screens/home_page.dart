import 'package:flutter/material.dart';
import 'package:movie_app/Services/api_service.dart';
import 'package:movie_app/model.dart';
// import 'package:movie_app/widgets/NewMovie.dart';
import 'package:movie_app/widgets/new_movie.dart';

import 'package:movie_app/widgets/upcoming_list.dart';
import '../widgets/upcoming_movie.dart';

import '../widgets/new_movie_widget.dart';
import '../widgets/tex_formfield.dart';
import '../widgets/customnav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future?  userMovie;
  @override
  void initState() {
   
    super.initState();
    userMovie = getMoviesData();
  }

  Future getMoviesData() async {
    var movies = await APIService().getMovies();
    return movies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Hello Chioma',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        'What is next',
                        style: TextStyle(color: Colors.white12),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.red,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Textformfield(),
              const SizedBox(
                height: 30,
              ),
              const Upcoming(),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 200,
                  child: FutureBuilder(
                      future: userMovie,
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return const Center(
                                child: CircularProgressIndicator());
                          case ConnectionState.done:
                          default:
                            if (snapshot.hasError) {
                              final error = snapshot.error;
                              return Text('$error');
                            } else if (snapshot.hasData) {
                             
                              return ListView.builder(
                                itemCount: snapshot.data!.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return const Moviewidget();
                                },
                              );
                            } else {
                              return const Text('No data');
                            }
                        }
                      })),
              const SizedBox(
                height: 10,
              ),
              const NewMovie(),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: FutureBuilder(
                    future: userMovie,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Center(
                              child: CircularProgressIndicator());
                        case ConnectionState.done:
                        default:
                          if (snapshot.hasError) {
                            final error = snapshot.error;
                            return Text('$error');
                          } else if (snapshot.hasData) {
                            dynamic data = snapshot.data!;
                            return ListView.builder(
                              itemCount: data.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return const NewMovieupdate();
                              },
                            );
                          } else {
                            return const Text('No data');
                          }
                      }
                    }),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Customnavbar(),
    );
  }
}
