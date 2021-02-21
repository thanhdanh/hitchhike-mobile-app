import 'package:equatable/equatable.dart';
import 'package:hitchhike/src/constants/enums.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final int uid;

  final String fullName;

  final String password;

  final String phoneNumber;

  /// The current user's email address.
  final String email;
  final String birthDate;
  final Gender gender;
  final String photoUrl;

  final String facebookUid;

  final String nation;
  final String address;

  User({
    @required this.uid,
    @required this.fullName,
    this.email,
    this.photoUrl,
    this.gender,
    this.phoneNumber,
    this.birthDate,
    this.address,
    this.nation,
    this.facebookUid,
    this.password,
  })  : assert(email != null),
        assert(uid != null);

  @override
  List<Object> get props => [
        uid,
        fullName,
        photoUrl,
        email,
        phoneNumber,
        password,
        birthDate,
        gender,
        nation,
        address,
        facebookUid
      ];
}
