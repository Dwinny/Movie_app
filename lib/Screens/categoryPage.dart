import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

import '../Services/api_service.dart';
import '../model.dart';
import '../widgets/NewMovie.dart';
import '../widgets/category.dart';
import '../widgets/customnav.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      // to go back to the page
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Discover',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
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
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  leading: Category(),
                                  title: Text('Category'),
                                  trailing: Icon(Icons.arrow_back_ios),
                                );
                              },
                            );
                          } else {
                            return const Text('No data');
                          }
                      }
                    })),
          ],
        )),
      ),
      bottomNavigationBar: Customnavbar(),
    );
  }
}
