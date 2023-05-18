import 'package:flutter/material.dart';

import '../Services/api_service.dart';
import '../model.dart';
import '../widgets/category.dart';
import '../widgets/customnav.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Future? userMovie;

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
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      // to go back to the page
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
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
                padding: const EdgeInsets.symmetric(vertical: 10),
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
                                return const ListTile(
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
      bottomNavigationBar: const Customnavbar(),
    );
  }
}
