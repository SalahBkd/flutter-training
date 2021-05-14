import 'package:flutter/material.dart';
import 'package:flutterbkd/model/contacts.model.dart';

class ContactInfoWidget extends StatelessWidget {
  Contact contact;

  ContactInfoWidget(this.contact);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(child: Text('${contact.profile}'),),
          SizedBox(width: 10,),
          Text('${contact.name}')
        ],
      ),
    );
  }
}
