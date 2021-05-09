import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbkd/bloc/contacts.bloc.dart';
import 'package:flutterbkd/repositories/contacts.repo.dart';
import 'package:flutterbkd/ui/pages/contacts/contacts.page.dart';
import 'package:get_it/get_it.dart';

import 'bloc/contacts.bloc.dart';
import 'bloc/contacts.bloc.dart';
import 'bloc/contacts.state.dart';
import 'bloc/enums/enums.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => new ContactsRepository());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => new ContactsBloc(
        initialState:
              new ContactsState(
                  contacts: [],
                  requestState: RequestState.NONE,
                  errorMessage: ''),
        contactsRepository : GetIt.instance<ContactsRepository>()),

        )
      ],
      child: MaterialApp(
        title: 'Contacts App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {'/contacts': (context) => ContactsPage()},
        initialRoute: '/contacts',
      ),
    );
  }
}
