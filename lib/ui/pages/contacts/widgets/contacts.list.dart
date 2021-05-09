import 'package:flutter/material.dart';
import 'package:flutterbkd/model/contacts.model.dart';

class ContactsList extends StatelessWidget {
  List<Contact> contacts;

  ContactsList({this.contacts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(height: 4, color: Colors.blue,),
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(child: Text('${contacts[index].profile}')),
                  SizedBox(width: 16,),
                  Text("${contacts[index].name}"),
                ],
              ),
              CircleAvatar(child: Text('${contacts[index].score}'))
            ],
          ),
        );
      },
    );
  }
}
