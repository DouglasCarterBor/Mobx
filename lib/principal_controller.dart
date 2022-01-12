import 'package:mobx/mobx.dart';
import 'package:mobx_aula/item_controller.dart';
part 'principal_controller.g.dart';

class PrincipalController = PrincipalControllerBase with _$PrincipalController;

//A UTILIZAÇÃO DO MIXIN STORE PARA GERAÇÃO DOS CÓDIGOS AUTOMATICOS
abstract class PrincipalControllerBase with Store{

  @observable
  String novoItem = "";

  @action
  void setNovoItem(String valor) => novoItem = valor;

  //APENAS VERIFICA SE A LISTA FOI ALTERADA

  ObservableList<ItemController> listaItens = ObservableList<ItemController>();
  //Douglas
  // nome: Curso Flutter marcado: pode ser true ou false

  //SEM OBSERVERLIST
  // @observable
  // List<String> listaItens = [];

  //ESPAÇO EM MEMÓRIA: 005

  @action
  void adicionarItem(){

    listaItens.add(ItemController(novoItem));

    //USANDO SEM OBSERVERLIST
    // listaItens = List.from(listaItens..add(novoItem));

    // print(novoItem);
    // print(listaItens);
    // print(listaItens.elementAt(0));
  }

}