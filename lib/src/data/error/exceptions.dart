//Exception that is thrown when http request call response is not 200
import 'package:meta/meta.dart';

class HttpRequestException implements Exception {}

//Exception that is thrown when value is not presented in Local Db
class LocalDbExceptionimplements implements Exception {}

class RemoteServerException implements Exception {}

class LocalDatabaseException implements Exception {}

//Exception that is thrown when Entity to Model conversion is performed
class EntityModelMapperException implements Exception {
  final String message;

  EntityModelMapperException({@required this.message});
}
