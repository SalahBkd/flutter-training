import 'package:flutter/material.dart';
import 'package:flutterbkd/bloc/contacts/contacts.actions.dart';

import 'contacts.button.item.dart';

class ContactsBarButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContactsButtonItem(
              contactsEvent: new LoadAllContactsEvent(),
              buttonLabel: 'All Contacts'),
          ContactsButtonItem(
              contactsEvent: new LoadDevelopersEvent(), buttonLabel: 'Developers'),
          ContactsButtonItem(
              contactsEvent: new LoadStudentsEvent(), buttonLabel: 'Students'),
        ],
      ),
    );
  }
}
