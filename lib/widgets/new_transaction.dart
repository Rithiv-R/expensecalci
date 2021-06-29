import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;

  NewTransaction(this.addtx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final t1 = TextEditingController();

  final t2 = TextEditingController();

  void submit() {
    final titlecontroller = t1.text;
    final amountcontroller = double.parse(t2.text);

    if (titlecontroller.isEmpty || amountcontroller <= 0) {
      return;
    }
    widget.addtx(t1.text, double.parse(t2.text));

    Navigator.of(context).pop();
  }

  Widget build(BuildContext context) {
    return Card(
        child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                    controller: t1,
                  ),
                  new Padding(padding: EdgeInsets.only(top: 10)),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                    controller: t2,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => submit(),
                  ),
                  new Padding(padding: EdgeInsets.only(top: 20)),
                  FlatButton(
                    onPressed: submit,
                    child: Text("ADD TRANSCATIONS"),
                    color: Colors.amberAccent,
                  ),
                ])));
  }
}
