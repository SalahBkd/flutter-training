import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbkd/bloc/messages/messages.actions.dart';
import 'package:flutterbkd/bloc/messages/messages.bloc.dart';
import 'package:flutterbkd/model/message.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageItemWidget extends StatelessWidget {
  Message message;

  MessageItemWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: message.selected,
      selectedTileColor: Colors.black12,
      onLongPress: () {
        context.read<MessagesBloc>().add(new SelectMessageEvent(message));
      },
      title: Row(
        mainAxisAlignment: (message.type == 'sent') ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          (message.type == 'sent') ? SizedBox(width: 0,) : SizedBox(width: 40,),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(20),
              color: (message.type == 'sent') ? Color.fromARGB(20, 0, 255, 0) : Color.fromARGB(20, 255, 0, 0),
              child: Text('${message.content} - ${message.date.hour}:${message.date.minute}'),
            ),
          ),
          (message.type == 'sent') ? SizedBox(width: 40,) : SizedBox(width: 0,)
        ],
      ),
    );
  }
}
