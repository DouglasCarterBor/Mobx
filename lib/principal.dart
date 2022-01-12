import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_aula/controller.dart';
import 'package:mobx_aula/item_controller.dart';
import 'package:mobx_aula/principal_controller.dart';
import 'package:provider/provider.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  final PrincipalController _principalController = PrincipalController();

  _dialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text("Adicionar item"),
            content: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite uma descrição..."),
              onChanged: _principalController.setNovoItem,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Cancelar",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  _principalController.adicionarItem();
                  Navigator.pop(context);
                },
                child: const Text(
                  "Salvar",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    final controller = Provider.of<Controller>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.email,
          style: const TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: _principalController.listaItens.length,
            itemBuilder: (_, indice) {
              //ITEM É DO TIPO ITEM CONTROLLER
              var item = _principalController.listaItens[indice];
              return Observer(
                builder: (_) {
                  return ListTile(
                    title: Text(
                      item.titulo,
                      style: TextStyle(
                          decoration:
                              item.marcado ? TextDecoration.lineThrough : null),
                    ),
                    leading: Checkbox(
                      value: item.marcado,
                      //onChanged: (bool? value) {  },
                      onChanged: item.alterarMarcado,
                    ),
                    onTap: () {
                        item.marcado = !item.marcado;
                    },
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _dialog();
        },
      ),
    );
  }
}
