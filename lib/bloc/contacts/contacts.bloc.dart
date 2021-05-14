import 'package:bloc/bloc.dart';
import 'package:flutterbkd/bloc/messages/messages.actions.dart';
import 'package:flutterbkd/bloc/messages/messages.bloc.dart';
import 'package:flutterbkd/model/contacts.model.dart';
import 'package:flutterbkd/repositories/contacts.repo.dart';

import 'contacts.actions.dart';
import 'contacts.state.dart';
import '../enums/enums.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsRepository contactsRepository;
  MessagesBloc messagesBloc;

  ContactsBloc({ContactsState initialState, this.contactsRepository, this.messagesBloc}) : super(initialState);

  @override
  Stream<ContactsState> mapEventToState(ContactsEvent event) async* {
    if(event is LoadAllContactsEvent) { // is equivalant of instanceof
      yield ContactsState(contacts: state.contacts, requestState: RequestState.LOADING, errorMessage: '', currentEvent: event);
      try {
        var contacts = await contactsRepository.allContacts();
        print(contacts[0]);
        yield ContactsState(contacts: contacts, requestState: RequestState.LOADED, errorMessage: '', currentEvent: event, currentContact: contacts[0]);
        messagesBloc.add(new MessagesByContactEvent(contacts[0]));
      } catch (e) {
        yield ContactsState(contacts: state.contacts, requestState: RequestState.ERROR, errorMessage: e.message, currentEvent: event);
      }
    }  else if(event is LoadStudentsEvent) {
      yield ContactsState(contacts: state.contacts, requestState: RequestState.LOADING, errorMessage: '', currentEvent: event);
      try {
        var contacts = await contactsRepository.contactsByType('Student');
        yield ContactsState(contacts: contacts, requestState: RequestState.LOADED, errorMessage: '', currentEvent: event);
      } catch (e) {
        yield ContactsState(contacts: state.contacts, requestState: RequestState.ERROR, errorMessage: e.message, currentEvent: event);
      }
    } else if(event is LoadDevelopersEvent) {
      yield ContactsState(contacts: state.contacts, requestState: RequestState.LOADING, errorMessage: '', currentEvent: event);
      try {
        var contacts = await contactsRepository.contactsByType('Developer');
        yield ContactsState(contacts: contacts, requestState: RequestState.LOADED, errorMessage: '', currentEvent: event);
      } catch (e) {
        yield ContactsState(contacts: state.contacts, requestState: RequestState.ERROR, errorMessage: e.message, currentEvent: event);
      }
    }
  }

}