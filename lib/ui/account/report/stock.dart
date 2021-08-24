import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/component/route_name.dart';
import 'package:konnect/modal/modal.dart';

import 'package:konnect/component/component.dart';

class StockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PeriodsModal services = PeriodsModal.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Stock')),
      body: FutureBuilder(
        future: services.account.getStock(),
        builder: (_, AsyncSnapshot<List<StockModal>> snapshot) {
          var view = snapshotView(snapshot);
          if (view != null) return view;

          var _list = snapshot.data!;

          var controller = TextEditingController();

          return StatefulBuilder(builder: (_, setState) {
            controller.addListener(() => setState(() {
              String value = controller.text;
              if (value.isEmpty)
                _list = snapshot.data!;
              else
                _list = [];
              snapshot.data!.forEach((modal) {
                var name = modal.name!.toLowerCase();
                if (name.contains(value.toLowerCase())) {
                  _list.add(modal);
                }
              });
            }));
            return SearchListView(
              controller: controller,
              children: _list
                  .map((modal) => Card(
                color: Colors.grey[100],
                child: ListTile(
                  onTap: () => Navigator.pushNamed(
                    context,
                    STOCK_VIEW,
                    arguments: modal,
                  ),
                  title: Text(modal.name ?? 'Name'),
                ),
              ))
                  .toList(),
            );
          });
        },
      ),
    );
  }
}
