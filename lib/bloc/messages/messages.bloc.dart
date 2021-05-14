import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterbkd/bloc/enums/enums.dart';
import 'package:flutterbkd/bloc/messages/messages.actions.dart';
import 'package:flutterbkd/bloc/messages/messages.state.dart';
import 'package:flutterbkd/model/message.model.dart';
import 'package:flutterbkd/repositories/messages.repo.dart';

class MessagesBloc extends Bloc<MessageEvent, MessagesState> {
  MessagesRepository messagesRepository;

  MessagesBloc({@required MessagesState initialState, this.messagesRepository})
      : super(initialState);

  @override
  Stream<MessagesState> mapEventToState(MessageEvent event) async* {
    if (event is MessagesByContactEvent) {
      yield MessagesState(
          messages: state.messages,
          requestState: RequestState.LOADING,
          currentEvent: event, selectedMessages: state.selectedMessages, currentContact: event.payload);
      try {
        List<Message> messages =
            await messagesRepository.messagesByContact(event.payload.id);
        yield MessagesState(
            messages: messages,
            requestState: RequestState.LOADED,
            errorMessage: '',
            currentEvent: event, selectedMessages: state.selectedMessages, currentContact: event.payload);
      } catch (e) {
        yield MessagesState(
            messages: state.messages,
            requestState: RequestState.ERROR,
            errorMessage: e.message,
            currentEvent: event, selectedMessages: state.selectedMessages, currentContact: event.payload);
      }
    } else if (event is AddNewMessageEvent) {
      try {
        event.payload.date = DateTime.now();
        var message = await messagesRepository.addNewMessage(event.payload);
        List<Message> updatedMessages = [...state.messages];
        updatedMessages.add(message);
        yield MessagesState(
            messages: updatedMessages,
            requestState: RequestState.LOADED,
            errorMessage: '',
            currentEvent: event, selectedMessages: state.selectedMessages);
      } catch (e) {
        yield MessagesState(
            messages: state.messages,
            requestState: RequestState.ERROR,
            errorMessage: e.message,
            currentEvent: event, selectedMessages: state.selectedMessages);
      }
    } else if (event is SelectMessageEvent) {
      List<Message> messages = state.messages;
      List<Message> selectedMessages = [...state.selectedMessages];

      for (Message msg in messages) {
        if (msg.id == event.payload.id) {
          msg.selected = !msg.selected;
        }
        if (msg.selected == true) {
          selectedMessages.add(msg);
        } else {
          selectedMessages.removeWhere((element) => element.id == msg.id);
        }
      }

      yield MessagesState(
          messages: messages,
          requestState: RequestState.LOADED,
          errorMessage: '',
          currentEvent: event,
          selectedMessages: selectedMessages);

    } else if (event is DeleteSelectedMessages) {
      List<Message> messages = state.messages;
      List<Message> selectedMessages = [...state.selectedMessages];

      for (Message msg in selectedMessages) {
        try {
          await messagesRepository.deleteSelectedMessage(msg);
          messages.removeWhere((element) => element.id == msg.id);
          yield MessagesState(
              messages: messages,
              requestState: RequestState.LOADED,
              errorMessage: '',
              currentEvent: event,
              selectedMessages: selectedMessages);

        } catch (e) {
          yield MessagesState(
              messages: messages,
              requestState: RequestState.ERROR,
              errorMessage: '',
              currentEvent: event,
              selectedMessages: selectedMessages);
        }
      }
    }
  }
}
