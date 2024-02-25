const String baseUrl = 'https://api.themoviedb.org/3/';

const String apiKey = '057fff62c9c2cdfa9eb1c4a17beeaf3b';

const String nowPlayingEndPoint = 'movie/now_playing';
const String popularMoviesEndPoint = 'movie/popular';
const String topRatedMoviesEndPoint = 'movie/top_rated';
const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

String imageUrl(String imagePath) => '$baseImageUrl$imagePath';

const String moviesDetails = 'movie/';
const String similarDetails = 'movie/';
