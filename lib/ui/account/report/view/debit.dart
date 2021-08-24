import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/modal/modal.dart';

class DebitViewPage extends StatelessWidget {
  final InvoiceModal _modal;

  const DebitViewPage(
    this._modal, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Debit Note View')),
      body: Container(),
    );
  }
}
