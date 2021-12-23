import 'dart:convert';

import 'package:movieapp/config/local_storage.dart';
import 'package:movieapp/model/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppData {
  static List<Movie> get movieList {
    if (LocalStorage.getfromdisk('moviedata') != null) {
      List<String> listdata = LocalStorage.getfromdisk('moviedata');
      return listdata.map((e) => Movie.fromJson(jsonDecode(e))).toList();
    }
    return null;
  }

  static set movieList(List<Movie> value) {
    if (value != null) {
      List<String> liststring =
          value.map((e) => jsonEncode(e.tojson())).toList();
      LocalStorage.savetodisk('moviedata', liststring);
    } else {
      LocalStorage.savetodisk('moviedata', null);
    }
  }
}
