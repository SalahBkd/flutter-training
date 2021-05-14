import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterbkd/bloc/enums/enums.dart';
import 'package:flutterbkd/bloc/messages/messages.actions.dart';
import 'package:flutterbkd/bloc/messages/messages.bloc.dart';
import 'package:flutterbkd/bloc/messages/messages.state.dart';
import 'package:flutterbkd/model/contacts.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbkd/ui/pages/messages/widgets/contact.info.widget.dart';
import 'package:flutterbkd/ui/pages/messages/widgets/messages.form.widget.dart';
import 'package:flutterbkd/ui/pages/messages/widgets/messages.list.widget.dart';
import 'package:flutterbkd/ui/shared/error.retry.action.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesPage extends StatelessWidget {
  Contact contact;

  @override
  Widget build(BuildContext context) {
    this.contact = ModalRoute.of(context).settings.arguments;
    context.read<MessagesBloc>().add(MessagesByContactEvent(contact));

    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        actions: [
          BlocBuilder<MessagesBloc, MessagesState>(
            builder: (context, state) {
              if(state.selectedMessages.length > 0) {
                return IconButton(icon: Icon(Icons.restore_from_trash), onPressed: () {
                  context.read<MessagesBloc>().add(new DeleteSelectedMessages());
                },);
              } else {
                return Container();
              }
            },
          )
        ],
      ),
      body: Center(
          child: Column(
        children: [
          ContactInfoWidget(this.contact),
          Expanded(
            child: BlocBuilder<MessagesBloc, MessagesState>(
              builder: (context, state) {
                if (state.requestState == RequestState.LOADING) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.requestState == RequestState.ERROR) {
                  return ErrorRetryMessage(
                    errorMessage: state.errorMessage,
                    onAction: () {
                      context.read<MessagesBloc>().add(state.currentEvent);
                    },
                  );
                } else if (state.requestState == RequestState.LOADED) {
                  return MessagesList(state.messages);
                } else {
                  return Container();
                }
              },
            ),
          ),
          MessageFormWidget(contact)
        ],
      )),
    );
  }
}
