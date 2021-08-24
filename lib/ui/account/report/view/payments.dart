import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/modal/modal.dart';


class PaymentsViewPage extends StatelessWidget {
  final InvoiceModal _modal;

  const PaymentsViewPage(
      this._modal, {
        Key? key,
      }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PeriodsModal services = PeriodsModal.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Payments View')),
      body: Container(),
    );
  }
}
