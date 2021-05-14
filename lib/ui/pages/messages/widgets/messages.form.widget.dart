import 'package:flutter/material.dart';
import 'package:flutterbkd/bloc/messages/messages.actions.dart';
import 'package:flutterbkd/bloc/messages/messages.bloc.dart';
import 'package:flutterbkd/model/contacts.model.dart';
import 'package:flutterbkd/model/message.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageFormWidget extends StatelessWidget {
  TextEditingController textEditingController = new TextEditingController();
  Contact contact;

  MessageFormWidget(this.contact);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
          ),
          IconButton(icon: Icon(Icons.send), onPressed: () {
            var message = new Message(type: 'sent', contactID: contact.id, content: textEditingController.text, selected: false);
            context.read<MessagesBloc>().add(new AddNewMessageEvent(message));
            textEditingController.text = '';
          })
        ],
      )
    );

  }
}
