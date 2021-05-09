import 'dart:math';

import 'package:flutterbkd/model/contacts.model.dart';

class ContactsRepository {
  Map<int, Contact> contacts = {
    1:Contact(id: 1, name: 'Salah', profile: 'SA', score: 23, type: 'Developer'),
    2:Contact(id: 2, name: 'Yusuf', profile: 'YU', score: 24, type: 'Student'),
    3:Contact(id: 3, name: 'Ousama', profile: 'OU', score: 32, type: 'Developer'),
    4:Contact(id: 4, name: 'Zakaria', profile: 'ZA', score: 21, type: 'Student'),
    5:Contact(id: 5, name: 'Hamza', profile: 'HA', score: 45, type: 'Student')
  };

  Future<List<Contact>> allContacts() async {
    var future = await Future.delayed(Duration(seconds: 1));
    int random = new Random().nextInt(10);
    if(random > 3) {
      return contacts.values.toList();
    } else {
      throw new Exception('Internet Error');
    }
  }

  Future<List<Contact>> contactsByType(String type) async {
    var future = await Future.delayed(Duration(seconds: 1));
    int random = new Random().nextInt(10);
    if(random > 3) {
      return contacts.values.toList().where((item) => item.type == type).toList();
    }
  }
}