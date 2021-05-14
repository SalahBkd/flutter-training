import 'package:flutterbkd/bloc/enums/enums.dart';
import 'package:flutterbkd/bloc/messages/messages.actions.dart';
import 'package:flutterbkd/model/message.model.dart';

class MessagesState {
  List<Message> messages;
  RequestState requestState;
  String errorMessage;
  MessageEvent currentEvent;
  List<Message> selectedMessages = [];

  MessagesState(
      {this.messages, this.requestState, this.errorMessage, this.currentEvent, this.selectedMessages});

  MessagesState.initialState():
      messages = [], requestState = RequestState.NONE, errorMessage = '', currentEvent = null, selectedMessages = [];
}