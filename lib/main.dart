import 'package:expense_calci/widgets/new_transaction.dart';
import 'package:expense_calci/widgets/transaction_list.dart';
import "package:flutter/material.dart";
import 'models/Transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "expense_calci",
      theme: ThemeData(
          primarySwatch: Colors.amber,
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                      title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )))),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transactions> _usertransactions = [
    /*Transactions(
      id: "T1", title: "SHOE PAIRS", amount: 300, date: DateTime.now()),
    Transactions(
      id: "T2", title: "WATER BOOTLE", amount: 100, date: DateTime.now()),*/
  ];

  void _addtransactions(String title_t, double amount_t) {
    final newTxt = Transactions(
      title: title_t,
      date: DateTime.now(),
      amount: amount_t,
      id: DateTime.now().toString(),
    );
    setState(() {
      _usertransactions.add(newTxt);
      print(_usertransactions);
    });
  }

  void _startNewTransactions(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addtransactions);
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("HomePage"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startNewTransactions(context),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        TransactionList(_usertransactions),
      ])),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startNewTransactions(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
