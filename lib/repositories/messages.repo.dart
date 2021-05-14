import 'dart:math';

import 'package:flutterbkd/model/contacts.model.dart';
import 'package:flutterbkd/model/message.model.dart';

class MessagesRepository {
  Map<int, Message> messages = {
    1: Message(id: 1, contactID: 1, date: DateTime.now(), content: 'Salam !! sadsadbdhzdhzd d hdbhzbdhzbdhbdh h dhzbdhzbdhzbdhb', type: 'sent', selected: false),
    2: Message(id: 2, contactID: 1, date: DateTime.now(), content: 'Hello  sadsadbdhzdhzd d hdbhzbdhzbdhbdh h dhzbdhzbdhzbdhb', type: 'received', selected: false),
    3: Message(id: 3, contactID: 1, date: DateTime.now(), content: 'Wach !!', type: 'sent', selected: false),
    4: Message(id: 4, contactID: 1, date: DateTime.now(), content: 'Cava !!', type: 'received', selected: false),
    5: Message(id: 5, contactID: 5, date: DateTime.now(), content: 'Ki Dayr !!', type: 'sent', selected: false)
  };
  int messagesCount;

  MessagesRepository() {
    this.messagesCount = messages.length;
  }


  Future<List<Message>> allMessages() async {
    var future = await Future.delayed(Duration(seconds: 1));
    int random = new Random().nextInt(10);
    if(random > 3) {
      return messages.values.toList();
    } else {
      throw new Exception('Internet Error');
    }
  }

  Future<List<Message>> messagesByContact(int contactId) async {
    var future = await Future.delayed(Duration(seconds: 1));
    int random = new Random().nextInt(10);
    if(random > 3) {
      return messages.values.toList().where((item) => item.contactID == contactId).toList();
    }
  }

  Future<Message> addNewMessage(Message message) async {
    var future = await Future.delayed(Duration(seconds: 1));
    int random = new Random().nextInt(10);
    if(random > 3) {
      message.id = ++messagesCount;
      messages[message.id] = message;
      return message;
    } else {
      throw new Exception('Internet Error');
    }
  }

  Future<void> deleteSelectedMessage(Message msg) async {
    var future = await Future.delayed(Duration(seconds: 1));
    int random = new Random().nextInt(10);
    if(random > 3) {
      messages.remove(msg.id);
    } else {
      throw new Exception('Internet Error');
    }
  }
}