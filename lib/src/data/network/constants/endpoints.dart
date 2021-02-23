class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://localhost:3000";

  static const int receiveTimeout = 5000;
  static const int connectionTimeout = 3000;

  static const String graphqlUrl = baseUrl + '/graphql';
  static const String facebookGetProfileUrl =
      'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)';
}
