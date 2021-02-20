import 'package:equatable/equatable.dart';
import 'package:hitchhike/src/constants/enums.dart';
import 'package:meta/meta.dart';

class DriverLicense extends Equatable {
  final String code;
  final DateTime dateExpire;
  final String imageUrl;
  final DriverLicenseClass licenseClass;

  DriverLicense({
    @required this.code,
    @required this.imageUrl,
    @required this.licenseClass,
    this.dateExpire,
  }) : assert(code != null);

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'dateExpire': dateExpire,
      'imageUrl': imageUrl,
      'licenseClass': licenseClass,
    };
  }

  @override
  List<Object> get props => [
        code,
        dateExpire,
        imageUrl,
        licenseClass,
      ];
}
