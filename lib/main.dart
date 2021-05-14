import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbkd/ui/pages/contactsWithMessages/contacts.messages.dart';
import 'bloc/contacts/contacts.bloc.dart';
import 'bloc/contacts/contacts.state.dart';
import 'package:flutterbkd/bloc/messages/messages.bloc.dart';
import 'package:flutterbkd/bloc/messages/messages.state.dart';
import 'package:flutterbkd/repositories/contacts.repo.dart';
import 'package:flutterbkd/repositories/messages.repo.dart';
import 'package:flutterbkd/ui/pages/contacts/contacts.page.dart';
import 'package:flutterbkd/ui/pages/messages/messages.contacts.dart';
import 'package:get_it/get_it.dart';

import 'bloc/enums/enums.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => new ContactsRepository());
  GetIt.instance.registerLazySingleton(() => new MessagesRepository());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => new MessagesBloc(
              initialState: MessagesState.initialState(),
              messagesRepository: GetIt.instance<MessagesRepository>()),
        ),
        BlocProvider(
          create: (context) => new ContactsBloc(
              initialState: new ContactsState(
                  contacts: [],
                  requestState: RequestState.NONE,
                  errorMessage: ''),
              contactsRepository: GetIt.instance<ContactsRepository>(),
              messagesBloc: context.read<MessagesBloc>()),
        ),

      ],
      child: MaterialApp(
        title: 'Contacts App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/contacts': (context) => ContactsPage(),
          '/messages': (context) => MessagesPage(),
          '/contactsWithMessages': (context) => ContactsWithMessages()
        },
        initialRoute: '/contactsWithMessages',
      ),
    );
  }
}
