/// Enum representing the distinct route names used in the application.
///
/// Using an enum prevents typos when referring to routes and makes
/// refactoring easier.
enum AppRouteName { main }

/// Class holding the route path definitions corresponding to [AppRouteName].
///
/// Paths are defined as constants and can include parameters like ':id'.
class AppRoutePath {
  static const String main = '/';
}
