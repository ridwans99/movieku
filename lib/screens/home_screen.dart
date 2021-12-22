import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/repository/repository.dart';
import 'package:movieapp/screens/detail_screen.dart';
import 'package:movieapp/style/theme.dart' as Style;
import 'package:movieapp/widgets/best_movies.dart';
import 'package:movieapp/widgets/genres.dart';
import 'package:movieapp/widgets/now_playing.dart';
import 'package:movieapp/widgets/persons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> moviemodel = [];
  MovieRepository repository = MovieRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        title: Text("MovieKu"),
      ),
      body: ListView(
        children: <Widget>[
          search(),
          _buidList(context),
          NowPlaying(),
          GenresScreen(),
          PersonsList(),
          BestMovies(),
        ],
      ),
    );
  }

  search() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // padding: const EdgeInsets.only(top: 8.0),
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(0xFF58C0D0),
            ),
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) {
                  // getData(search: value);
                },
                decoration: InputDecoration(
                    hintText: 'Cari Film',
                    // hintStyle: GoogleFonts.montserrat(
                    //     fontSize: 12, fontWeight: FontWeight.w500),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(20, 1, 20, 1)),
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 0),
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
                color: Color(0xFF58C0D0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buidList(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        SizedBox(
          child: moviemodel.length > 0
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: moviemodel.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  itemBuilder: (context, index) {
                    Movie movie = moviemodel[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MovieDetailScreen(movie: movie);
                            },
                          ),
                        );
                      },
                      child: Expanded(
                        child: Container(
                          padding: EdgeInsets.all(11),
                          height: 126,
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Color(0xFF58C0D0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 4,
                                  offset: Offset(2.0, 3.0))
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.asset(
                                    'assets/images/pic1.png',
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        moviemodel[index].title,
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Column(
                  children: [
                    Text(
                      'Penelusuran tidak ditemukan',
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
