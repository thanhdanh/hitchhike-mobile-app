import 'package:equatable/equatable.dart';
import 'package:hitchhike/src/constants/enums.dart';
import 'package:meta/meta.dart';

class Vehicle extends Equatable {
  final int id;
  final String licensePlates; // Biển số xe
  final bool isDefault;
  final String brand;
  final Vehicle_Type type;

  Vehicle({
    @required this.id,
    @required this.licensePlates,
    @required this.type,
    @required this.brand,
    @required this.isDefault,
  }) : assert(licensePlates != null);

  @override
  List<Object> get props => [
        id,
        type,
        licensePlates,
        brand,
        isDefault,
      ];

  Map<String, dynamic> toMap() => {
        "id": id,
        "licensePlates": licensePlates,
        "type": type,
        "brand": brand,
        "isDefault": isDefault,
      };
}
