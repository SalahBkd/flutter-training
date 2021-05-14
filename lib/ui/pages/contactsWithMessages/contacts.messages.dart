import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbkd/bloc/contacts/contacts.actions.dart';
import 'package:flutterbkd/bloc/contacts/contacts.bloc.dart';
import 'package:flutterbkd/bloc/contacts/contacts.state.dart';
import 'package:flutterbkd/bloc/enums/enums.dart';
import 'package:flutterbkd/bloc/messages/messages.actions.dart';
import 'package:flutterbkd/bloc/messages/messages.bloc.dart';
import 'package:flutterbkd/bloc/messages/messages.state.dart';
import 'package:flutterbkd/ui/pages/messages/widgets/messages.form.widget.dart';
import 'package:flutterbkd/ui/pages/messages/widgets/messages.list.widget.dart';
import 'package:flutterbkd/ui/shared/error.retry.action.dart';

class ContactsWithMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<ContactsBloc>().add(new LoadAllContactsEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts With Messages'),
      ),
      body: BlocBuilder<ContactsBloc, ContactsState>(
        builder: (context, state) {
          if(state.requestState == RequestState.LOADING) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if(state.requestState == RequestState.ERROR) {
            return ErrorRetryMessage(errorMessage: 'Internet Error...!', onAction: () {
              context.read<ContactsBloc>().add(state.currentEvent);
            },);
          } else if(state.requestState == RequestState.LOADED) {
            return Column(
                children: [
                  SizedBox(
                    height: 140,
                    child: ListView.builder(
                      itemCount: state.contacts.length,
                      itemBuilder: (context, index) =>
                          Padding(
                            padding: EdgeInsets.all(7.0),
                            child: InkWell(
                              onTap: () {
                                context.read<MessagesBloc>().add(new MessagesByContactEvent(state.contacts[index]));
                              },
                              child: BlocBuilder<MessagesBloc, MessagesState>(
                                builder: (context, messagesState) => Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: (messagesState.currentContact == state.contacts[index]) ? 3 : 1,
                                          color: Colors.blueAccent
                                      )
                                  ),
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                      children: [
                                        CircleAvatar(child: Text(
                                            '${state.contacts[index].profile}'),),
                                        Text('${state.contacts[index].name}',),
                                        Text('${state.contacts[index].type}',),
                                      ]
                                  ),
                                ),
                              ),
                            ),
                          ),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
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
                  MessageFormWidget(state.currentContact)
                ]
            );
          } else {
            return Container();
          }

        }
      ),
    );
  }
}
