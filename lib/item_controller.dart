import 'package:mobx/mobx.dart';
part 'item_controller.g.dart';

class ItemController = ItemControllerBase with _$ItemController;

//A UTILIZAÇÃO DO MIXIN STORE É PARA GERAÇÃO DOS CÓDIGOS AUTOMATICOS

abstract class ItemControllerBase with Store {

  ItemControllerBase(this.titulo);

  final String titulo;

  @observable
  bool marcado = false;

  void alterarMarcado(bool? valor) => marcado = valor as bool;

}
