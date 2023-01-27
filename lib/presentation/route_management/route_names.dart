class RouteNames{

  RouteNames._internalConstructor();

  static final RouteNames _instance = RouteNames._internalConstructor();

  factory RouteNames(){
    return _instance;
  }

  static const String kInitialRoute = "/";
  static const String kSignInScreenRoute = "/Sign_In_Screen_Route";
  static const String kSignUpScreenRoute = "/Sign_Up_Screen_Route";
  static const String kHomeScreenRoute = "/Home_Screen_Route";
  static const String kItemViewScreenRoute = "/Item_View_Screen_Route";

}