class Member {
  String _id;
  String _name;
  String _phoneNumber;
  String _description;
  String _gender;
  String _avatarUrl;

  Member(this._name, this._phoneNumber, this._description, this._gender,
      this._avatarUrl);

  Member.withID(this._id, this._name, this._phoneNumber, this._description,
      this._gender, this._avatarUrl);

  String get id => _id;
  String get name => _name;
  String get phoneNumber => _phoneNumber;
  String get description => _description;
  String get gender => _gender;
  String get avatarUrl => _avatarUrl;

  set name(String newName) {
    this._name = newName;
  }

  set phoneNumber(String newPhoneNumber) {
    this._phoneNumber = newPhoneNumber;
  }

  set description(String newDescription) {
    this._description = newDescription;
  }

  set gender(String newGender) {
    this._gender = newGender;
  }

  set avatarUrl(String newAvatarUrl) {
    this._avatarUrl = newAvatarUrl;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = _id;
    }

    map['name'] = _name;
    map['phoneNumber'] = _phoneNumber;
    map['description'] = _description;
    map['gender'] = _gender;
    map['avatarUrl'] = _avatarUrl;
  }

  Member.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._gender = map['gender'];
    this._description = map['description'];
    this._phoneNumber = map['phoneNumber'];
    this._avatarUrl = map['avatarUrl'];
  }
}
