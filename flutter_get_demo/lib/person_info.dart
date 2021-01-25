import 'package:get_storage/get_storage.dart';

class PersonInfo {
  String username;
  int age;
  String sex;

  PersonInfo(this.username, this.age, this.sex);
}

const const_username = 'username';
const const_age = 'age';
const const_sex = 'sex';

class PersonUtil {
  static PersonUtil _instance;

  PersonUtil._internal() {
    init();
  }

  static PersonUtil _getInstance() {
    if (_instance == null) {
      _instance = PersonUtil._internal();
    }
    return _instance;
  }

  static PersonUtil get instance => _getInstance();

  factory PersonUtil() => _getInstance();

  GetStorage _storage;

  init() {
    _storage = GetStorage();
  }

  saveData() {
    _storage.write(const_username, 'harry');
    _storage.write(const_age, 18);
    _storage.write(const_sex, '男');
  }

  PersonInfo getData() {
    final username = _storage.read(const_username);
    final age = _storage.read(const_age);
    final sex = _storage.read(const_sex);
    return PersonInfo(username, age, sex);
  }

  updateData({PersonInfo info, String username, int age, String sex}) {
    if (info != null) {
      if (info.username != _storage.read(const_username)) {
        _storage.write(const_username, info.username);
      }
      if (info.age != _storage.read(const_age)) {
        _storage.write(const_age, info.age);
      }
      if (info.sex != _storage.read(const_sex)) {
        _storage.write(const_sex, info.sex);
      }
    }

    if (username != null &&
        username.isNotEmpty &&
        username != _storage.read(const_username)) {
      _storage.write(const_username, username);
    }

    if (age != null && age != _storage.read(const_age)) {
      _storage.write(const_age, age);
    }

    if (sex != null && sex.isNotEmpty && sex != _storage.read(const_sex)) {
      _storage.write(const_sex, sex);
    }
  }

  myPrint() {
    final info = PersonUtil().getData();
    print('in: ${info.username}-${info.age}-${info.sex}');
  }
}
