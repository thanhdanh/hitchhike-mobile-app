import 'package:hitchhike/data/local/constants/db_constants.dart';
import 'package:sembast/sembast.dart';

class HitchhikeDataSource {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Flogs objects converted to Map
  final _hitchhikeStore = intMapStoreFactory.store(DBConstants.STORE_NAME);

  // database instance
  final Future<Database> _db;

  // Constructor
  HitchhikeDataSource(this._db);
}
