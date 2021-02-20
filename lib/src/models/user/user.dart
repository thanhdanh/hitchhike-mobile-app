class User {
  int _uid;
  String _displayName;
  String _password;

  String _phoneNumber;
  String _email;
  String _idCardNumber;
  String _yearOfBirth;
  Gender _gender;
  String _photoUrl;

  String _nation;
  String _address;

  get displayName => this._displayName;
  get email => this._email;
  get phoneNumber => this._phoneNumber;
  get id => this._uid;
  get idCardNumber => this._idCardNumber;
  get yearOfBirth => this._yearOfBirth;
  get gender => this._gender;
  get photoUrl => this._photoUrl;
  get nation => this._nation;
  get address => this._address;
  get password => this._password;
}

enum Gender { Female, Male, Other }
