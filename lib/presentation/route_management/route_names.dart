class RouteNames{

  RouteNames._internalConstructor();

  static final RouteNames _instance = RouteNames._internalConstructor();

  factory RouteNames(){
    return _instance;
  }

  static const String kInitialRoute = "/";
}