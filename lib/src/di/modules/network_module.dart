import 'package:dio/dio.dart';
import 'package:hitchhike/src/data/network/constants/endpoints.dart';
import 'package:hitchhike/src/data/network/dio_client.dart';
import 'package:hitchhike/src/data/sharedpref/constants/preferences.dart';
import 'package:hitchhike/src/data/sharedpref/shared_preference_helper.dart';
import 'package:hitchhike/src/di/modules/preference_module.dart';
import 'package:inject/inject.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graphql/client.dart';

@module
class NetworkModule extends PreferenceModule {
  // ignore: non_constant_identifier_names
  final String TAG = "NetworkModule";

  @provide
  @singleton
  DioClient provideDioClient(Dio dio) => DioClient(dio);

  @provide
  @singleton
  Dio provideDio(SharedPreferenceHelper sharedPrefHelper) {
    final dio = Dio();

    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (Options options) async {
            // getting shared pref instance
            var prefs = await SharedPreferences.getInstance();

            // getting token
            var token = prefs.getString(Preferences.access_token);

            if (token != null) {
              options.headers.putIfAbsent('Authorization', () => token);
            } else {
              print('Auth token is null');
            }
          },
        ),
      );

    return dio;
  }

  @provide
  @singleton
  GraphQLClient provideGraphqlClient(SharedPreferenceHelper sharedPrefHelper) {
    HttpLink httpLink = HttpLink(Endpoints.graphqlUrl);
    AuthLink authLink = AuthLink(
      getToken: () async {
        var prefs = await SharedPreferences.getInstance();
        return prefs.getString(Preferences.access_token);
      },
    );
    Link link = authLink.concat(httpLink);

    return GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }
}
