class HomeFailure implements Exception {}

class HomeServerErrorFailure extends HomeFailure {
  final String error;
  HomeServerErrorFailure({this.error});
}

class HomeNotFoundFailure extends HomeFailure {}
