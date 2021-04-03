import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvc_application/view.dart';
import 'package:perboni_erp_fenix/src/view/pessoa_contato_persiste_page.dart';
import 'package:perboni_erp_fenix/src/view/pessoa_lista_page.dart';

import 'Banco_agencia_persiste_page.dart';
import 'banco_persiste_page.dart';

class PerboniErpFenixApp extends AppView {
  PerboniErpFenixApp()
      : super(
            title: 'PERBONY ERP Fenix',
            routes: {
              '/BancoAdd': (BuildContext context) => BancoPersistePage(),
              '/BancoAgenciaAdd': (BuildContext context) =>
                  BancoAgenciaPersistePage(),
              '/PessoaAdd': (BuildContext context) => PessoaListaPage(),
              '/PessoaContatoAdd': (BuildContext context) =>
                  PessoaContatoPersistePage(),
            },
            home: PessoaListaPage(), //BancoListaPage(),
            theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.orangeAccent[400],
            ));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
