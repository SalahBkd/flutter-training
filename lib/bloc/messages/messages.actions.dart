import 'package:flutterbkd/model/contacts.model.dart';
import 'package:flutterbkd/model/message.model.dart';

abstract class MessageEvent<T> {
  T payload;

  MessageEvent(this.payload);
}

class MessagesByContactEvent extends MessageEvent<Contact> {
  MessagesByContactEvent(Contact payload) : super(payload);
}

class AddNewMessageEvent extends MessageEvent<Message> {
  AddNewMessageEvent(payload) : super(payload);
}

class SelectMessageEvent extends MessageEvent<Message> {
  SelectMessageEvent(Message payload) : super(payload);
}

class DeleteSelectedMessages extends MessageEvent<Object> {
  DeleteSelectedMessages() : super(null);
}