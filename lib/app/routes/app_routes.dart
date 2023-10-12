part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const POST_DETAILS = _Paths.POST_DETAILS;
}

abstract class _Paths {
  _Paths._();

  static const HOME = '/home';
  static const POST_DETAILS = '/post_details';
}
