import 'package:flutter/material.dart';
import 'package:grein/components/editor.dart';
import 'package:grein/models/contact.dart';

// ignore: camel_case_types
class ContactsForm extends StatefulWidget {
  @override
  _ContactsFormState createState() => _ContactsFormState();
}

class _ContactsFormState extends State<ContactsForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            /*Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                ),
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Account Number',
              ),
              style: TextStyle(fontSize: 16.0),
              keyboardType: TextInputType.number,
            ),*/
            Editor(
              rotulo: 'Full Name',
              controlador: _nameController,
            ),
            Editor(
              rotulo: 'Account Number',
              dica: '0000',
              controlador: _accountNumberController,
              tipoKeyboard: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('Create'),
                  onPressed: () {
                    final String name = _nameController.text;
                    final int accountNumber =
                        int.tryParse(_accountNumberController.text);
                    final Contact newContact = Contact(name, accountNumber);
                    Navigator.pop(context, newContact);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
