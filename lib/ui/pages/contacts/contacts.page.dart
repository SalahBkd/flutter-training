import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbkd/bloc/contacts/contacts.bloc.dart';
import 'package:flutterbkd/bloc/contacts/contacts.state.dart';
import 'package:flutterbkd/bloc/enums/enums.dart';
import 'package:flutterbkd/ui/pages/contacts/widgets/contacts.bar.buttons.dart';
import 'package:flutterbkd/ui/pages/contacts/widgets/contacts.list.dart';
import 'package:flutterbkd/ui/shared/error.retry.action.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Contacts Page'),),
        body: Column(
          children: [
            ContactsBarButtons(),
            Expanded(
              child: BlocBuilder<ContactsBloc, ContactsState>(builder: (context, state) {
                if (state.requestState == RequestState.LOADING) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.requestState == RequestState.ERROR) {
                  return ErrorRetryMessage(errorMessage: state.errorMessage, onAction: () {
                    context.read<ContactsBloc>().add(state.currentEvent);
                  },);
                } else if (state.requestState == RequestState.LOADED) {
                  return ContactsList(contacts: state.contacts);
                } else {
                  return Container();
                }
              }),
            ),
          ],
        ),
    );
  }
}
