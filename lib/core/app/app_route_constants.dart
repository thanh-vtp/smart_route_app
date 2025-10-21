/// Enum representing the distinct route names used in the application.
///
/// Using an enum prevents typos when referring to routes and makes
/// refactoring easier.
enum AppRouteName {
  // --- Initial Flow ---
  splash, // App initialization / loading screen
  onboarding, // Multi-step onboarding guide screens
  login, // Authentication screen
  home, // Main content after login/onboarding
  // --- Core Features ---
  settings, // User settings and preferences
  genCaptions, // Caption generation feature
  history, // Viewing caption generation history
  collection, // Viewing caption collection
  hashtag, // Hashtag generation feature
  photo, // Photo upload and management feature
  // --- Caption Feature Routes ---
  captionEdit, // Editing a specific caption
  fullScreen,
}

/// Class holding the route path definitions corresponding to [AppRouteName].
///
/// Paths are defined as constants and can include parameters like ':id'.
class AppRoutePath {
  // --- Initial Flow ---
  static const String splash = '/splash';
  static const String onboarding =
      '/onboarding'; // Top-level path for the onboarding flow
  static const String login = '/login';

  // --- Core Features ---
  static const String settings = 'settings';
  static const String genCaptions = 'gen-captions';
  static const String history = 'history';
  static const String collection = 'collection';
  static const String hashtag = 'hashtag';
  static const String photo = 'photo';

  // Path for the EditCaption screen. ':cid' is a parameter for the caption ID.
  static const String captionEdit = '/caption/:cid/edit';
  static const String fullScreen = '/photo/full-screen';

  // --- Parameter Helper Functions (Optional but recommended) ---
  // If you frequently build paths with parameters, create helpers:
  static String captionEditPath({required String captionId}) =>
      captionEdit.replaceAll(':cid', captionId);

  // Example if other routes have params:
  // static String featureXDetailsPath({required String itemId}) =>
  //    featureXDetails.replaceAll(':id', itemId);
}
