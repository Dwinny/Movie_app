import 'package:flutter/material.dart';
import 'package:movie_app/Services/api_service.dart';
import 'package:movie_app/model.dart';
import 'package:movie_app/widgets/Upcoming_list.dart';
import '../widgets/upcomingMovie.dart';
import '../widgets/NewMovie.dart';
import '../widgets/NewMoviewidget.dart';
import '../widgets/Texformfield.dart';
import '../widgets/customnav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<MovieApp>?> userMovie;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userMovie = getMoviesData();
  }

  Future<List<MovieApp>?> getMoviesData() async {
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
                    children: [
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
                  CircleAvatar(
                    backgroundColor: Colors.red,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Textformfield(),
              SizedBox(
                height: 30,
              ),
              Upcoming(),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 200,
                  child: FutureBuilder<List<MovieApp>?>(
                      future: userMovie,
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Center(
                                child: const CircularProgressIndicator());
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
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Moviewidget();
                                },
                              );
                            } else {
                              return const Text('No data');
                            }
                        }
                      })),
              SizedBox(
                height: 10,
              ),
              NewMovie(),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: FutureBuilder<List<MovieApp>?>(
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
                                return newMovieupdate();
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
      bottomNavigationBar: Customnavbar(),
    );
  }
}
