class Constants {
  // NETWORK
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'd096c5d1bd9470f19b68829738108011';
  static const String username = 'taufiqfebianto';
  static const String password = 'TheOrdinary26#!';

  // USER API
  static const String reqToken = '/authentication/token/new';
  static const String validateToken =
      '/authentication/token/validate_with_login';
  static const String createSession = '/authentication/session/new';
  static const String deleteSession = '/authentication/session';

  // MOVIE API
  static const String getVideoMovie = '/movie/';
  static const String nowPlayingMovie = '/movie/now_playing';
  static const String popularMovie = '/movie/popular';
  // static const String topRatedMovie = '/movie/top_rated';
  // static const String upcomingMovie = '/movie/upcoming';

  // SERIES API
  // static const String latestTv = '/tv/latest';
  static const String popularTv = '/tv/popular';
  // static const String topRatedTv = '/tv/top_rated';
  static const String onAirTv = '/tv/on_the_air';
  static const String getVideoTv = '/tv/';

  // ASSET IMAGES
  static const String baseImagePath = 'https://image.tmdb.org/t/p/original';
  static const String logoFull = 'assets/primary_full.svg';
  static const String logoLong = 'assets/primary_long.svg';
  static const String logoShort = 'assets/primary_short.png';
  static const String altLong = 'assets/alt_long.png';
  static const String altShort = 'assets/alt_short.svg';
  static const String logo = 'assets/logo.png';

  // STRING
  static const String sysnopsis =
      'A movie synopsis summarizes the film’s storyline. It covers all of the screenplay’s acts and highlights key plot points and emotional components. A synopsis also introduces the main characters and the movie’s setting.';
}
