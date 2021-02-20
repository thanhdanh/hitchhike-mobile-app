class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://localhost:3000";

  static const int receiveTimeout = 5000;
  static const int connectionTimeout = 3000;

  static const String graphqlUrl = baseUrl + '/graphql';
}
