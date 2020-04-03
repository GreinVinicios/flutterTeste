import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      ByteBankApp(),
    );

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumerConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferências'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorCampoNumerConta,
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000-0',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                labelText: 'Valor',
                hintText: '0.00',
                icon: Icon(Icons.monetization_on),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () {
              final String numeroConta = _controladorCampoNumerConta.text;
              final double valor = double.tryParse(_controladorCampoValor.text);

              if (numeroConta != null && valor != null) {
                final transferenciaCriada = Transferencia(valor, numeroConta);
                debugPrint('$transferenciaCriada');
              }
            },
          )
        ],
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.01, '35403-4')),
          ItemTransferencia(Transferencia(200.00, '35403-4')),
          ItemTransferencia(Transferencia(301.00, '35403-4')),
        ],
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final String numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }


}
